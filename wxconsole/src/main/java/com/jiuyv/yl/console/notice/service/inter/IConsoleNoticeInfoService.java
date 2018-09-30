package com.jiuyv.yl.console.notice.service.inter;

import java.util.List;

import com.jiuyv.yl.console.notice.entity.ConsoleNoticeUserRelVo;
import com.jiuyv.yl.console.notice.entity.ConsoleNoticeInfoVo;
import com.jiuyv.yl.console.notice.entity.NoticeUserVo;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.yl.console.security.entity.User;
	
public interface IConsoleNoticeInfoService {
	
	/**根据公告查用户*/
	List<String> findUserByNoticeSeq(Long noticeSeq);
	
	ExtData<ConsoleNoticeInfoVo> selectAuditQuery(List<Filter> filters, Page pageInfo)
			throws Exception;
			
	/**分页查询*/
	ExtData<ConsoleNoticeInfoVo> selectQuery(List<Filter> filters,Page pageInfo) throws Exception;
	
	/**编辑*/
	ExtData<ConsoleNoticeInfoVo> doUpdateByKey(ConsoleNoticeInfoVo noticeInfoVo, List<Filter> filters,List<ConsoleNoticeUserRelVo> channelList,User user)throws Exception;
	
	/**新增*/
	ExtData<ConsoleNoticeInfoVo> doInsert(ConsoleNoticeInfoVo noticeInfoVo, List<Filter> filters,List<ConsoleNoticeUserRelVo> channelList,User user)throws Exception;
	
	/**查询单条*/
	ExtData<ConsoleNoticeInfoVo> findByKey(ConsoleNoticeInfoVo noticeInfoVo)throws Exception;
	
	/**提交*/
	ExtData<ConsoleNoticeInfoVo> doCommitByKey(ConsoleNoticeInfoVo noticeInfoVo, List<Filter> filters,User user)throws Exception;
	
	/**发布*/
	ExtData<ConsoleNoticeInfoVo> doReleaseByKey(ConsoleNoticeInfoVo noticeInfoVo, List<Filter> filters,User user,boolean isAll)throws Exception;
	
	/**删除*/
	ExtData<ConsoleNoticeInfoVo> doDeleteByKey(ConsoleNoticeInfoVo noticeInfoVo, List<Filter> filters,User user)throws Exception;
	
	/**撤销*/
	ExtData<ConsoleNoticeInfoVo> doRevokeByKey(ConsoleNoticeInfoVo noticeInfoVo, List<Filter> filters,User user,boolean isAll)throws Exception;
	
	/**驳回*/
	ExtData<ConsoleNoticeInfoVo> doRejectByKey(ConsoleNoticeInfoVo noticeInfoVo,List<Filter> filters,User user,boolean isAll) throws Exception;
	
	/**查询用户树*/
	List<NoticeUserVo> selectNoticeUserTree();
}