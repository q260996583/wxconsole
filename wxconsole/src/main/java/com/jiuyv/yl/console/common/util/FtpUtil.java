package com.jiuyv.yl.console.common.util;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPFile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class FtpUtil {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(FtpUtil.class);
	
	private FTPClient ftpClient;
	//public static final int BINARY_FILE_TYPE = FTP.BINARY_FILE_TYPE;
	//public static final int ASCII_FILE_TYPE = FTP.ASCII_FILE_TYPE;

	// path should not the path from root index
	// or some FTP server would go to root as '/'.
//	public void connectServer(String server,int port,String user,String password,String location) throws SocketException,
//			IOException {
////		String server = ftpConfig.getServer();
////		int port = ftpConfig.getPort();
////		String user = ftpConfig.getUsername();
////		String password = ftpConfig.getPassword();
////		String location = ftpConfig.getLocation();
//		connectServer(server, port, user, password, location);
//	}
	
//	
//	
//	
//	
//	
	public void connectServer(String server, int port, String user,
			String password, String path) throws SocketException, IOException {
		ftpClient = new FTPClient();
		ftpClient.connect(server, port);
		System.out.println("Connected to " + server + ".");
		System.out.println(ftpClient.getReplyCode());		
		 ftpClient.setControlEncoding("GBK"); 
		//ftpClient.setControlEncoding("GBK");
        FTPClientConfig conf = new FTPClientConfig(FTPClientConfig.SYST_NT);   
        conf.setServerLanguageCode("zh"); 

		
		ftpClient.login(user, password);
	    ftpClient.setBufferSize(1024);
		ftpClient.setFileType(FTPClient.ASCII_FILE_TYPE);
		// Path is the sub-path of the FTP path
		if (path.length() != 0) {
			ftpClient.changeWorkingDirectory(path);
		}
	}
//	//FTP.BINARY_FILE_TYPE | FTP.ASCII_FILE_TYPE
//	// Set transform type
//	public void setFileType(int fileType) throws IOException {
//		ftpClient.setFileType(fileType);
//	}
//
	public void closeServer() throws IOException {
		if (ftpClient.isConnected()) {
			ftpClient.disconnect();
		}
	}
//	//=======================================================================
//	//==         About directory       =====
//	// The following method using relative path better.
//	//=======================================================================
//	
//	public boolean changeDirectory(String path) throws IOException {
//		return ftpClient.changeWorkingDirectory(path);
//	}
//	public boolean createDirectory(String pathName) throws IOException {
//		return ftpClient.makeDirectory(pathName);
//	}
//	public boolean removeDirectory(String path) throws IOException {
//		return ftpClient.removeDirectory(path);
//	}
//	
//	// delete all subDirectory and files.
//	public boolean removeDirectory(String path, boolean isAll)
//			throws IOException {
//		
//		if (!isAll) {
//			return removeDirectory(path);
//		}
//
//		FTPFile[] ftpFileArr = ftpClient.listFiles(path);
//		if (ftpFileArr == null || ftpFileArr.length == 0) {
//			return removeDirectory(path);
//		}
//		// 
//		for (FTPFile ftpFile : ftpFileArr) {
//			String name = ftpFile.getName();
//			if (ftpFile.isDirectory()) {
//System.out.println("* [sD]Delete subPath ["+path + "/" + name+"]");				
//				removeDirectory(path + "/" + name, true);
//			} else if (ftpFile.isFile()) {
//System.out.println("* [sF]Delete file ["+path + "/" + name+"]");						
//				deleteFile(path + "/" + name);
//			} else if (ftpFile.isSymbolicLink()) {
//
//			} else if (ftpFile.isUnknown()) {
//
//			}
//		}
//		return ftpClient.removeDirectory(path);
//	}
//	
//	// Check the path is exist; exist return true, else false.
//	public boolean existDirectory(String path) throws IOException {
//		boolean flag = false;
//		FTPFile[] ftpFileArr = ftpClient.listFiles(path);
//		for (FTPFile ftpFile : ftpFileArr) {
//			if (ftpFile.isDirectory()
//					&& ftpFile.getName().equalsIgnoreCase(path)) {
//				flag = true;
//				break;
//			}
//		}
//		return flag;
//	}
//
//	//=======================================================================
//	//==         About file        =====
//	// Download and Upload file using
//	// ftpUtil.setFileType(FtpUtil.BINARY_FILE_TYPE) better!
//	//=======================================================================
//
//	// #1. list & delete operation
//	// Not contains directory
	public List<String> getFileList() throws IOException {
		// listFiles return contains directory and file, it's FTPFile instance
		// listNames() contains directory, so using following to filer directory.
		//String[] fileNameArr = ftpClient.listNames(path);
		FTPFile[] ftpFiles= ftpClient.listFiles();
		
		List<String> retList = new ArrayList<String>();
		if (ftpFiles == null || ftpFiles.length == 0) {
			return retList;
		}
		for (FTPFile ftpFile : ftpFiles) {
			if (ftpFile.isFile()) {
				retList.add(ftpFile.getName());
			}
		}
		return retList;
	}
//
//	public boolean deleteFile(String pathName) throws IOException {
//		return ftpClient.deleteFile(pathName);
//	}
//
//	// #2. upload to ftp server
//	// InputStream <------> byte[]  simple and See API
//
//	public boolean uploadFile(String fileName, String newName)
//			throws IOException {
//		boolean flag = false;
//		InputStream iStream = null;
//		try {
//			iStream = new FileInputStream(fileName);
//			flag = ftpClient.storeFile(newName, iStream);
//		} catch (IOException e) {
//			flag = false;
//			return flag;
//		} finally {
//			if (iStream != null) {
//				iStream.close();
//			}
//		}
//		return flag;
//	}
//
//	public boolean uploadFile(String fileName) throws IOException {
//		return uploadFile(fileName, fileName);
//	}
//
	public boolean uploadFile(InputStream iStream, String newName)
			throws IOException {
		boolean flag = false;
		try {
			// can execute [OutputStream storeFileStream(String remote)]
			// Above method return's value is the local file stream.
		
			flag = ftpClient.storeFile(new String(newName.getBytes("GBK"),"ISO-8859-1"), iStream);
		} catch (IOException e) {
			LOGGER.error("", e);
			flag = false;
			return flag;
		} finally {
			if (iStream != null) {
				iStream.close();
			}
		}
		return flag;
	}
//
//	// #3. Down load 
//
//	public boolean download(String remoteFileName, String localFileName)
//			throws IOException {
//		boolean flag = false;
//		File outfile = new File(localFileName);
//		OutputStream oStream = null;
//		try {
//			oStream = new FileOutputStream(outfile);
//			flag = ftpClient.retrieveFile(remoteFileName, oStream);
//				return flag;
//		} catch (IOException e) {			
//			return false;
//		} finally {
//			oStream.close();
//		}
//	
//	}
//	
	public InputStream downFile(String sourceFileName) throws IOException {	
		return ftpClient.retrieveFileStream(new String(sourceFileName.getBytes("GBK"),"ISO-8859-1"));
	}
	
//	
	public boolean downFile(String sourceFileName,File file) throws Exception{		
	return ftpClient.retrieveFile(sourceFileName,new FileOutputStream(file));
	
	}	
//	
////	public static InputStream downLoadFile(String fileName,String dir){
////		FtpUtil ftp=new FtpUtil();
////		try {
////			ftp.connectServer(CommUtil.getProperty("ftpaddress"), 22, CommUtil.getProperty("ftpusername"), CommUtil.getProperty("ftppasswd"),dir);
////			InputStream in= ftp.downFile(fileName);
////			 ftp.closeServer();
////			 return in;
////		} catch (Exception e) {
////			// TODO Auto-generated catch block
////			LOGGER.error("", e);
////			return null;
////		}	 
////	}
//	
	public static InputStream downLoadFile(Map<String,String> paramters,String fileName,String dir) {
		FtpUtil ftp=new FtpUtil();
		try {
			ftp.connectServer(paramters.get("ftpaddress"),Integer.parseInt(paramters.get("ftpport")),paramters.get("ftpusername"),paramters.get("ftppasswd"),dir);
			InputStream in= ftp.downFile(fileName);
			 ftp.closeServer();
			 return in;
		} catch (Exception e) {
			LOGGER.error("", e);
			return null;
		}	 
	}
//	
//	
//	
//	public static boolean uplodFile(InputStream in,String fileName,String dir){
//		FtpUtil ftp=new FtpUtil();
//		try {
//			
//			ftp.connectServer(CommUtil.getProperty("ftpaddress"), 22, CommUtil.getProperty("ftpusername"), CommUtil.getProperty("ftppasswd"),dir);
//			return ftp.uploadFile(in, fileName);		
//		} catch (Exception e) {
//			LOGGER.error("", e);
//			return false;
//		} 	
//	}

	public static boolean uploadFile(Map<String, String> paramters,InputStream in,String fileName,String dir) throws IOException{
		FtpUtil ftp=new FtpUtil();
		try {			
			ftp.connectServer(paramters.get("ftpaddress"),Integer.parseInt(paramters.get("ftpport")),paramters.get("ftpusername"),paramters.get("ftppasswd"),dir);
			return ftp.uploadFile(in, fileName);		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			LOGGER.error("", e);			
			return false;
		} 	
		finally{
			ftp.closeServer();
		}
	}
//	
//	
//	
	public static BufferedReader downLoadFileReader(String fileName,Map<String,String> paramters,String dir){
		FtpUtil ftp=new FtpUtil();
		try {			
			ftp.connectServer(paramters.get("ftpaddress"),Integer.parseInt(paramters.get("ftpport")),paramters.get("ftpusername"),paramters.get("ftppasswd"),dir);	
			Pattern p=Pattern.compile(fileName);
		List<String> files=ftp.getFileList();
			for(String name:files){
				Matcher matcher=p.matcher(name);
				if(matcher.matches()){
				File tempFile=File.createTempFile(name, "temp");
				if(ftp.downFile(name,tempFile)){
					return new BufferedReader(new FileReader(tempFile));
					}
				else return null;
				}
			}			
			return null;				 
			
		} catch (Exception e) {		
			LOGGER.error("", e);
			return null;
		}finally {
			try {
				ftp.closeServer();
			} catch (IOException e) {			
				LOGGER.error("", e);				
			}
		}
	}
	
	
//	public static void main (String args[]) throws Exception{
//		
//		Pattern p=Pattern.compile("999\\d{2,2}\\.action");
//		Matcher ma=p.matcher("99922.action");
//		System.out.println(ma.matches());
//		
//		
//	}
	
	
}	