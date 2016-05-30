/**
 * 
 */
package com.qinfenqi.mall.order.service.impl;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Colour;
import jxl.format.UnderlineStyle;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.qinfenqi.mall.bean.Count;
import com.qinfenqi.mall.bean.DeliverInfo;
import com.qinfenqi.mall.bean.Log;
import com.qinfenqi.mall.bean.ShopAddress;
import com.qinfenqi.mall.bill.dao.BillDao;
import com.qinfenqi.mall.center.dao.CenterDao;
import com.qinfenqi.mall.collar.dao.CollarDao;
import com.qinfenqi.mall.collar.query.CollarQuery;
import com.qinfenqi.mall.common.base.BaseService;
import com.qinfenqi.mall.common.constant.BizType;
import com.qinfenqi.mall.common.constant.Deliver;
import com.qinfenqi.mall.common.constant.DeliverStatus;
import com.qinfenqi.mall.common.constant.OrderStatus;
import com.qinfenqi.mall.common.helper.DeliverInfoHelper;
import com.qinfenqi.mall.common.helper.SMSSender;
import com.qinfenqi.mall.contract.bean.Contract;
import com.qinfenqi.mall.contract.dao.ContractDao;
import com.qinfenqi.mall.contract.query.ContractQuery;
import com.qinfenqi.mall.log.dao.LogDao;
import com.qinfenqi.mall.member.dao.MemberDao;
import com.qinfenqi.mall.member.query.MemberQuery;
import com.qinfenqi.mall.order.dao.OrderDao;
import com.qinfenqi.mall.order.query.OrderQuery;
import com.qinfenqi.mall.order.service.OrderService;
import com.qinfenqi.mall.system.bean.User;
import com.qinfenqi.mall.system.dao.UserDao;
import com.qinfenqi.mall.system.query.UserQuery;
import com.qinfenqi.mall.util.DateUtil;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月8日 下午2:36:27
 * @author Chang Yuxin
 * @version 1.0
 */
@Service("orderService")
public class OrderServiceImpl extends BaseService implements OrderService {

	private Logger logger = LoggerFactory.getLogger(OrderServiceImpl.class);
	@Resource
	private OrderDao orderDao;
	@Resource
	private CenterDao centerDao;
	@Resource
	private BillDao billDao;
	@Resource
	private UserDao userDao;
	@Resource
	private ContractDao contractDao;
	@Resource
	private MemberDao memberDao;
	@Resource
	private CollarDao collarDao;
	@Resource
	private LogDao logDao;

	@Override
	public ShopAddress getShopAddress(User user) {
		List<ShopAddress> list = centerDao.getAddressByUserId(user.getUserId());
		for (ShopAddress shopAddress : list) {
			if (shopAddress.getIsDefault() == 1) {
				return shopAddress;
			}
		}
		return null;
	}

	@Override
	public boolean createOrder(OrderQuery orderQuery, User user) {
		orderQuery.setUserId(user.getUserId());
		orderQuery.setOrderCode("QO-" + orderDao.queryOrderCode());
		orderQuery.setCreateTime(new Date());
		if(orderQuery.getOrderTypes() == 1){
			orderQuery.setOrderStatus(OrderStatus.CONTRACT_NO.getId());
		}
		if(orderQuery.getOrderTypes() == 2){
			orderQuery.setMonthPay(0);
			orderQuery.setMonths(0);
			orderQuery.setFinancialPay(0);
			orderQuery.setFinancialRate(0);
			orderQuery.setServicePay(0);
			orderQuery.setServiceRate(0);
			orderQuery.setOrderStatus(OrderStatus.READY_PAY.getId());
		}
		
		return orderDao.createOrder(orderQuery);
	}

	@Override
	public OrderQuery getOrderById(OrderQuery orderQuery) {
		return orderDao.getOrderById(orderQuery);
	}

	@Override
	public List<OrderQuery> getOrderList(OrderQuery orderQuery) {
		List<OrderQuery> list = orderDao.getOrderList(orderQuery);
		for (OrderQuery order : list) {
			DateTime dt = new DateTime(order.getCreateTime());
			dt = dt.plusMonths(order.getMonths());
			order.setStopTime(dt.toDate());
		}
		return list;
	}

	@Override
	public boolean saveDeliverInfoByOrderId(OrderQuery orderQuery, User user) {
		orderQuery.setDeliverTime(new Date());
		orderQuery.setDeliverStatus(DeliverStatus.ALREADY.getId());
		if ("ziti".equals(orderQuery.getDeliverName())) {
			orderQuery.setOrderStatus(OrderStatus.PAYMENTING.getId());
			saveOrderOpLog(orderQuery, user, "发货完成：用户自提!");
		} else {
			orderQuery.setOrderStatus(OrderStatus.DELIVER_COMPLETE.getId());
			saveOrderOpLog(orderQuery, user,
					"发货完成：快递单号：" + orderQuery.getDeliverCode() + ", 快递公司：" + Deliver.getName(orderQuery.getDeliverName()));
		}
		// 插入更新时间
		orderQuery.setUpdateTime(new Date());
		boolean result = orderDao.saveDeliverInfoByOrderId(orderQuery);
		// 如果保存成功，即发送短信通知，自提除外
		if (result && "ziti".equals(orderQuery.getDeliverName()) == false) {
			try {
				SMSSender.getInstance().send(orderQuery.getReceiveMobile(), "SMS_TEMP_5",
						new String[] { Deliver.getName(orderQuery.getDeliverName()), orderQuery.getDeliverCode() });
			} catch (IOException e) {
				String errMsg = "Send sms failure! trueName: " + orderQuery.getReceiveName() + ", mobile: " + orderQuery.getReceiveMobile()
						+ "tempId: SMS_TEMP_5";
				logger.error(errMsg, e);
			}
		}

		return result;
	}

	@Override
	public boolean cancelOrder(OrderQuery orderQuery) {
		// 查询订单
		orderQuery = orderDao.getOrderById(orderQuery);
		User user = new User();
		user.setUserId(orderQuery.getUserId());
		return cancelOrder(orderQuery, user);
	}

	@Override
	public boolean cancelOrder(OrderQuery orderQuery, User user) {
		// 查询订单
		orderQuery = orderDao.getOrderById(orderQuery);

		// 设置订单状态
		orderQuery.setOrderStatus(OrderStatus.ORDER_CANCEL.getId());

		// 取消订单
		orderQuery.setUpdateTime(new Date());
		
		boolean result = orderDao.updateOrderStatus(orderQuery);
		
		// 分期购买的订单
		if(orderQuery.getOrderTypes() == 1){
			if (result) {
				// 删除帐单
				billDao.deleteBills(orderQuery);
			}
			// 更新信用,如果没有签合同，取消订单不更新信用，因为信用是在签合同的时候扣掉的
			Contract contract = new Contract();
			contract.setOrderId(orderQuery.getOrderId());
			ContractQuery contractQuery = contractDao.getContractByOrderId(contract);
			
			// 如果是后台取消订单，需要查询用户类型
			if (user.getUserStyle() == 0) {
				UserQuery uq = new UserQuery();
				uq.setUserId(orderQuery.getUserId());
				user = userDao.getUserByUserId(uq);
			}
			// 如果已经签订合同
			if (null != contractQuery) {
				// 更改合同状态
				contractQuery.setOrderId(orderQuery.getOrderId());
				contractQuery.setContractStatus(3);
				contractDao.updateContract(contractQuery);
				if (user.getUserStyle() == 1) {
					MemberQuery mq = memberDao.getMemberByUserId(user.getUserId());
					mq.setCreditLimit(mq.getCreditLimit() + (orderQuery.getProductPrice() - orderQuery.getFirstPay()));
					mq.setUsedCreditLimit(mq.getUsedCreditLimit() - (orderQuery.getProductPrice() - orderQuery.getFirstPay()));
					memberDao.updateCreditLimit(mq);
				}
				if (user.getUserStyle() == 2) {
					CollarQuery cq = collarDao.getCollarByUserId(user.getUserId());
					cq.setCreditLimit(cq.getCreditLimit() + (orderQuery.getProductPrice() - orderQuery.getFirstPay()));
					cq.setUsedCreditLimit(cq.getUsedCreditLimit() - (orderQuery.getProductPrice() - orderQuery.getFirstPay()));
					collarDao.updateCreditLimit(cq);
				}
			}
		} 
		// 全款购买的订单
		if(orderQuery.getOrderTypes() == 2){
			
		}
		// TODO 如果有首付，退首付

		// 记录操作日志
		if (user.getUserStyle() == 0) {
			saveOrderOpLog(orderQuery, user, "取消订单");
		}
		return result;
	}

	@Override
	public boolean auditPass(OrderQuery orderQuery, User user) {
		
		orderQuery.setUpdateTime(new Date());
		orderQuery.setOrderStatus(OrderStatus.AUDIT_PASS.getId());
		saveOrderOpLog(orderQuery, user, "审核通过");
		return orderDao.updateOrderStatus(orderQuery);
	}

	/**
	 * 保存订单的操作记录
	 * 
	 * @param orderQuery
	 * @param user
	 * @param logDesc
	 */
	private void saveOrderOpLog(OrderQuery orderQuery, User user, String logDesc) {
		Log log = new Log();
		log.setBizType(BizType.ORDER.getId());
		log.setBizId(orderQuery.getOrderId());
		log.setUserId(user.getUserId());
		log.setUserName(user.getUserName());
		log.setCreateTime(new Date());
		log.setDescription(logDesc);
		logDao.createLog(log);
	}

	@Override
	public boolean auditNoPass(OrderQuery orderQuery, User user) {
		orderQuery.setOrderStatus(OrderStatus.AUDIT_NO_PASS.getId());
		saveOrderOpLog(orderQuery, user, "审核不通过：原因：" + orderQuery.getAuditOpinion());
		return orderDao.updateOrderStatus(orderQuery);
	}

	@Override
	public int getOrderCount(OrderQuery orderQuery) {
		return orderDao.getOrderCount(orderQuery);
	}

	@Override
	public DeliverInfo getDeliverInfo(OrderQuery orderQuery) {
		String content = DeliverInfoHelper.getDeliverInfo(orderQuery.getDeliverCode(), orderQuery.getDeliverName());
		Gson gson = new Gson();
		DeliverInfo di = gson.fromJson(content, DeliverInfo.class);
		return di;
	}

	@Override
	public String getOrderCounts() {
		List<Count> list = orderDao.getOrderCounts();
		String[] status = { "1", "2", "3", "4", "5", "6", "7" };
		return convertCountResult(status, list);
	}

	@Override
	public InputStream exportOrders(OrderQuery orderQuery) {
		// 将OutputStream转化为InputStream
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		putDataOnOutputStream(os, orderQuery);
		return new ByteArrayInputStream(os.toByteArray());
	}

	/**
	 * @param out
	 * @param orderQuery
	 */
	private void putDataOnOutputStream(ByteArrayOutputStream os, OrderQuery orderQuery) {
		orderQuery.setPage(false);
		List<OrderQuery> orders = orderDao.getOrderList(orderQuery);

		WritableWorkbook workbook;
		try {
			workbook = Workbook.createWorkbook(os);

			WritableSheet sheet = workbook.createSheet("Sheet1", 0);
			// 设置单元格的Title文字格式
			WritableFont wf_t = new WritableFont(WritableFont.ARIAL, 11, WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE,
					Colour.BLACK);
			WritableCellFormat wcf = new WritableCellFormat(wf_t);
			wcf.setVerticalAlignment(VerticalAlignment.CENTRE);
			wcf.setAlignment(Alignment.CENTRE);

			// 设置单元格的Content文字格式
			WritableFont wf_c = new WritableFont(WritableFont.ARIAL, 11, WritableFont.NO_BOLD, false, UnderlineStyle.NO_UNDERLINE,
					Colour.BLACK);
			WritableCellFormat wcf_c = new WritableCellFormat(wf_c);
			wcf_c.setVerticalAlignment(VerticalAlignment.CENTRE);
			wcf_c.setAlignment(Alignment.CENTRE);

			sheet.addCell(new Label(0, 0, "订单编号", wcf));
			sheet.addCell(new Label(1, 0, "产品名称", wcf));
			sheet.addCell(new Label(2, 0, "产品数量", wcf));
			sheet.addCell(new Label(3, 0, "订单总额", wcf));
			sheet.addCell(new Label(4, 0, "分期首付", wcf));
			sheet.addCell(new Label(5, 0, "分期月数", wcf));
			sheet.addCell(new Label(6, 0, "分期月供", wcf));
			sheet.addCell(new Label(7, 0, "起始时间", wcf));
			sheet.addCell(new Label(8, 0, "结束时间", wcf));
			sheet.addCell(new Label(9, 0, "收货人名字", wcf));
			sheet.addCell(new Label(10, 0, "收货人电话", wcf));
			sheet.addCell(new Label(11, 0, "收货人地址", wcf));
			sheet.addCell(new Label(12, 0, "创建时间", wcf));
			sheet.addCell(new Label(13, 0, "状态", wcf));

			sheet.setColumnView(0, 15);
			sheet.setColumnView(1, 10);
			sheet.setColumnView(2, 30);
			sheet.setColumnView(3, 35);
			sheet.setColumnView(4, 10);
			sheet.setColumnView(5, 10);
			sheet.setColumnView(6, 30);
			sheet.setColumnView(7, 15);
			sheet.setColumnView(8, 15);
			sheet.setColumnView(9, 15);
			sheet.setColumnView(10, 15);
			sheet.setColumnView(11, 15);
			sheet.setColumnView(12, 15);
			sheet.setColumnView(13, 15);

			for (int i = 0; i < orders.size(); i++) {
				OrderQuery oq = orders.get(i);
				sheet.addCell(new Label(0, i + 1, oq.getOrderCode(), wcf_c));
				sheet.addCell(new Label(1, i + 1, oq.getProductName(), wcf_c));
				sheet.addCell(new Label(2, i + 1, oq.getQuantity() + "", wcf_c));
				sheet.addCell(new Label(3, i + 1, oq.getProductPrice() + "", wcf_c));
				sheet.addCell(new Label(4, i + 1, oq.getFirstPay() + "", wcf_c));
				sheet.addCell(new Label(5, i + 1, oq.getMonths() + "", wcf_c));
				sheet.addCell(new Label(6, i + 1, oq.getMonthPay() + "", wcf_c));
				sheet.addCell(new Label(7, i + 1, DateUtil.format(oq.getCreateTime(), DateUtil.DATE_FORMAT), wcf_c));
				sheet.addCell(new Label(8, i + 1, DateUtil.format(oq.getStopTime(), DateUtil.DATE_FORMAT), wcf_c));
				sheet.addCell(new Label(9, i + 1, oq.getReceiveName(), wcf_c));
				sheet.addCell(new Label(10, i + 1, oq.getReceiveMobile(), wcf_c));
				sheet.addCell(new Label(11, i + 1, oq.getReceiveAddress(), wcf_c));
				sheet.addCell(new Label(12, i + 1, DateUtil.format(oq.getCreateTime(), DateUtil.DEFAULT_FORMAT), wcf_c));
				sheet.addCell(new Label(13, i + 1, OrderStatus.getName(oq.getOrderStatus() + ""), wcf_c));
			}
			workbook.write();
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean saveReceiveInfoByOrderId(OrderQuery orderQuery, User user) {
		saveOrderOpLog(orderQuery, user, "修改收货人信息!");
		return orderDao.saveReceiveInfoByOrderId(orderQuery);
	}

	@Override
	public boolean returnFirstPay(OrderQuery orderQuery, User user) {
		saveOrderOpLog(orderQuery, user, "退还首付完成!");
		orderQuery.setFirstPayStatus(3);
		orderQuery.setUpdateTime(new Date());
		return orderDao.returnFirstPay(orderQuery);
	}
}
