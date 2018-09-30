package com.jiuyv.yl.console.common.service.inter;

import java.io.File;
import java.io.InputStream;

import com.jiuyv.yl.console.common.entity.CmMediaResVo;
import com.jiuyv.common.exception.BaseException;
import com.jiuyv.yl.console.security.entity.SecurityUserDetail;

/**
 * The Interface IMediaImageService.
 *
 * @company Shanghai JinYu Software Systems CO.,LTD.
 * @author 
 * @since 2014-3-11 23:29:10
 * @version 1.0.0
 */
public interface IMediaImageService {

	/** 默认上传目录前缀 */
	String DIR_PREFIX = "/upload/";
	
	/** 附件上传目录前缀 */
	String ATTACH_DIR_PREFIX = "/attach/";
	
	/**
	 * Do insert image.
	 * 
	 * @param userVo the user vo
	 * @param file the file
	 * @param fileName the file name
	 * @return the res media vo
	 * @throws BaseException the base exception
	 */
	CmMediaResVo doInsertImage(SecurityUserDetail userVo, File file, String fileName) throws BaseException;

	/**
	 * 插入图片并生成缩略图
	 * @param userVo
	 * @param ins
	 * @param fileName
	 * @return
	 * @throws BaseException
	 */
	CmMediaResVo doInsertImage(SecurityUserDetail userVo, InputStream ins, String fileName) throws BaseException;
	
	/**
	 * Do insert file.
	 * 
	 * @param userVo the user vo
	 * @param file the file
	 * @param fileName the file name
	 * @return the res media vo
	 * @throws BaseException the base exception
	 */
	CmMediaResVo doInsertFile(SecurityUserDetail userVo, File file, String fileName) throws BaseException;

	/**
	 * Do insert file.
	 * 
	 * @param userVo the user vo
	 * @param file the file
	 * @param fileName the file name
	 * @return the res media vo
	 * @throws BaseException the base exception
	 */
	CmMediaResVo doInsertFile(SecurityUserDetail userVo, InputStream ins, String fileName) throws BaseException;

	/**
	 * 上传图片附件
	 * @param userVo
	 * @param file
	 * @param fileName
	 * @param refNo
	 * @param attachDirPrefix
	 * @return
	 * @throws BaseException
	 */
	CmMediaResVo doInsertAttachImage(SecurityUserDetail userVo, File file, String fileName, String refNo,
			String attachDirPrefix) throws BaseException;
	
	/**
	 * 上传文件附件
	 * @param userVo
	 * @param file
	 * @param fileName
	 * @param refNo
	 * @param attachDirPrefix
	 * @return
	 * @throws BaseException
	 */
	CmMediaResVo doInsertAttachFile(SecurityUserDetail userVo, File file, String fileName, String refNo,
			String attachDirPrefix) throws BaseException;
	
}
