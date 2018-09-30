package com.jiuyv.yl.console.common.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class FileUtils {

	private static final Logger LOGGER = LoggerFactory.getLogger(FileUtils.class);
	
    /**
     * 复制整个文件夹内容
     * 
     * @param oldPath
     *            String 原文件路径 如：c:/fqf
     * @param newPath
     *            String 复制后路径 如：f:/fqf/ff
     * @return boolean
     */
    public static boolean copyFile(String oldPath, String newPath,
            String oldFileFormat, String newFileFormat) throws Exception {

        boolean flag = true;

        List fileList = fileDir(oldPath, oldFileFormat);
        if (fileList == null || fileList.size() == 0) {
            flag = false;
            return flag;
        }
        for (int i = 0; i < fileList.size(); i++) {
            int bytesum = 0;
            int byteread = 0;
            String oldFileName = (String) fileList.get(i);
            String newFileName = getNewFileName(oldFileName, oldFileFormat,
                    newFileFormat);
            InputStream inStream = new FileInputStream(oldPath + "/"
                    + oldFileName); // 读入原文件
            File file = new File(newPath + "/");
            if (!file.exists()) {
                file.mkdir();
            }
            FileOutputStream fs = new FileOutputStream(newPath + "/"
                    + newFileName + ".tmp");
            byte[] buffer = new byte[1444];
            while ((byteread = inStream.read(buffer)) != -1) {
                bytesum += byteread; // 字节数 文件大小
                fs.write(buffer, 0, byteread);
            }
            inStream.close();
            fs.flush();
            fs.close();
            renameFile(newPath + "/" + newFileName + ".tmp", newPath + "/"
                    + newFileName);
        }
        return flag;
    }

    public static void renameFile(String oldfileName, String newFileName)
            throws Exception {
        File f2 = new File(newFileName);
        if (f2.isFile() && f2.exists())
            f2.delete();
        File f1 = new File(oldfileName);
        f1.renameTo(f2);
    }

    public static String getNewFileName(String oldfileName,
            String oldFileFormat, String newFileFormat) {
    	if(oldFileFormat == null || newFileFormat == null || oldfileName == null) return newFileFormat;
        int index = oldFileFormat.indexOf("*");
        int lastIndex = oldFileFormat.lastIndexOf("*");
        int newIndex = newFileFormat.indexOf("*");
        int newLastIndex = newFileFormat.lastIndexOf("*");
        if (index == -1 || lastIndex == -1 || newIndex == -1
                || newLastIndex == -1)
            return getNewFileName_(oldfileName, oldFileFormat, newFileFormat);
        String indexStr = oldFileFormat.substring(index, lastIndex + 1);
        String str = oldfileName.substring(index, lastIndex + 1);

        String temp = newFileFormat.replace(indexStr, str);

        return getNewFileName_(oldfileName, oldFileFormat, temp);
    }

    public static String getNewFileName_(String oldfileName,
            String oldFileFormat, String newFileFormat) {
        int index = oldFileFormat.indexOf("_");
        int lastIndex = oldFileFormat.lastIndexOf("_");
        int newIndex = newFileFormat.indexOf("_");
        int newLastIndex = newFileFormat.lastIndexOf("_");
        if (index == -1 || lastIndex == -1 || newIndex == -1
                || newLastIndex == -1)
            return newFileFormat;
        String indexStr = oldFileFormat.substring(index, lastIndex + 1);
        String str = oldfileName.substring(index, lastIndex + 1);

        return newFileFormat.replace(indexStr, str);
    }

    public static List fileDir(String path, String fileFormat) {
        List fileList = new ArrayList();
        Integer index = path.lastIndexOf("/");

        File allFile = new File(path);
        String[] files = allFile.list();

        if (files != null) {
            fileFormat = fileFormat.replace("*", "[A-Za-z0-9_]{1}");
            fileFormat = fileFormat.replace("_", "[A-Za-z0-9_]{1}");
            Pattern pattern = Pattern.compile("^" + fileFormat + "$");
            for (int i = 0; i < files.length; i++) {
                Matcher matcher = pattern.matcher(files[i]);
                boolean result = matcher.find();
                if (result)
                    fileList.add(files[i]);
            }
        }
        return fileList;
    }

    /**
     * 逐行读
     * 
     * @param path
     * @param fileName
     * @return
     * @throws Exception
     */
    public static List<String> readFileByLine(String path, String fileName)
            throws Exception {
        List<String> filecon = new ArrayList<String>();
        String m = "";
        BufferedReader br = null;
        InputStreamReader isr = null;
        try {
            isr = new InputStreamReader(new FileInputStream(path + "/"
                    + fileName), "utf-8");
            br = new BufferedReader(isr);
            while ((m = br.readLine()) != null) {
                if (!m.equals("\n")) // 文本结束的标志
                {
                    if (!m.equals("")) // 不需要读取空行
                    {
                        filecon.add(m);
                    }
                }
            }
            br.close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            LOGGER.error("", e);
        } finally {
            isr.close();
            br.close();
        }
        return filecon;
    }

   

    public static void writeFile(List<String> list, String path, String fileName)
            throws IOException {
        OutputStreamWriter osr = null;
        BufferedWriter bw = null;
        try {
            osr = new OutputStreamWriter(new FileOutputStream(path + "/"
                    + fileName), "utf-8");
            bw = new BufferedWriter(osr);
            for (String line : list) {
                bw.write(line);
                bw.newLine();// 断行
            }
            bw.close();// 关闭文件流
            osr.close();
        } catch (Exception e) {

        } finally {
            bw.close();// 关闭文件流
            osr.close();
        }
    }

}