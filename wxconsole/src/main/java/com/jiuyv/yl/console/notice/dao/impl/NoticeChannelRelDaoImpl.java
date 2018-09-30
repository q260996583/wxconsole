package com.jiuyv.yl.console.notice.dao.impl;

import java.util.List;

import com.jiuyv.yl.console.notice.dao.inter.NoticeChannelRelDao;
import com.jiuyv.yl.console.notice.entity.NoticeChannelRelVo;
import com.jiuyv.yl.console.notice.entity.NoticeInfoVo;
import com.jiuyv.yl.console.publicdao.PublicModuleDao;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.common.ExtDataUtil;

public class NoticeChannelRelDaoImpl extends PublicModuleDao implements NoticeChannelRelDao {
	
	private static final String SELECT_QUERY = "noticeChannelRel.filterQueryPage";
	
	private static final String INSERT = "noticeChannelRel.insert";
	
	private static final String DELETE_BY_NOTICESEQ = "noticeChannelRel.deleteByNoticeSeq";
	
	private static final String FIND_SINGLE_BY_KEY = "noticeChannelRel.findByKey";
	
	private static final String FIND_CHANNEL_BY_KEY= "noticeChannelRel.findChannelByNoticeSeq";
	
	
	@Override
	public ExtData<NoticeChannelRelVo> filterQueryPage(List<Filter> filters,
			Page pageInfo) throws Exception {
		ExtData<NoticeChannelRelVo> data= getExtendSqlMapClientTemplate().queryExtendForExtData(SELECT_QUERY, filters, pageInfo);
		return data;
	}
	
	@Override
	public NoticeChannelRelVo findByKey(NoticeChannelRelVo vo) throws Exception {
		return (NoticeChannelRelVo) this.getExtendSqlMapClientTemplate().queryForObject(FIND_SINGLE_BY_KEY, vo);
	}
	
	@Override
	public ExtData<NoticeChannelRelVo> insert(NoticeChannelRelVo noticeVo) throws Exception {
		ExtData<NoticeChannelRelVo> data= ExtDataUtil.genWithSingleData((NoticeChannelRelVo)getExtendSqlMapClientTemplate().insert(INSERT,noticeVo));
		return data;
	}
	@Override
	public void deleteByNoticeSeq(Long noticeSeq){
		getExtendSqlMapClientTemplate().delete(DELETE_BY_NOTICESEQ, noticeSeq);
	}
	@Override
	public List<String> findChannelByNoticeSeq(Long noticeSeq){
		return (List<String>) this.getExtendSqlMapClientTemplate().queryForList(FIND_CHANNEL_BY_KEY, noticeSeq);
	}
}
