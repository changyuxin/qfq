package com.qinfenqi.mall.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;

import org.apache.commons.io.FilenameUtils;

/**
 * 文件操作工具类
 *
 * @author WangDuo
 */
public class FileUtil {

	private static final String SPLIT = ";";
	
	
    /**
     * 删除文件夹或文件
     *
     * @param fileName
     */
    public static void deleteFile(String fileName) {
        File file = new File(fileName);
        deleteFile(file);
    }

    /**
     * 删除文件夹或文件
     *
     * @param file
     */
    public static void deleteFile(File file) {

        if (!file.exists()) return;

        if (file.isDirectory()) {
            File files[] = file.listFiles();
            for (int i = 0; i < files.length; i++) {
                deleteFile(files[i]);
            }
        }

        file.delete();
    }
    /**
     * 判断本地文件或者目录是否存在
     *
     * @parma fullFileName 文件路径+文件名称 如:D:\\test\\test.jsp
     * @return boolean
     */
    public static boolean isExist(String fullFileName) {
        if ((null == fullFileName) || ("".equals(fullFileName))) {
            return false;
        }
        fullFileName = fullFileName.replace("//", "\\");
        File fl = new File(fullFileName);
        if (fl.exists()) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 创建本地目录
     *
     * @parma dirs 目录名称
     * @return 是否成功
     * @throws Exception
     */
    public static boolean makeDir(String dirs) throws Exception {
        boolean result = false;
        File file = new File(dirs);
        // 创建目录
        result = file.mkdirs();
        return result;
    }
    /**
     * 创建文本文件
     *
     * @parma fullFileName 文件路径+文件名称
     * @parma txt 文件内容
     * @return 是否成功
     * @throws Exception
     */
    public static void createFile(String fullFileName, String contents) throws Exception{

        if(!isExist(fullFileName)){
            makeDir(fullFileName.substring(0, fullFileName.lastIndexOf("/")));
        }

        OutputStreamWriter outputStream = null;
        try {
            outputStream = new OutputStreamWriter(new FileOutputStream(fullFileName), "UTF-8");
            outputStream.write(null == contents ? "" : contents);
            outputStream.close();
        } finally {
            outputStream.close();
        }
    }

    /**
     * 读取文件为字节.
     *
     * @param filePath
     * @return byte[]
     * @throws Exception 
     */
    public static byte[] readByteArray(String filePath) throws Exception {
        FileInputStream in = null;
        ByteArrayOutputStream bout = null;
        byte[] orgData = null;
        try {
            in = new FileInputStream(new File(filePath));
            bout = new ByteArrayOutputStream();
            byte[] tmpbuf = new byte[1024];
            int count = 0;
            while ((count = in.read(tmpbuf)) != -1) {
                bout.write(tmpbuf, 0, count);
                tmpbuf = new byte[1024];
            }
            orgData = bout.toByteArray();
        } finally {
            if (null != bout) {
                bout.flush();
                bout.close();
            }
            if (null != in) {
                in.close();
            }
        }
        return orgData;
    }
    
    /**
     * 上传文件
     * @param @param file
     * @param @param fullFileName 
     * @return void
     * @throws
     */
    public static void uploadAttachment(File file, String fullFileName) throws Exception {
		// 开始生成文件
		InputStream is = null;
		OutputStream os = null;
		
		int bytesRead = 0;
		byte[] buffer = new byte[1024];
		
		try {
			is = new FileInputStream(file);
			os = new FileOutputStream(fullFileName);
			while ((bytesRead = is.read(buffer, 0, buffer.length)) != -1) {
				os.write(buffer, 0, bytesRead);
			}
		} finally {
			if (null != os) {
				os.close();
			}
			if (null != is) {
				is.close();
			}
		}
	}
    
    public static boolean checkFileType(String fileName, String fileTypes){
    	
		for(String str : fileTypes.split(SPLIT)){
			if(fileName.toLowerCase().indexOf(str) > -1){
				return true;
			}
		}
		return false;
    }
    
    public static void main(String[] args) {
		String fileName = "aaa.png";
		
		String ext = FilenameUtils.getExtension(fileName);
		
		System.out.println("ext = " + ext);
	}
}
