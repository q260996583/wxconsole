package com.jiuyv.yl.console.notice.dao.impl;

import java.util.List;

import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.yl.console.notice.dao.inter.ConsoleNoticeInfoDao;
import com.jiuyv.yl.console.notice.entity.ConsoleNoticeInfoVo;
import com.jiuyv.yl.console.publicdao.PublicModuleDao;

public class ConsoleNoticeInfoDaoImpl extends PublicModuleDao implements ConsoleNoticeInfoDao {
	
	private static final String SELECT_QUERY = "consoleNotice.filterQueryPage";
	
	private static final String SELECT_AUDIT_QUERY = "consoleNotice.filterAuditQueryPage";
	
	private static final String UPDATE = "consoleNotice.updateByKey";
	
	private static final String INSERT = "consoleNotice.insert";
	
	private static final String FIND_SINGLE_BY_KEY = "consoleNotice.findByKey";
	
	private static final String FIND_SEQ = "consoleNotice.findNoticeSeq";
	
	private static final String KEY_PROPERTY_NAME = "noticeSeq";
	
	@Override
	public ExtData<ConsoleNoticeInfoVo> updateByKey(ConsoleNoticeInfoVo noticeVo, List<Filter> filters)
			throws Exception {
		return getExtendSqlMapClientTemplate().updateSingleExtendForExtData(UPDATE,noticeVo, KEY_PROPERTY_NAME,SELECT_QUERY, filters);
	}
	
	@Override
	public ExtData<ConsoleNoticeInfoVo> filterQueryPage(List<Filter> filters,
			Page pageInfo) throws Exception {
		ExtData<ConsoleNoticeInfoVo> data= getExtendSqlMapClientTemplate().queryExtendForExtData(SELECT_QUERY, filters, pageInfo);
		return data;
	}
	
	public ExtData<ConsoleNoticeInfoVo> filterAuditQueryPage(List<Filter> filters,
			Page pageInfo) throws Exception {
		ExtData<ConsoleNoticeInfoVo> data= getExtendSqlMapClientTemplate().queryExtendForExtData(SELECT_AUDIT_QUERY, filters, pageInfo);
		return data;
	}
	
	@Override
	public ConsoleNoticeInfoVo findByKey(Long noticeSeq) throws Exception {
		return (ConsoleNoticeInfoVo) this.getExtendSqlMapClientTemplate().queryForObject(FIND_SINGLE_BY_KEY, noticeSeq);
	}
	
	@Override
	public ExtData<ConsoleNoticeInfoVo> insert(ConsoleNoticeInfoVo noticeVo,List<Filter> filters) throws Exception {
		noticeVo.setNoticeSeq(findNoticeSeq());
		ExtData<ConsoleNoticeInfoVo> data= getExtendSqlMapClientTemplate().insertExtendForExtData(INSERT,noticeVo ,KEY_PROPERTY_NAME,SELECT_QUERY ,filters);
		return data;
	}
	
	@Override
	public Long findNoticeSeq(){
		return (Long) getExtendSqlMapClientTemplate().queryForObject(FIND_SEQ);
	}
}
