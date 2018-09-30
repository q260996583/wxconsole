package com.jiuyv.yl.console.notice.dao.impl;

import java.util.List;

import com.jiuyv.yl.console.notice.dao.inter.NoticeInfoDao;
import com.jiuyv.yl.console.notice.entity.NoticeInfoVo;
import com.jiuyv.yl.console.publicdao.PublicModuleDao;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;

public class NoticeInfoDaoImpl extends PublicModuleDao implements NoticeInfoDao {
	
	private static final String SELECT_QUERY = "notice.filterQueryPage";
	
	private static final String UPDATE = "notice.updateByKey";
	
	private static final String INSERT = "notice.insert";
	
	private static final String FIND_SINGLE_BY_KEY = "notice.findByKey";
	
	private static final String FIND_CHANNEL_BY_KEY= "notice.findChannelByKey";
	
	private static final String FIND_SEQ = "notice.findNoticeSeq";
	
	private static final String KEY_PROPERTY_NAME = "noticeSeq";
	
	@Override
	public ExtData<NoticeInfoVo> updateByKey(NoticeInfoVo noticeVo, List<Filter> filters)
			throws Exception {
		return getExtendSqlMapClientTemplate().updateSingleExtendForExtData(UPDATE,noticeVo, KEY_PROPERTY_NAME,SELECT_QUERY, filters);
	}
	
	@Override
	public ExtData<NoticeInfoVo> filterQueryPage(List<Filter> filters,
			Page pageInfo) throws Exception {
		ExtData<NoticeInfoVo> data= getExtendSqlMapClientTemplate().queryExtendForExtData(SELECT_QUERY, filters, pageInfo);
		return data;
	}
	
	@Override
	public NoticeInfoVo findByKey(Long noticeSeq) throws Exception {
		return (NoticeInfoVo) this.getExtendSqlMapClientTemplate().queryForObject(FIND_SINGLE_BY_KEY, noticeSeq);
	}
	
	@Override
	public ExtData<NoticeInfoVo> insert(NoticeInfoVo noticeVo,List<Filter> filters) throws Exception {
		noticeVo.setNoticeSeq(findNoticeSeq());
		ExtData<NoticeInfoVo> data= getExtendSqlMapClientTemplate().insertExtendForExtData(INSERT,noticeVo ,KEY_PROPERTY_NAME,SELECT_QUERY ,filters);
		return data;
	}
	
	@Override
	public Long findNoticeSeq(){
		return (Long) getExtendSqlMapClientTemplate().queryForObject(FIND_SEQ);
	}
	
	@Override
	public List<String> findChannelByNotice(Long noticeSeq){
		return (List<String>) this.getExtendSqlMapClientTemplate().queryForObject(FIND_CHANNEL_BY_KEY, noticeSeq);
	}
}
