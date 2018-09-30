package com.jiuyv.yl.console.notice.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.jiuyv.yl.console.notice.dao.inter.NoticeChannelRelDao;
import com.jiuyv.yl.console.notice.dao.inter.NoticeInfoDao;
import com.jiuyv.yl.console.notice.entity.NoticeChannelRelVo;
import com.jiuyv.yl.console.notice.entity.NoticeInfoVo;
import com.jiuyv.yl.console.notice.service.inter.INoticeInfoService;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.common.ExtDataUtil;
import com.jiuyv.yl.console.security.entity.User;

public class NoticeInfoServiceImpl implements INoticeInfoService {

	private NoticeInfoDao dao;
	
	private NoticeChannelRelDao noticeChannelRelDao;
	
	// 默认生效日期
	private String DEFAULT_START_TIME = "19000101000000";
	// 默认失效日期
	private String DEFAULT_END_TIME = "29991231235959";
	/**根据公告查服务商*/
	@Override
	public List<String> findChannelByNoticeSeq(Long noticeSeq){
		return noticeChannelRelDao.findChannelByNoticeSeq(noticeSeq);
	}
	
	/**分页查询*/
	@Override
	public ExtData<NoticeInfoVo> selectQuery(List<Filter> filters, Page pageInfo)
			throws Exception {
		return dao.filterQueryPage(filters, pageInfo);
	}

	/**编辑*/
	@Override
	public ExtData<NoticeInfoVo> doUpdateByKey(NoticeInfoVo vo,
			List<Filter> filters,List<NoticeChannelRelVo> channelList,User user) throws Exception {
		NoticeInfoVo pvo =  dao.findByKey(vo.getNoticeSeq());
		if(pvo == null){
			throw new Exception("未查询到该公告");
		}
		pvo.setVersion(vo.getVersion()); 
		pvo.setTitle(vo.getTitle());
		pvo.setImgUrl(vo.getImgUrl());
		pvo.setBrief(vo.getBrief());
		pvo.setContent(vo.getContent()); 
		pvo.setSortNo(vo.getSortNo());
		pvo.setTopFlag(vo.getTopFlag()); 
		//00 初稿 01 草稿 02 已删除 03 提交 04 发布 05 驳回  06已撤销
		if(pvo.getStatus().equals("02")){
			throw new Exception("已删除公告不可编辑");
		}
		if(pvo.getStatus().equals("03")){
			throw new Exception("已提交公告不可编辑,若需编辑请等待审核");
		}
		if(pvo.getStatus().equals("04")){
			throw new Exception("已发布公告不可编辑,若需编辑请先撤销公告");
		}
		if(!pvo.getStatus().equals("00")){
			pvo.setStatus("01");
		}
		// 设置默认起效时间和失效时间
		if ( StringUtils.isBlank(vo.getStartTime()) ) {
			pvo.setStartTime(DEFAULT_START_TIME);
		} else {
			pvo.setStartTime(vo.getStartTime()); 
		}
		if ( StringUtils.isBlank(vo.getEndTime()) ) {
			pvo.setEndTime(DEFAULT_END_TIME);
		} else {
			pvo.setEndTime(vo.getEndTime()); 
		}
		pvo.setLastUptOrg(user.getOrgCode()); 
		pvo.setLastUptAcc(user.getLoginNm()); 
		// 先删除公告对应的服务商
		noticeChannelRelDao.deleteByNoticeSeq(pvo.getNoticeSeq());
        for (NoticeChannelRelVo m:channelList){             
            m.setNoticeSeq(pvo.getNoticeSeq());
            noticeChannelRelDao.insert(m);
        }
		return dao.updateByKey(pvo, filters);
	}
	
	/**提交*/
	public ExtData<NoticeInfoVo> doCommitByKey(NoticeInfoVo vo, List<Filter> filters,User user)throws Exception{
		NoticeInfoVo pvo =  dao.findByKey(vo.getNoticeSeq());
		if(pvo == null){
			throw new Exception("未查询到该公告");
		}
		pvo.setVersion(vo.getVersion()); 
		//00 初稿 01 草稿 02 已删除 03 提交 04 发布 05 驳回  06已撤销
		if(pvo.getStatus().equals("02")){
			throw new Exception("已删除公告不可提交");
		}
		if(pvo.getStatus().equals("03")){
			throw new Exception("已提交公告不可重复提交");
		}
		if(pvo.getStatus().equals("04")){
			throw new Exception("已发布公告不可提交,若需编辑请先撤销公告");
		}
		pvo.setStatus("03");
		pvo.setLastUptOrg(user.getOrgCode()); 
		pvo.setLastUptAcc(user.getLoginNm()); 
		return dao.updateByKey(pvo, filters);
	}
	
	/**发布*/
	public ExtData<NoticeInfoVo> doReleaseByKey(NoticeInfoVo vo, List<Filter> filters,User user)throws Exception{
		NoticeInfoVo pvo =  dao.findByKey(vo.getNoticeSeq());
		if(pvo == null){
			throw new Exception("未查询到该公告");
		}
		pvo.setVersion(vo.getVersion()); 
		//00 初稿 01 草稿 02 已删除 03 提交 04 发布 05 驳回  06已撤销
		if(!pvo.getStatus().equals("03")){
			throw new Exception("只能发布已提交公告");
		}
		pvo.setStatus("04");
		pvo.setLastUptOrg(user.getOrgCode()); 
		pvo.setLastUptAcc(user.getLoginNm()); 
		return dao.updateByKey(pvo, filters);
	}
	
	/**删除*/
	public ExtData<NoticeInfoVo> doDeleteByKey(NoticeInfoVo vo, List<Filter> filters,User user)throws Exception{
		NoticeInfoVo pvo =  dao.findByKey(vo.getNoticeSeq());
		if(pvo == null){
			throw new Exception("未查询到该公告");
		}
		pvo.setVersion(vo.getVersion()); 
		//00 初稿 01 草稿 02 已删除 03 提交 04 发布 05 驳回  06已撤销
		if(pvo.getStatus().equals("02")){
			throw new Exception("该公告已删除");
		}
		if(pvo.getStatus().equals("03")){
			throw new Exception("已提交公告不可删除,若需删除请等待审核");
		}
		if(pvo.getStatus().equals("04")){
			throw new Exception("已发布公告不可删除,若需删除请先撤销公告");
		}
		pvo.setStatus("02");
		pvo.setLastUptOrg(user.getOrgCode()); 
		pvo.setLastUptAcc(user.getLoginNm()); 
		return dao.updateByKey(pvo, filters);
	}
	
	/**撤销*/
	public ExtData<NoticeInfoVo> doRevokeByKey(NoticeInfoVo vo, List<Filter> filters,User user)throws Exception{
		NoticeInfoVo pvo =  dao.findByKey(vo.getNoticeSeq());
		if(pvo == null){
			throw new Exception("未查询到该公告");
		}
		pvo.setVersion(vo.getVersion()); 
		//00 初稿 01 草稿 02 已删除 03 提交 04 发布 05 驳回  06已撤销
		if(!pvo.getStatus().equals("04")){
			throw new Exception("只可撤销已发布公告");
		}
		pvo.setStatus("06");
		pvo.setLastUptOrg(user.getOrgCode()); 
		pvo.setLastUptAcc(user.getLoginNm()); 
		return dao.updateByKey(pvo, filters);
	}
	
	/**查询单条*/
	@Override
	public ExtData<NoticeInfoVo> findByKey(NoticeInfoVo noticeInfoVo) throws Exception {
		return ExtDataUtil.genWithSingleData(dao.findByKey(noticeInfoVo.getNoticeSeq()));
	}
	
	/**新增*/
	@Override
	public ExtData<NoticeInfoVo> doInsert(NoticeInfoVo noticeInfoVo,
			List<Filter> filters,List<NoticeChannelRelVo> channelList,User user) throws Exception {
		// TODO Auto-generated method stub
		noticeInfoVo.setRecCrtAcc(user.getLoginNm()); 
		noticeInfoVo.setLastUptAcc(user.getLoginNm()); 
		noticeInfoVo.setLastUptOrg(user.getOrgCode()); 
		// 设置默认起效时间和失效时间
		if ( StringUtils.isBlank(noticeInfoVo.getStartTime()) ) {
			noticeInfoVo.setStartTime(DEFAULT_START_TIME);
		}
		if ( StringUtils.isBlank(noticeInfoVo.getEndTime()) ) {
			noticeInfoVo.setEndTime(DEFAULT_END_TIME);
		}
		ExtData<NoticeInfoVo> data = dao.insert(noticeInfoVo, filters);
		if(data.isSuccess()){
			NoticeInfoVo tempVo=data.getRoot().get(0);
	        Long noticeSeq = tempVo.getNoticeSeq();        
	        for (NoticeChannelRelVo m:channelList){             
	            m.setNoticeSeq(noticeSeq);
	            noticeChannelRelDao.insert(m);
	        }
		}
		return data;
	}
	
	/**驳回*/
	@Override
	public ExtData<NoticeInfoVo> doRejectByKey(NoticeInfoVo noticeInfoVo,
			List<Filter> filters,User user) throws Exception {
		NoticeInfoVo pvo =  dao.findByKey(noticeInfoVo.getNoticeSeq());
		if(pvo == null){
			throw new Exception("未查询到该公告");
		}
		pvo.setVersion(noticeInfoVo.getVersion()); 
		//00 初稿 01 草稿 02 已删除 03 提交 04 发布 05 驳回  06已撤销
		if(!pvo.getStatus().equals("03")){
			throw new Exception("只可驳回已提交公告");
		}
		pvo.setStatus("05");
		pvo.setLastUptOrg(user.getOrgCode()); 
		pvo.setLastUptAcc(user.getLoginNm()); 
		return dao.updateByKey(pvo, filters);
	}
	
	public void setDao(NoticeInfoDao dao) {
		this.dao = dao;
	}

	public void setNoticeChannelRelDao(NoticeChannelRelDao noticeChannelRelDao) {
		this.noticeChannelRelDao = noticeChannelRelDao;
	}
	
}
