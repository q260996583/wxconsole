package com.jiuyv.yl.console.common.action;

import java.io.File;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.web.multipart.MultipartFile;

import com.jiuyv.yl.console.common.entity.CmMediaResVo;
import com.jiuyv.yl.console.common.service.inter.ICommonService;
import com.jiuyv.yl.console.common.service.inter.IMediaImageService;
import com.jiuyv.yl.console.orgmngr.entity.BankAccntVo;
import com.jiuyv.yl.console.orgmngr.entity.SpecMccRateVo;
import com.jiuyv.yl.console.orgmngr.entity.TblSysOrgInfoVo;
import com.jiuyv.yl.console.report.entity.BankClearSecRptVo;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Filter.Comparison;
import com.jiuyv.common.web.action.DefaultPageSupportAction;
import com.jiuyv.common.ExtDataUtil;

public class CommonAction extends DefaultPageSupportAction{

	/** 上传文件. */
	private File uploadFile ; 
	
	/** 上传文件名. */
	private String uploadFileName ;
	
	private ICommonService service;
	
	private IMediaImageService mediaSupportService;

	public ICommonService getService() {
		return service;
	}

	public void setService(ICommonService service) {
		this.service = service;
	}

	public String findSysOrg() throws Exception{
		ExtData<TblSysOrgInfoVo> resData = service.findSysOrg(
				this.getOrgFilters("org_code"), this.getPageInfo());
		this.setResData(resData);
		return SUCCESS;
	}
	
	public String findBankInfoList() throws Exception{
		String bankAccntType=ServletActionContext.getRequest().getParameter("bankAccntType");
		List<Filter> filters = getFilters();
		if(bankAccntType != null && bankAccntType != ""){
			Filter filter = new Filter("bankAccntType", Filter.STRING, bankAccntType, Comparison.EQ);
			filters.add(filter);
		}
		ExtData<BankAccntVo> data = service.findBankInfo(filters);
		setResData(data);
		return SUCCESS;
	}
	
	public String findMccDesc()throws Exception{
		ExtData<BankClearSecRptVo> data=service.findMccDesc(getFilters(),getPageInfo());
		this.setResData(data);
		return SUCCESS;
	}
	
	public String findSpecial()throws Exception{
		ExtData<SpecMccRateVo> data=service.findSpecial(getFilters(),getPageInfo());
		this.setResData(data);
		return SUCCESS;
	}
	
	public String findBankInfo() throws Exception{	
		List<Filter> filters = getFilters();	
		ExtData<BankAccntVo> data = service.findBankInfo(filters);
		setResData(data);
		return SUCCESS;
	}
	
	/**
	 * 上传图片
	 * 
	 * @return the string
	 * @throws Exception the exception
	 */
	public String uploadImg()throws Exception{
		CmMediaResVo mediaVo = mediaSupportService.doInsertImage(getUserDetailInfo(), uploadFile, uploadFileName);
			String medPath = mediaVo.getMedPath();
			if(medPath.startsWith("/")){
				mediaVo.setMedPath(medPath.replaceFirst("\\/", " "));
			}
		ExtData<CmMediaResVo> data = ExtDataUtil.genWithSingleData(mediaVo);
		setResData(data);
		return SUCCESS;
	}
	
	/**
	 * 上传文件
	 * 
	 * @return the string
	 * @throws Exception the exception
	 */
	public String uploadFile()throws Exception{
		CmMediaResVo mediaVo = mediaSupportService.doInsertFile(getUserDetailInfo(), uploadFile, uploadFileName);
		String medPath = mediaVo.getMedPath();
		if(medPath.startsWith("/")){
			mediaVo.setMedPath(medPath.replaceFirst("\\/", " "));
		}
		ExtData<CmMediaResVo> data = ExtDataUtil.genWithSingleData(mediaVo);
		setResData(data);
		return SUCCESS;
	}
	
	/**
	 * 上传附件图片
	 * 
	 * @return the string
	 * @throws Exception the exception
	 */
	public String uploadAttachImg()throws Exception{
		String refNo = reqParam("refNo");
		CmMediaResVo mediaVo = mediaSupportService.doInsertAttachImage(getUserDetailInfo(), uploadFile, uploadFileName, refNo, IMediaImageService.ATTACH_DIR_PREFIX);
		ExtData<CmMediaResVo> data = ExtDataUtil.genWithSingleData(mediaVo);
		setResData(data);
		return SUCCESS;
	}
	
	/**
	 * 上传附件文件
	 * 
	 * @return the string
	 * @throws Exception the exception
	 */
	public String uploadAttachFile()throws Exception{
		String refNo = reqParam("refNo");
		CmMediaResVo mediaVo = mediaSupportService.doInsertAttachFile(getUserDetailInfo(), uploadFile, uploadFileName, refNo, IMediaImageService.ATTACH_DIR_PREFIX);
		ExtData<CmMediaResVo> data = ExtDataUtil.genWithSingleData(mediaVo);
		setResData(data);
		return SUCCESS;
	}
	
	/**
	 * @return the uploadFile
	 */
	public File getUploadFile() {
		return uploadFile;
	}

	/**
	 * @param uploadFile the uploadFile to set
	 */
	public void setUploadFile(File uploadFile) {
		this.uploadFile = uploadFile;
	}

	/**
	 * @return the uploadFileName
	 */
	public String getUploadFileName() {
		return uploadFileName;
	}

	/**
	 * @param uploadFileName the uploadFileName to set
	 */
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	/**
	 * @param mediaSupportService the mediaSupportService to set
	 */
	public void setMediaSupportService(IMediaImageService mediaSupportService) {
		this.mediaSupportService = mediaSupportService;
	}

}
