package com.qinfenqi.mall.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
/**
 * <p>Title: 使用java.security.MessageDigest类写的一个工具类用来获取MD5码</p> 
 * <p>Description:  </p>
 * <p>Copyright: Copyright (c) 2003 - 2008 </p>
 * <p>Company: Run Technology Co.Ltd. Beijing </p>
 * <p>bulid: 2013-12-18 下午03:06:29 </p>
 * @author Chang Yuxin
 * @version 1.0
 * @see java.security.MessageDigest
 */
public class MD5Util {

	/**
	 * 默认的密码字符串组合，apache校验下载的文件的正确性用的就是默认的这个组合
	 */
	protected static char hexDigits[] = { 
		'0', '1', '2', '3', 
		'4', '5', '6', '7', 
		'8', '9', 'a', 'b', 
		'c', 'd', 'e', 'f' 
	};
	protected static MessageDigest messagedigest = null;
	static {
		try {
			messagedigest = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 对字符串进行加密
	 * 
	 * @param str
	 * @return String
	 * @throws NoSuchAlgorithmException 
	 */
	public static String encodeString(String str) throws NoSuchAlgorithmException{
		return encodeByte(str.getBytes());
	}
	
	/**
     * 对byte数组的数据进行加密
     * @param buff
     * @return String
	 * @throws NoSuchAlgorithmException 
     */
    public static String encodeByte(byte[] buff) throws NoSuchAlgorithmException {
        return bufferToHex(messagedigest.digest(buff));
    }
    
	/**
	 * @param bytes
	 * @return String
	 */
	private static String bufferToHex(byte bytes[]) {
		return bufferToHex(bytes, 0, bytes.length);
	}
	
	/**
	 * 适用于上G大的文件
	 * 
	 * @param file
	 * @return
	 * @throws IOException 
	 * @throws NoSuchAlgorithmException 
	 */

	public static String getFileMD5String(File file) throws IOException, NoSuchAlgorithmException{
		@SuppressWarnings("resource")
		FileInputStream in = new FileInputStream(file);
		FileChannel ch = in.getChannel();
		MappedByteBuffer byteBuffer = ch.map(FileChannel.MapMode.READ_ONLY, 0, file.length());
		messagedigest.update(byteBuffer);
		return bufferToHex(messagedigest.digest());
	}
	
	
	/**
	 * @param bytes
	 * @param m
	 * @param n
	 * @return String
	 */
	private static String bufferToHex(byte bytes[], int m, int n) {
		StringBuffer stringbuffer = new StringBuffer(2 * n);
		int k = m + n;
		for (int l = m; l < k; l++) {
			appendHexPair(bytes[l], stringbuffer);
		}
		return stringbuffer.toString();
	}

	/**
	 * 
	 * 
	 * @param bt
	 * @param stringbuffer
	 */
	private static void appendHexPair(byte bt, StringBuffer stringbuffer) {
		char c0 = hexDigits[(bt & 0xf0) >> 4];
		char c1 = hexDigits[bt & 0xf];
		stringbuffer.append(c0);
		stringbuffer.append(c1);
	}
	/**
	 * main方法用于测试
	 * 
	 * @param args
	 */
	public static void main(String[] args) {

		// 字符'a'的MD5码是0cc175b9c0f1b6a831c399e269772661,如果是，则成功。
		try {
			System.out.println(MD5Util.encodeString("a"));
			System.out.println(MD5Util.encodeString("123456"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
