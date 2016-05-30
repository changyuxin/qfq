/**
 * 
 */
package com.qinfenqi.mall.admin.system.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qinfenqi.mall.admin.system.query.ResourceQuery;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月27日 下午5:50:04
 * @author Chang Yuxin
 * @version 1.0
 */
@Repository
public interface ResourceDao {

	/**
	 * @param ids
	 * @return
	 */
	List<ResourceQuery> getResourceListByIds(int[] ids);

	/**
	 * @return
	 */
	List<ResourceQuery> getAllResourceList();

	/**
	 * @param resourceQuery
	 * @return
	 */
	List<ResourceQuery> getResourceList(ResourceQuery resourceQuery);

	/**
	 * @param resourceQuery
	 * @return
	 */
	int getResourceCount(ResourceQuery resourceQuery);

	/**
	 * @param resourceQuery
	 * @return
	 */
	boolean createResource(ResourceQuery resourceQuery);

	/**
	 * @param resourceQuery
	 * @return
	 */
	ResourceQuery getResourceById(ResourceQuery resourceQuery);

	/**
	 * @param resourceQuery
	 * @return
	 */
	boolean modifyResource(ResourceQuery resourceQuery);

	/**
	 * @param resourceQuery
	 * @return
	 */
	boolean deleteResource(ResourceQuery resourceQuery);

	/**
	 * @param resourceQuery
	 * @return
	 */
	boolean enableResource(ResourceQuery resourceQuery);

}
