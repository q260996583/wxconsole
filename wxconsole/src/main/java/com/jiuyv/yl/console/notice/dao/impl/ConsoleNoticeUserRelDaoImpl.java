package com.jiuyv.yl.console.notice.dao.impl;

import java.util.List;

import com.jiuyv.common.ExtDataUtil;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.yl.console.notice.dao.inter.ConsoleNoticeUserRelDao;
import com.jiuyv.yl.console.notice.entity.ConsoleNoticeUserRelVo;
import com.jiuyv.yl.console.notice.entity.NoticeUserVo;
import com.jiuyv.yl.console.publicdao.PublicModuleDao;

public class ConsoleNoticeUserRelDaoImpl extends PublicModuleDao implements ConsoleNoticeUserRelDao {
	
	private static final String SELECT_QUERY = "noticeUserRel.filterQueryPage";
	
	private static final String INSERT = "noticeUserRel.insert";
	
	private static final String DELETE_BY_NOTICESEQ = "noticeUserRel.deleteByNoticeSeq";
	
	private static final String FIND_SINGLE_BY_KEY = "noticeUserRel.findByKey";
	
	private static final String FIND_CHANNEL_BY_KEY= "noticeUserRel.findUserByNoticeSeq";
	
	
	@Override
	public ExtData<ConsoleNoticeUserRelVo> filterQueryPage(List<Filter> filters,
			Page pageInfo) throws Exception {
		ExtData<ConsoleNoticeUserRelVo> data= getExtendSqlMapClientTemplate().queryExtendForExtData(SELECT_QUERY, filters, pageInfo);
		return data;
	}
	
	@Override
	public ConsoleNoticeUserRelVo findByKey(ConsoleNoticeUserRelVo vo) throws Exception {
		return (ConsoleNoticeUserRelVo) this.getExtendSqlMapClientTemplate().queryForObject(FIND_SINGLE_BY_KEY, vo);
	}
	
	@Override
	public ExtData<ConsoleNoticeUserRelVo> insert(ConsoleNoticeUserRelVo noticeVo) throws Exception {
		ExtData<ConsoleNoticeUserRelVo> data= ExtDataUtil.genWithSingleData((ConsoleNoticeUserRelVo)getExtendSqlMapClientTemplate().insert(INSERT,noticeVo));
		return data;
	}
	@Override
	public void deleteByNoticeSeq(Long noticeSeq){
		getExtendSqlMapClientTemplate().delete(DELETE_BY_NOTICESEQ, noticeSeq);
	}
	@Override
	public List<String> findUserByNoticeSeq(Long noticeSeq){
		return (List<String>) this.getExtendSqlMapClientTemplate().queryForList(FIND_CHANNEL_BY_KEY, noticeSeq);
	}
	
	public List<NoticeUserVo> selectNoticeUserTree() {
		return (List<NoticeUserVo>) this.getExtendSqlMapClientTemplate().queryForList("noticeUserRel.selectNoticeUserTree");
	}
}
