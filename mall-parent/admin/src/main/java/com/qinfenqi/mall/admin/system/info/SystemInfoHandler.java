package com.qinfenqi.mall.admin.system.info;

import java.io.File;
import java.lang.management.ManagementFactory;
import java.lang.management.OperatingSystemMXBean;
import java.lang.reflect.Method;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Locale;

import org.apache.struts2.ServletActionContext;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月28日 下午4:02:14
 * @author Chang Yuxin
 * @version 1.0 
 */
public class SystemInfoHandler {

	private static final long ONE_KB = 1024;
	private static final long ONE_MB = ONE_KB * ONE_KB;
	private static final long ONE_GB = ONE_KB * ONE_MB;

	/** CPU核数 */
	private int processors;

	/** 操作系统内存  */
	private String systemTotalMemory;

	/** 操作系统剩余内存 */
	private String systemFreeMemory;

	/** 操作系统信息 */
	private String systemVersion;

	/** 磁盘大小  */
	private String diskTotalSpace;

	/** 磁盘剩余空间 */
	private String diskFreeSpace;

	/** 在线用户数 */
	private int onlineUserCount;

	/** JVM最大内存 */
	private String jvmMaxMemory;
	
	/** JVM内存 */
	private String jvmTotalMemory;

	/** JVM剩余内存 */
	private String jvmFreeMemory;

	/** JVM版本信息 */
	private String jvmVersion;

	/** 服务器端口 */
	private int serverPort;

	/** 系统运行时间(小时) */
	private String serverRunTime;

	public SystemInfoHandler() {

		Runtime runtime = Runtime.getRuntime();
		OperatingSystemMXBean os = ManagementFactory.getOperatingSystemMXBean();
		
		// CPU核数
		processors = runtime.availableProcessors();

		// 操作系统内存
		systemTotalMemory = unitConvert((Long) getIfAvaliable(os, "totalPhysicalMemorySize"));

		// 操作系统剩余内存
		systemFreeMemory = unitConvert((Long) getIfAvaliable(os, "freePhysicalMemorySize"));

		// 操作系统信息
		systemVersion = os.getName() + " " + os.getVersion() + " " + os.getArch();
		
		// 磁盘大小
		diskTotalSpace = unitConvert(new File("/").getTotalSpace());

		// 磁盘剩余空间
		diskFreeSpace = unitConvert(new File("/").getFreeSpace());

		// JVM最大内存
		jvmMaxMemory = unitConvert(runtime.maxMemory());
		
		// JVM内存
		jvmTotalMemory = unitConvert(runtime.totalMemory());

		// 剩余内存
		jvmFreeMemory = unitConvert(runtime.freeMemory());

		// JVM版本信息
		jvmVersion = System.getProperty("java.specification.name") + " " 
				+ System.getProperty("java.specification.version") + " " 
				+ System.getProperty("java.specification.vendor");

		// 服务器端口
		serverPort = ServletActionContext.getRequest().getLocalPort();
	}

	/**
	 * 存储单位转换
	 * 
	 * @param bytes
	 * @return
	 */
	private String unitConvert(long bytes) {
		
	    DecimalFormat df = new DecimalFormat("#.#", DecimalFormatSymbols.getInstance(Locale.ROOT));
		
		String newSizeAndUnits;

		if (bytes / ONE_GB > 0) {
			newSizeAndUnits = String.valueOf(df.format((float) bytes / ONE_GB)) + " GB";
		} else if (bytes / ONE_MB > 0) {
			newSizeAndUnits = String.valueOf(df.format((float) bytes / ONE_MB)) + " MB";
		} else if (bytes / ONE_KB > 0) {
			newSizeAndUnits = String.valueOf(df.format((float) bytes / ONE_KB)) + " KB";
		} else {
			newSizeAndUnits = String.valueOf(bytes) + " bytes";
		}

		return newSizeAndUnits;
	}

	/**
	 * 尝试获取系统信息
	 * @param obj
	 * @param getter
	 * @return
	 */
	private static Object getIfAvaliable(Object obj, String getter) {
		try {
			String n = Character.toUpperCase(getter.charAt(0)) + getter.substring(1);
			Method m = obj.getClass().getMethod("get" + n);
			m.setAccessible(true);
			return m.invoke(obj, (Object[]) null);
		} catch (Exception ex) {
		}
		return null;
	}

	public int getProcessors() {
		return processors;
	}

	public void setProcessors(int processors) {
		this.processors = processors;
	}

	public String getSystemTotalMemory() {
		return systemTotalMemory;
	}

	public void setSystemTotalMemory(String systemTotalMemory) {
		this.systemTotalMemory = systemTotalMemory;
	}

	public String getSystemFreeMemory() {
		return systemFreeMemory;
	}

	public void setSystemFreeMemory(String systemFreeMemory) {
		this.systemFreeMemory = systemFreeMemory;
	}

	public String getSystemVersion() {
		return systemVersion;
	}

	public void setSystemVersion(String systemVersion) {
		this.systemVersion = systemVersion;
	}

	public String getDiskTotalSpace() {
		return diskTotalSpace;
	}

	public void setDiskTotalSpace(String diskTotalSpace) {
		this.diskTotalSpace = diskTotalSpace;
	}

	public String getDiskFreeSpace() {
		return diskFreeSpace;
	}

	public void setDiskFreeSpace(String diskFreeSpace) {
		this.diskFreeSpace = diskFreeSpace;
	}

	public int getOnlineUserCount() {
		return onlineUserCount;
	}

	public void setOnlineUserCount(int onlineUserCount) {
		this.onlineUserCount = onlineUserCount;
	}

	public String getJvmMaxMemory() {
		return jvmMaxMemory;
	}

	public void setJvmMaxMemory(String jvmMaxMemory) {
		this.jvmMaxMemory = jvmMaxMemory;
	}

	public String getJvmTotalMemory() {
		return jvmTotalMemory;
	}

	public void setJvmTotalMemory(String jvmTotalMemory) {
		this.jvmTotalMemory = jvmTotalMemory;
	}

	public String getJvmFreeMemory() {
		return jvmFreeMemory;
	}

	public void setJvmFreeMemory(String jvmFreeMemory) {
		this.jvmFreeMemory = jvmFreeMemory;
	}

	public String getJvmVersion() {
		return jvmVersion;
	}

	public void setJvmVersion(String jvmVersion) {
		this.jvmVersion = jvmVersion;
	}

	public int getServerPort() {
		return serverPort;
	}

	public void setServerPort(int serverPort) {
		this.serverPort = serverPort;
	}

	public String getServerRunTime() {
		return serverRunTime;
	}

	public void setServerRunTime(String serverRunTime) {
		this.serverRunTime = serverRunTime;
	}

}
