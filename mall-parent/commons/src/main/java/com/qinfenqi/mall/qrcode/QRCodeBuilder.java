package com.qinfenqi.mall.qrcode;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Hashtable;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.qinfenqi.mall.common.constant.Encoding;

/**
 * @Title: 二维码生成类
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月25日 下午4:45:57
 * @author Chang Yuxin
 * @version 1.0
 */
public class QRCodeBuilder {
	private static final Logger logger = LoggerFactory.getLogger(QRCodeBuilder.class);
	private static final int BLACK = 0xFF000000;
	private static final int WHITE = 0xFFFFFFFF;

	/**
	 * @param width
	 * @param height
	 * @param output
	 * @param qrctnt
	 * @return String
	 */
	public static void build(int width, int height, String imageFile, String qrctnt) {
		String format = "png";
		Hashtable<EncodeHintType, String> hints = new Hashtable<EncodeHintType, String>();
		hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
		BitMatrix bitMatrix;
		try {
			bitMatrix = new MultiFormatWriter().encode(qrctnt, BarcodeFormat.QR_CODE, width, height, hints);
			File outputFile = new File(imageFile);
			MatrixToImageWriter.writeToFile(bitMatrix, format, outputFile);
		} catch (WriterException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		logger.info("Create " + qrctnt + " qrcode successfully!......");
	}

	/**
	 * @param width
	 * @param height
	 * @param output
	 * @param qrcodeContent
	 * @param logoPath
	 * @throws WriterException
	 * @throws IOException
	 */
	public static void buildWithLogo(int width, int height, String imageFile, String qrcodeContent, String logoPath)
			throws WriterException, IOException {
		String format = "png";
		Hashtable<EncodeHintType, String> hints = new Hashtable<EncodeHintType, String>();
		hints.put(EncodeHintType.CHARACTER_SET, Encoding.UTF_8);
		BitMatrix bitMatrix = new MultiFormatWriter().encode(qrcodeContent, BarcodeFormat.QR_CODE, width, height, hints);
		File qrcodeFile = new File(imageFile);
		writeToFile(bitMatrix, format, qrcodeFile, logoPath);
		logger.info("create qrcode successfully!......");
	}

	/**
	 * 
	 * @param matrix
	 *            二维码矩阵相关
	 * @param format
	 *            二维码图片格式
	 * @param file
	 *            二维码图片文件
	 * @param logoPath
	 *            logo路径
	 * @throws IOException
	 */
	public static void writeToFile(BitMatrix matrix, String format, File file, String logoPath) throws IOException {
		BufferedImage image = toBufferedImage(matrix);
		Graphics2D gs = image.createGraphics();

		// 载入logo
		Image img = ImageIO.read(new File(logoPath));
		gs.drawImage(img, 59, 59, null);
		gs.dispose();
		img.flush();
		if (!ImageIO.write(image, format, file)) {
			throw new IOException("Could not write an image of format " + format + " to " + file);
		}
	}

	/**
	 * @param matrix
	 * @return
	 */
	public static BufferedImage toBufferedImage(BitMatrix matrix) {
		int width = matrix.getWidth();
		int height = matrix.getHeight();
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		for (int x = 0; x < width; x++) {
			for (int y = 0; y < height; y++) {
				image.setRGB(x, y, matrix.get(x, y) ? BLACK : WHITE);
			}
		}
		return image;
	}

	public static void main(String[] args) {
		try {
			buildWithLogo(360, 360, "d:/qrcode/collar1.png", "http://www.baidu.com", "d:/qrcode/weixin.jpg");
			//build(360, 360, "d:/qrcode/collar.png", "http://www.qinfenqi.com/collar/regist.html");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}