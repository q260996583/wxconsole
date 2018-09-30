package com.jiuyv.yl.console.common.util;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipFile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.ChannelSftp.LsEntry;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.SftpException;
import com.jiuyv.common.exception.BussnissException;

public class SftpUtils{
    
	private static final Logger LOGGER = LoggerFactory.getLogger(SftpUtils.class);
	
//    private String host = "192.168.89.192";
//    private String username="weblogic";
//    private String password="bea123";
//    private int port = 22;
    private ChannelSftp sftp = null;
    private static int overWrite=1;
    
    /**
     * connect server via sftp
     * @throws BussnissException 
     * @throws JSchException 
     * @throws NumberFormatException 
     */
    public void connect(Map<String,String> paramters) throws BussnissException  {
      
            if(sftp != null){
                System.out.println("sftp is not null");
            }
            JSch jsch = new JSch();
            //ftp.connectServer(paramters.get("ftpaddress"),Integer.parseInt(paramters.get("ftpport")),paramters.get("ftpusername"),paramters.get("ftppasswd"),dir);
          
            
           try {
			// jsch.getSession(paramters.get("ftpusername"), paramters.get("ftpaddress"), Integer.parseInt(paramters.get("ftpport")));
			Session sshSession = jsch.getSession(paramters.get("ftpusername"),
					paramters.get("ftpaddress"),
					Integer.parseInt(paramters.get("ftpport")));     
			
		
			System.out.println("Session created.");
			sshSession.setPassword(paramters.get("ftppasswd"));			
			Properties sshConfig = new Properties();
			sshConfig.put("StrictHostKeyChecking", "no");
			if (paramters.get("kex") != null) {
				sshConfig.put("kex", "diffie-hellman-group1-sha1,diffie-hellman-group14-sha1,diffie-hellman-group-exchange-sha1,diffie-hellman-group-exchange-sha256");
			}
			sshSession.setConfig(sshConfig);
			sshSession.connect(60000);
			System.out.println("Session connected.");
			System.out.println("Opening Channel.");
			sftp = (ChannelSftp) sshSession.openChannel("sftp");
			//设置超时时间 10秒
			sftp.connect(60000);
		} catch (Exception e) {
			LOGGER.error("", e);
			this.disconnect();
			throw new BussnissException("sftp连接失败");
		}
			// sftp = (ChannelSftp) channel;
          //  System.out.println(sftp.pwd());
            System.out.println("Connected to " + paramters.get("ftpaddress") + ".");
      
    }
    /**
     * Disconnect with server
     * @throws  
     * @throws Exception 
     */
    public void disconnect()   {
        if(this.sftp != null){
            if(this.sftp.isConnected()){
            	try {
					this.sftp.getSession().disconnect();
				} catch (JSchException e) {
					// TODO Auto-generated catch block
					LOGGER.error("", e);
				}
                this.sftp.disconnect();
            }else if(this.sftp.isClosed()){
                System.out.println("sftp is closed already");
            }
        }

    }

    
   public static InputStream downLoadFile(Map<String,String> paramters,String fileName,String dir) throws BussnissException, IOException {
   	  SftpUtils ftp= new SftpUtils();
       
		try {
			
			ftp.connect(paramters);
		    ftp.getSftp().cd(dir);	
		    
			File tempFile=File.createTempFile(fileName, "temp");
		
			
			ftp.getSftp().get(fileName, new FileOutputStream(tempFile));
			//return new BufferedReader(new FileReader(tempFile));
		  return new FileInputStream(tempFile);
		    
	    	//return 	ftp.getSftp().get(fileName);
		} 
		catch (SftpException e) {
			// TODO Auto-generated catch block
			LOGGER.error("", e);
			return null;
		}
		finally{
			ftp.disconnect();
		}
	}
    
   
    
//    private void download(String directory, String downloadFile,String saveFile, ChannelSftp sftp) {
//        try {
//            sftp.cd(directory);
//            File file = new File(saveFile);
//            sftp.get(downloadFile, new FileOutputStream(file));
//        } catch (Exception e) {
//            LOGGER.error("", e);
//        }
//        
   // }
    
    
    public static boolean uploadFile(Map<String, String> paramters,InputStream in,String fileName,String dir) throws BussnissException{
    	  SftpUtils ftp= new SftpUtils();			
			ftp.connect(paramters);			
			
			
			
			try {
				
				try {
					ftp.getSftp().cd(dir);				
				} catch (SftpException e1) {
					LOGGER.error("", e1);
					ftp.getSftp().mkdir(dir);
					ftp.getSftp().cd(dir);
				}
			if(in==null){
				ftp.getSftp().put(fileName);
			}
			else 	ftp.getSftp().put(in, fileName);
				return true;		
			} catch (SftpException e) {
				// TODO Auto-generated catch block
				LOGGER.error("", e);
				return false;
			}
			finally{
				ftp.disconnect();
			}
			
	
	}
    /*新建二级目录方法*/
    public static boolean uploadFileTwo(Map<String, String> paramters,InputStream in,String fileName,String dirOne,String dirTwo) throws BussnissException{
  	  SftpUtils ftp= new SftpUtils();			
			ftp.connect(paramters);			
			
			try {
				
				try {
					ftp.getSftp().cd(dirOne);	
				} catch (SftpException e1) {
//					LOGGER.error("", e1);
					ftp.getSftp().mkdir(dirOne);
					ftp.getSftp().cd(dirOne);
					
				}
				try {
					ftp.getSftp().cd(dirTwo);	
				} catch (SftpException e1) {
//					LOGGER.error("", e1);
					ftp.getSftp().mkdir(dirTwo);
					ftp.getSftp().cd(dirTwo);
					
				}
			if(in==null){
				ftp.getSftp().put(fileName);
			}
			else 	ftp.getSftp().put(in, fileName);
				return true;		
			} catch (SftpException e) {
				// TODO Auto-generated catch block
				LOGGER.error("", e);
				return false;
			}
			finally{
				ftp.disconnect();
			}
			
	
	}
    
    public static boolean putFile(String address, String username, String password,  
            String fromPath, String toPath, String fromFileName, String toFileName) throws Exception {
    
        boolean flag = true;
        JSch jsch = new JSch();
        Session sshSession = jsch.getSession(username, address, 22);
        sshSession.setPassword(password);
        Properties sshConfig = new Properties();
        sshConfig.put("StrictHostKeyChecking", "no");
        sshSession.setConfig(sshConfig);
        sshSession.connect();
        Channel channel = sshSession.openChannel("sftp");
        channel.connect();
        ChannelSftp sftp = (ChannelSftp) channel;
        try {
            sftp.cd(toPath);
        } catch (Exception e) {
            sftp.mkdir(toPath);
            sftp.cd(toPath);
        }
        List list = FileUtils.fileDir(fromPath, fromFileName);
        if(list == null || list.size() == 0) {
            flag = false;
            return flag;
        }
        for(int i=0; i<list.size(); i++) {
            InputStream is = new FileInputStream(fromPath + "/" + list.get(i));
            sftp.put(is, FileUtils.getNewFileName((String)list.get(i), fromFileName, toFileName));
            is.close();
        }
        sshSession.disconnect();
        sftp.disconnect();
        
        return flag;
    }
    
    public static boolean uploadFile(Map<String, String> paramters,InputStream in,String fileName,String dir,int overWrite) throws BussnissException{
  	  SftpUtils ftp= new SftpUtils();			
			ftp.connect(paramters);			
			try {
				
				try {
					ftp.getSftp().cd(dir);				
				} catch (SftpException e) {
					LOGGER.error("", e);
					ftp.getSftp().mkdir(dir);
					ftp.getSftp().cd(dir);
				}
				if(overWrite!=SftpUtils.overWrite){
					try {
						ftp.getSftp().get(fileName);
						throw new BussnissException("存在文件名相同记录,无法覆盖");
					} catch (SftpException e) {
						LOGGER.error("", e);
						
					}			
				}
				
			if(in==null){
				ftp.getSftp().put(fileName);
			}
			else 	ftp.getSftp().put(in, fileName);
				return true;		
			} catch (SftpException e) {
				// TODO Auto-generated catch block
				LOGGER.error("", e);
				return false;
			}
			finally{
				ftp.disconnect();
			}
			
	
	}
    
    
    
    public static BufferedReader downLoadFileReader(String fileName,Map<String,String> paramters,String dir) throws BussnissException{
    	        SftpUtils ftp= new SftpUtils();   	   
				ftp.connect(paramters);		
				try {
					ChannelSftp cftp=ftp.getSftp();
					Iterator it= cftp.ls(dir).iterator();				
					Pattern p=Pattern.compile(fileName);			
					  while(it.hasNext()){
						  LsEntry entry=(LsEntry)it.next();					  
						  Matcher matcher=p.matcher(entry.getFilename());
						 if(matcher.matches()){
							ftp.getSftp().cd(dir);
							File tempFile=File.createTempFile(entry.getFilename().toString(), "temp");
							cftp.get(entry.getFilename().toString(), new FileOutputStream(tempFile));
							return new BufferedReader(new FileReader(tempFile));
					       // return new BufferedReader(new InputStreamReader(cftp.get(fileName)));	
						}
					}			 
					return null;
				} catch (SftpException e) {
					// TODO Auto-generated catch block
					LOGGER.error("", e);
					return null;
				}catch (IOException e) {
					// TODO Auto-generated catch block
					LOGGER.error("", e);
					return null;
				}     
				finally{
					ftp.disconnect();
				}
				
    	   
    }
    
    public static boolean unzip(Map<String, String> paramters,File zipFilename, String outputDirectory) throws Exception {
    	SftpUtils ftp= new SftpUtils();			
		ftp.connect(paramters);
		String fileName="";
		File outFile = new File(outputDirectory);
		try {
			ftp.getSftp().cd(outputDirectory);				
		} catch (SftpException e1) {
			ftp.getSftp().mkdir(outputDirectory);
			ftp.getSftp().cd(outputDirectory);
		}
		ZipFile zipFile = new ZipFile(zipFilename);
		Enumeration en = zipFile.getEntries();
		ZipEntry zipEntry = null;
		while (en.hasMoreElements()) {
			zipEntry = (ZipEntry) en.nextElement();
			if (zipEntry.isDirectory()) {
				String dirName = zipEntry.getName();
				dirName = dirName.substring(0, dirName.length() - 1);
				String dir=outputDirectory + "/" + dirName;
				try {
					ftp.getSftp().cd(dir);				
				} catch (SftpException e1) {
					ftp.getSftp().mkdir(dir);
					ftp.getSftp().cd(dir);
				}
				ftp.getSftp().cd(outputDirectory);
			} else {
				String[] temp=zipEntry.getName().split("/");
				String tempFileName=temp[temp.length-1];
				StringBuffer sb=new StringBuffer("");
				for (int i = 0; i < temp.length-1; i++) {
					try {
						ftp.getSftp().cd(temp[i]);
					} catch (SftpException e) {
						// TODO: handle exception
						ftp.getSftp().mkdir(temp[i]);
						ftp.getSftp().cd(temp[i]);
					}
				}

//				String strFilePath = outFile.getPath() + File.separator+ zipEntry.getName();
//				File f = new File(strFilePath);
				// 判断文件不存在的话，就创建该文件所在文件夹的目录
//				if (!f.exists()) {
//					String[] arrFolderName = zipEntry.getName().split("/");//zipEntry.getName()得到带后缀的文件名
//					if(arrFolderName.length==2){
//						fileName=arrFolderName[1];
//					}else {
//						fileName=arrFolderName[2];
//					}
//					String strRealFolder = "";
//					for (int i = 0; i < (arrFolderName.length - 1); i++) {
//						strRealFolder += "/"+arrFolderName[i];
//						strRealFolder=strRealFolder.replaceAll("\\\\", "/");
//						String strReal=outputDirectory+strRealFolder;
//						try {
//							ftp.getSftp().cd(strReal);				
//						} catch (SftpException e1) {
//							ftp.getSftp().mkdir(strReal);
//							ftp.getSftp().cd(strReal);
//						}
//					}
//				}
				InputStream in = zipFile.getInputStream(zipEntry);
				try{
					if(in==null){
						ftp.getSftp().put(zipEntry.getName());
					}
					else 	ftp.getSftp().put(in, tempFileName);
					if (temp.length != 1) {
						ftp.getSftp().cd(outputDirectory);
					}
				} catch (SftpException e) {
					// TODO Auto-generated catch block
					LOGGER.error("", e);
					return false;
				}
				finally{
					in.close();
				}
			}
		}
		ftp.disconnect();
		return true;
		}
//    public InputStream upLoad(FileInputStream io,String fileName) throws Exception{
//    	
//    	  this.sftp.put(io,fileName);
//    	  
//    	 return  sftp.get(fileName);
//    	  
//    }
    
    
    /**
     * upload all the files to the server
     */
//    public void upload() {
//        List<String> fileList = this.getFileEntryList(fileListPath);
//        try {
//            if(fileList != null){
//                for (String filepath : fileList) {
//                    String localFile = this.localPath + this.seperator+ filepath;
//                    File file = new File(localFile);
//                    
//                    if(file.isFile()){
//                        System.out.println("localFile : " + file.getAbsolutePath());
//                        String remoteFile = this.remotePath + this.seperator + filepath;
//                        System.out.println("remotePath:" + remoteFile);
//                        File rfile = new File(remoteFile);
//                        String rpath = rfile.getParent();
//                        try {
//                            createDir(rpath, sftp);
//                        } catch (Exception e) {
//                            System.out.println("*******create path failed" + rpath);
//                        }
//
//                        this.sftp.put(new FileInputStream(file), file.getName());
//                        System.out.println("=========upload down for " + localFile);
//                    }
//                }
//            }
//        } catch (FileNotFoundException e) {
//            // TODO Auto-generated catch block
//            LOGGER.error("", e);
//        } catch (SftpException e) {
//            // TODO Auto-generated catch block
//            LOGGER.error("", e);
//        }
//        
//    }
//    /**
//     * create Directory
//     * @param filepath
//     * @param sftp
//     */
//    private void createDir(String filepath, ChannelSftp sftp){
//        boolean bcreated = false;
//        boolean bparent = false;
//        File file = new File(filepath);
//        String ppath = file.getParent();
//        try {
//            this.sftp.cd(ppath);
//            bparent = true;
//        } catch (SftpException e1) {
//            bparent = false;
//        }
//        try {
//            if(bparent){
//                try {
//                    this.sftp.cd(filepath);
//                    bcreated = true;
//                } catch (Exception e) {
//                    bcreated = false;
//                }
//                if(!bcreated){
//                    this.sftp.mkdir(filepath);
//                    bcreated = true;
//                }
//                return;
//            }else{
//                createDir(ppath,sftp);
//                this.sftp.cd(ppath);
//                this.sftp.mkdir(filepath);
//            }
//        } catch (SftpException e) {
//            System.out.println("mkdir failed :" + filepath);
//            LOGGER.error("", e);
//        }
//        
//        try {
//            this.sftp.cd(filepath);
//        } catch (SftpException e) {
//            LOGGER.error("", e);
//            System.out.println("can not cd into :" + filepath);
//        }
//        
//    }
//    /**
//     * get all the files need to be upload or download
//     * @param file
//     * @return
//     */
//    private List<String> getFileEntryList(String file){
//        ArrayList<String> fileList = new ArrayList<String>();
//        InputStream in = null;
//        try {
//            
//            in = new FileInputStream(file);
//            InputStreamReader inreader = new InputStreamReader(in);
//            
//            LineNumberReader linreader = new LineNumberReader(inreader);
//            String filepath = linreader.readLine();
//            while(filepath != null){
//                fileList.add(filepath);
//                filepath = linreader.readLine();
//            }
//            in.close();
//        } catch (FileNotFoundException e) {
//            // TODO Auto-generated catch block
//            LOGGER.error("", e);
//        } catch (IOException e) {
//            // TODO Auto-generated catch block
//            LOGGER.error("", e);
//        }finally{
//            if(in != null){
//                in = null;
//            }
//        }
//
//        return fileList;
//    }

   

 

    /**
     * @return the sftp
     */
    public ChannelSftp getSftp() {
        return sftp;
    }

    /**
     * @param sftp the sftp to set
     */
    public void setSftp(ChannelSftp sftp) {
        this.sftp = sftp;
    }


    
    
    public static void main(String[] args) throws Exception {
    	System.out.println(File.separator);
       Map<String,String> map=new HashMap<String,String>();
//       
//     //  ftp.connectServer(paramters.get("ftpaddress"),Integer.parseInt(paramters.get("ftpport")),paramters.get("ftpusername"),paramters.get("ftppasswd"),dir);
       map.put("ftpaddress", "192.168.89.192");
       map.put("ftpport", "22");
       map.put("ftpusername", "weblogic");
       map.put("ftppasswd", "bea123");
       SftpUtils  a=new SftpUtils();
       a.connect(map);
       a.getSftp().put("cccc.txt");
       a.disconnect();
    // SftpUtils.uploadFile(map, new FileInputStream(new File("e:/修改.txt")),new String("中文测试.txt".getBytes(),"utf-8"), "/bea/weblogic/spool/gateway/ftrans/cmb");

    	
    	
    	
    }


}


