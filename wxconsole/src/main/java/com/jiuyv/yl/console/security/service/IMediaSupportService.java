package com.jiuyv.yl.console.security.service;

import com.jiuyv.yl.console.security.entity.IMedia;

/**
 * 
 * @author 
 *
 */
public interface IMediaSupportService {

	/**
	 * 根据路径查询出对应的资源
	 * 
	 * 
	 * @param filePath
	 * @return
	 */
	IMedia findMedia(String filePath, String fileType);

	/**
	 * 根据关联号和序号查询媒体信息
	 * @param medSeq 序号
	 * @param refNo 关联号
	 * @param fileType
	 * @return
	 */
	IMedia findAttach(String medSeq, String refNo, String fileType);

}
