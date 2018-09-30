package com.jiuyv.yl.console.common.service.impl;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.channels.FileChannel;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jiuyv.common.exception.BaseException;
import com.jiuyv.common.image.ImageUtil;
import com.jiuyv.yl.console.common.dao.inter.ICmMediaResDao;
import com.jiuyv.yl.console.common.entity.CmMediaResVo;
import com.jiuyv.yl.console.common.service.inter.IMediaImageService;
import com.jiuyv.yl.console.security.entity.IMedia;
import com.jiuyv.yl.console.security.entity.SecurityUserDetail;
import com.jiuyv.yl.console.security.service.IMediaSupportService;

/**
 * The Class MediaSupportServiceImpl.
 *
 * @company Shanghai JinYu Software Systems CO.,LTD.
 * @author 
 * @since 2014-3-11 23:20:12
 * @version 1.0.0
 */
public class MediaSupportServiceImpl implements IMediaSupportService,IMediaImageService {
	/**
	 * Logger for this class
	 */
	private static final Logger LOGGER = LoggerFactory.getLogger(MediaSupportServiceImpl.class);

	/** mediaDao. */
	private ICmMediaResDao cmMediaResDao;
	
	/** 日期格式化. */
	private static final String DATE_FORMAT = "yyyyMM";
	
	/** 默认缩放宽度 (尺寸过小在某些比例的缩略图中会出现黑边) */
	private static final Integer ZOOM_WIDTH  = 140;
	
	/** 默认缩放高度 (尺寸过小在某些比例的缩略图中会出现黑边) */
	private static final Integer ZOOM_HEIGHT = 140;
	
	/** MIME类型. */
	private static Map<String,String> mimeTypeMap = new HashMap<String, String>();
	/** 格式转换类型 */
	private static Map<String,String> formatTypeMap = new HashMap<String, String>();
	
	static {
		mimeTypeMap.put(".bmp", "image/bmp");
		mimeTypeMap.put(".gif", "image/gif");
		mimeTypeMap.put(".jpeg", "image/jpeg");
		mimeTypeMap.put(".jpg", "image/jpeg");
		mimeTypeMap.put(".png", "image/png");
		//mimeTypeMap.put(".apk", "application/vnd.android");//application/vnd.android.package-archive
		mimeTypeMap.put(".apk", "application/vnd.android.package-archive");
		mimeTypeMap.put(".zip", "application/zip");
		mimeTypeMap.put(".rar", "application/x-rar-compressed");
		mimeTypeMap.put(".7z", "application/octet-stream");
		
		formatTypeMap.put(".bmp", "BMP");
		formatTypeMap.put(".gif", "GIF");
		formatTypeMap.put(".jpeg","JPEG");
		formatTypeMap.put(".jpg", "JPEG");
		formatTypeMap.put(".png", "PNG");
		formatTypeMap.put(".apk", "APK");
		formatTypeMap.put(".zip", "ZIP");
		formatTypeMap.put(".rar", "RAR");
		formatTypeMap.put(".7z", "7Z");
	}
	
	/**
	 * Find media.
	 *
	 * @param filePath the file path
	 * @param fileType the file type
	 * @return the i media
	 * @see com.jiuyv.com.jiuyv.yl.console.security.service.IMediaSupportService#findMedia(java.lang.String, java.lang.String)
	 */
	public IMedia findMedia(String filePath, String fileType) {
		if (StringUtils.equalsIgnoreCase("thumbnail", fileType)) {
			return cmMediaResDao.findThumbByPath(filePath);
		} else {
			return cmMediaResDao.findContentByPath(filePath);
		}
	}

	/**
	 * 根据关联号和序号查询媒体信息
	 * @param medSeq 序号
	 * @param refNo 关联号
	 * @param fileType
	 * @return
	 */
	public IMedia findAttach(String medSeq, String refNo, String fileType) {
		if (StringUtils.equalsIgnoreCase("thumbnail", fileType)) {
			return cmMediaResDao.findThumbByMedSeqRefNo(medSeq, refNo);
		} else {
			return cmMediaResDao.findContentByMedSeqRefNo(medSeq, refNo);
		}
	}
	
	/**
	 * Do insert image.
	 *
	 * @param userVo the user vo
	 * @param file the file
	 * @param fileName the file name
	 * @return the res media vo
	 * @throws BaseException the base exception
	 * @see com.jiuyv.yl.console.common.service.IMediaImageService#doInsertImage(com.jiuyv.yl.model.security.SysMerUserVo, java.io.File, java.lang.String)
	 */
	public  CmMediaResVo doInsertImage(SecurityUserDetail userVo, File file, String xfileName)
			throws BaseException {
		 CmMediaResVo mediaVo = new  CmMediaResVo();
		mediaVo.setRecCrtAcc(userVo.getLoginNm());
		String medDir = DIR_PREFIX + new SimpleDateFormat(DATE_FORMAT).format(new Date()) + "/" + UUID.randomUUID() + "/";
		String neFileName = StringUtils.defaultString(xfileName,file.getName());
		String fileName = neFileName.indexOf("\\")>0?neFileName.substring(neFileName.lastIndexOf("\\")+1):neFileName;
		fileName = fileName.indexOf("/")>0?fileName.substring(fileName.lastIndexOf("/")+1):fileName;
		String extName = fileName.substring(fileName.lastIndexOf('.')).toLowerCase();
		if(!extName.matches("\\.(png|jpg|bmp|gif|jpeg)")) {
			throw new BaseException("", "请上传格式为jpg、png、jpeg、bmp、gif的图片");
		}
		// set image content
		FileInputStream fis = null;
		try {
			// set fileName
			String oriName = fileName.substring(0, fileName.lastIndexOf('.'));
			oriName = oriName.length() > 160 ? oriName.substring(0, 160):oriName;
			String medName = URLEncoder.encode( oriName, "ISO-8859-1")  + extName;
			mediaVo.setMedName(medName);
			mediaVo.setMedDir(medDir);
			mediaVo.setMedPath(mediaVo.getMedDir() + mediaVo.getMedName());
			mediaVo.setMimeType(mimeTypeMap.get(extName));
			fis = new FileInputStream(file);
			ByteArrayOutputStream thumbnailsByteStream = new ByteArrayOutputStream();
			BufferedImage bufImg = ImageUtil.readImage(fis);
			ImageUtil.zoomFixed(bufImg, thumbnailsByteStream, formatTypeMap.get(extName),ZOOM_HEIGHT, ZOOM_WIDTH, false, null);
			mediaVo.setMedThumb(thumbnailsByteStream.toByteArray());
			mediaVo.setMedContent(ImageUtil.toByteArray(bufImg, formatTypeMap.get(extName)));		
		} catch (IOException e) {
			LOGGER.error("", e);
		} finally {
			// close file
			try {
				if ( fis != null) {
					fis.close();
				}
			} catch (IOException e) {
				LOGGER.error("", e);
			}
			file.delete();
		}
		cmMediaResDao.insert(mediaVo);
		return mediaVo;
	}

	/**
	 * Do insert image.
	 *
	 * @param userVo the user vo
	 * @param file the file
	 * @param fileName the file name
	 * @return the res media vo
	 * @throws BaseException the base exception
	 * @see com.jiuyv.yl.console.common.service.IMediaImageService#doInsertImage(com.jiuyv.yl.model.security.SysMerUserVo, java.io.File, java.lang.String)
	 */
	public  CmMediaResVo doInsertImage(SecurityUserDetail userVo, InputStream ins, String xfileName)
			throws BaseException {
		CmMediaResVo mediaVo = new  CmMediaResVo();
		mediaVo.setRecCrtAcc(userVo.getLoginNm());
		String medDir = DIR_PREFIX + new SimpleDateFormat(DATE_FORMAT).format(new Date()) + "/" + UUID.randomUUID() + "/";
		String neFileName = StringUtils.defaultString(xfileName,"pic.jpg");
		String fileName = neFileName.indexOf("\\")>0?neFileName.substring(neFileName.lastIndexOf("\\")+1):neFileName;
		fileName = fileName.indexOf("/")>0?fileName.substring(fileName.lastIndexOf("/")+1):fileName;
		String extName = fileName.substring(fileName.lastIndexOf('.')).toLowerCase();
		if(!extName.matches("\\.(png|jpg|bmp|gif|jpeg)")) {
			throw new BaseException("", "请上传格式为jpg、png、jpeg、bmp、gif的图片");
		}
		// set image content
		try {
			// set fileName
			String oriName = fileName.substring(0, fileName.lastIndexOf('.'));
			oriName = oriName.length() > 160 ? oriName.substring(0, 160):oriName;
			String medName = URLEncoder.encode( oriName, "ISO-8859-1")  + extName;
			mediaVo.setMedName(medName);
			mediaVo.setMedDir(medDir);
			mediaVo.setMedPath(mediaVo.getMedDir() + mediaVo.getMedName());
			mediaVo.setMimeType(mimeTypeMap.get(extName));
			mediaVo.setCustomerCode(Long.valueOf(userVo.getLoginNm()));
			ByteArrayOutputStream thumbnailsByteStream = new ByteArrayOutputStream();
			BufferedImage bufImg = ImageUtil.readImage(ins);
			ImageUtil.zoomFixed(bufImg, thumbnailsByteStream, formatTypeMap.get(extName),ZOOM_HEIGHT, ZOOM_WIDTH, false, null);
			mediaVo.setMedThumb(thumbnailsByteStream.toByteArray());
			mediaVo.setMedContent(ImageUtil.toByteArray(bufImg, formatTypeMap.get(extName)));		
		} catch (IOException e) {
			LOGGER.error("", e);
		} 
		cmMediaResDao.insert(mediaVo);
		return mediaVo;
	}

	/**
	 * Do insert image.
	 *
	 * @param userVo the user vo
	 * @param file the file
	 * @param fileName the file name
	 * @return the res media vo
	 * @throws BaseException the base exception
	 * @see com.jiuyv.yl.console.common.service.IMediaImageService#doInsertImage(com.jiuyv.yl.model.security.SysMerUserVo, java.io.File, java.lang.String)
	 */
	public  CmMediaResVo doInsertFile(SecurityUserDetail userVo, File file, String xfileName)
			throws BaseException {
		 CmMediaResVo mediaVo = new  CmMediaResVo();
		mediaVo.setRecCrtAcc(userVo.getLoginNm());
		String medDir = DIR_PREFIX + new SimpleDateFormat(DATE_FORMAT).format(new Date()) + "/" ;
		String neFileName = StringUtils.defaultString(xfileName,"android.apk");
		String fileName = neFileName.indexOf("\\")>0?neFileName.substring(neFileName.lastIndexOf("\\")+1):neFileName;
		fileName = fileName.indexOf("/")>0?fileName.substring(fileName.lastIndexOf("/")+1):fileName;
		String extName = fileName.substring(fileName.lastIndexOf('.')).toLowerCase();
		/*if(!extName.matches("\\.(apk)")) {
			throw new BaseException("", "请上传格式为apk的图片");
		}*/
		// set image content
		FileInputStream fis = null;
		try {
			// set fileName
			String oriName = fileName.substring(0, fileName.lastIndexOf('.'));
			oriName = oriName.length() > 160 ? oriName.substring(0, 160):oriName;
			String medName = URLEncoder.encode( oriName + "_" + UUID.randomUUID(), "ISO-8859-1")  + extName;
			mediaVo.setMedName(medName);
			mediaVo.setMedDir(medDir);
			mediaVo.setMedPath(mediaVo.getMedDir() + mediaVo.getMedName());
			mediaVo.setMimeType(mimeTypeMap.get(extName));
			mediaVo.setCustomerCode(Long.valueOf(userVo.getLoginNm()));
			fis = new FileInputStream(file);
			ByteArrayOutputStream out = new ByteArrayOutputStream(fis.available());  
            byte[] b = new byte[fis.available()];  
            int n;  
            while ((n = fis.read(b)) != -1) {  
                out.write(b, 0, n);  
            }  
            fis.close();  
            out.close();  
			mediaVo.setMedContent(out.toByteArray());
		} catch (IOException e) {
			LOGGER.error("", e);
		} finally {
			// close file
			try {
				if ( fis != null) {
					fis.close();
				}
			} catch (IOException e) {
				LOGGER.error("", e);
			}
			file.delete();
		}
		cmMediaResDao.insert(mediaVo);
		return mediaVo;
	}

	/**
	 * Do insert image.
	 *
	 * @param userVo the user vo
	 * @param file the file
	 * @param fileName the file name
	 * @return the res media vo
	 * @throws BaseException the base exception
	 * @see com.jiuyv.yl.console.common.service.IMediaImageService#doInsertImage(com.jiuyv.yl.model.security.SysMerUserVo, java.io.File, java.lang.String)
	 */
	public  CmMediaResVo doInsertFile(SecurityUserDetail userVo, InputStream ins, String xfileName)
			throws BaseException {
		CmMediaResVo mediaVo = new  CmMediaResVo();
		mediaVo.setRecCrtAcc(userVo.getLoginNm());
		String medDir = DIR_PREFIX + new SimpleDateFormat(DATE_FORMAT).format(new Date()) + "/"  + UUID.randomUUID() + "/" ;
		String neFileName = StringUtils.defaultString(xfileName,"android.apk");
		String fileName = neFileName.indexOf("\\")>0?neFileName.substring(neFileName.lastIndexOf("\\")+1):neFileName;
		fileName = fileName.indexOf("/")>0?fileName.substring(fileName.lastIndexOf("/")+1):fileName;
		String extName = fileName.substring(fileName.lastIndexOf('.')).toLowerCase();
//		if(!extName.matches("\\.(apk)")) {
//			throw new BaseException("", "请上传格式为apk的文件");
//		}
		// set image content
		try {
			// set fileName
			String oriName = fileName.substring(0, fileName.lastIndexOf('.'));
			oriName = oriName.length() > 160 ? oriName.substring(0, 160):oriName;
			String medName = URLEncoder.encode( oriName, "ISO-8859-1")  + extName;
			mediaVo.setMedName(medName);
			mediaVo.setMedDir(medDir);
			mediaVo.setMedPath(mediaVo.getMedDir() + mediaVo.getMedName());
			mediaVo.setMimeType(mimeTypeMap.get(extName));
			mediaVo.setCustomerCode(Long.valueOf(userVo.getLoginNm()));
			ByteArrayOutputStream out = new ByteArrayOutputStream(ins.available());  
			byte[] b = new byte[ins.available()];  
			int n;  
			while ((n = ins.read(b)) != -1) {  
				out.write(b, 0, n);  
			}
			ins.close();
			out.close();  
			mediaVo.setMedContent(out.toByteArray());
		} catch (IOException e) {
			LOGGER.error("", e);
		} finally {
			// close file
			try {
				if ( ins != null) {
					ins.close();
				}
			} catch (IOException e) {
				LOGGER.error("Error close stream", e);
			}
		}
		cmMediaResDao.insert(mediaVo);
		return mediaVo;
	}
	
	/**
	 * Do insert image.
	 *
	 * @param userVo the user vo
	 * @param file the file
	 * @param fileName the file name
	 * @return the res media vo
	 * @throws BaseException the base exception
	 * @see com.jiuyv.yl.console.common.service.IMediaImageService#doInsertImage(com.jiuyv.yl.model.security.SysMerUserVo, java.io.File, java.lang.String)
	 */
	public  CmMediaResVo doInsertAttachImage(SecurityUserDetail userVo, File file, String xfileName, String refNo, String prefix)
			throws BaseException {
		 CmMediaResVo mediaVo = new  CmMediaResVo();
		mediaVo.setRecCrtAcc(userVo.getLoginNm());
		String medDir = prefix + new SimpleDateFormat(DATE_FORMAT).format(new Date()) + "/" + UUID.randomUUID() + "/";
		String neFileName = StringUtils.defaultString(xfileName,file.getName());
		String fileName = neFileName.indexOf("\\")>0?neFileName.substring(neFileName.lastIndexOf("\\")+1):neFileName;
		fileName = fileName.indexOf("/")>0?fileName.substring(fileName.lastIndexOf("/")+1):fileName;
		String extName = fileName.substring(fileName.lastIndexOf('.')).toLowerCase();
		if(!extName.matches("\\.(png|jpg|bmp|gif|jpeg)")) {
			throw new BaseException("", "请上传格式为jpg、png、jpeg、bmp、gif的图片");
		}
		// set image content
		FileInputStream fis = null;
		try {
			// set fileName
			String oriName = fileName.substring(0, fileName.lastIndexOf('.'));
			oriName = oriName.length() > 160 ? oriName.substring(0, 160):oriName;
			String medName = URLEncoder.encode( oriName, "ISO-8859-1")  + extName;
			mediaVo.setMedName(medName);
			mediaVo.setMedDir(medDir);
			mediaVo.setMedPath(mediaVo.getMedDir() + mediaVo.getMedName());
			mediaVo.setMimeType(mimeTypeMap.get(extName));
			mediaVo.setCustomerCode(Long.valueOf(userVo.getOprId()));
			mediaVo.setRefNo(refNo);
			fis = new FileInputStream(file);
			FileChannel fc = fis.getChannel();
			if (fc.size() / 1024 /1024 > 2) {
				throw new BaseException("","图片大小不得大于2M");
			}
			ByteArrayOutputStream thumbnailsByteStream = new ByteArrayOutputStream();
			BufferedImage bufImg = ImageUtil.readImage(fis);
			ImageUtil.zoomFixed(bufImg, thumbnailsByteStream, formatTypeMap.get(extName),ZOOM_HEIGHT, ZOOM_WIDTH, false, null);
			mediaVo.setMedThumb(thumbnailsByteStream.toByteArray());
			mediaVo.setMedContent(ImageUtil.toByteArray(bufImg, formatTypeMap.get(extName)));		
		} catch (IOException e) {
			LOGGER.error("", e);
		} finally {
			IOUtils.closeQuietly(fis);
			file.delete();
		}
		cmMediaResDao.insert(mediaVo);
		return mediaVo;
	}
	
	/**
	 * Do insert image.
	 *
	 * @param userVo the user vo
	 * @param file the file
	 * @param fileName the file name
	 * @return the res media vo
	 * @throws BaseException the base exception
	 * @see com.jiuyv.yl.console.common.service.IMediaImageService#doInsertImage(com.jiuyv.yl.model.security.SysMerUserVo, java.io.File, java.lang.String)
	 */
	public  CmMediaResVo doInsertAttachFile(SecurityUserDetail userVo, File file, String xfileName, String refNo, String prefix)
			throws BaseException {
		CmMediaResVo mediaVo = new  CmMediaResVo();
		mediaVo.setRecCrtAcc(userVo.getLoginNm());
		String medDir = prefix + new SimpleDateFormat(DATE_FORMAT).format(new Date()) + "/" ;
		String neFileName = StringUtils.defaultString(xfileName,file.getName());
		String fileName = neFileName.indexOf("\\")>0?neFileName.substring(neFileName.lastIndexOf("\\")+1):neFileName;
		fileName = fileName.indexOf("/")>0?fileName.substring(fileName.lastIndexOf("/")+1):fileName;
		String extName = fileName.substring(fileName.lastIndexOf('.')).toLowerCase();
		// set image content
		FileInputStream fis = null;
		try {
			// set fileName
			String oriName = fileName.substring(0, fileName.lastIndexOf('.'));
			oriName = oriName.length() > 160 ? oriName.substring(0, 160):oriName;
			String medName = URLEncoder.encode( oriName + "_" + UUID.randomUUID(), "ISO-8859-1")  + extName;
			mediaVo.setMedName(medName);
			mediaVo.setMedDir(medDir);
			mediaVo.setMedPath(mediaVo.getMedDir() + mediaVo.getMedName());
			mediaVo.setMimeType(mimeTypeMap.get(extName));
			mediaVo.setCustomerCode(Long.valueOf(userVo.getOprId()));
			mediaVo.setRefNo(refNo);
			fis = new FileInputStream(file);
			ByteArrayOutputStream out = new ByteArrayOutputStream(fis.available());  
            byte[] b = new byte[fis.available()];  
            int n;  
            while ((n = fis.read(b)) != -1) {  
                out.write(b, 0, n);  
            }  
            fis.close();  
            out.close();  
			mediaVo.setMedContent(out.toByteArray());
		} catch (IOException e) {
			LOGGER.error("", e);
		} finally {
			IOUtils.closeQuietly(fis);
			file.delete();
		}
		cmMediaResDao.insert(mediaVo);
		return mediaVo;
	}
	
	/**
	 * 设置 mediaDao.
	 *
	 * @param ICmMediaResDao the new mediaDao
	 */
	public void setCmMediaResDao(ICmMediaResDao cmMediaResDao) {
		this.cmMediaResDao = cmMediaResDao;
	}

}
