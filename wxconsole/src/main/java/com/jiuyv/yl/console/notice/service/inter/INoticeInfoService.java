package com.jiuyv.yl.console.notice.service.inter;

import java.util.List;

import com.jiuyv.yl.console.notice.entity.NoticeChannelRelVo;
import com.jiuyv.yl.console.notice.entity.NoticeInfoVo;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.yl.console.security.entity.User;
	
public interface INoticeInfoService {
	
	/**根据公告查服务商*/
	List<String> findChannelByNoticeSeq(Long noticeSeq);
	
	/**分页查询*/
	ExtData<NoticeInfoVo> selectQuery(List<Filter> filters,Page pageInfo) throws Exception;
	
	/**编辑*/
	ExtData<NoticeInfoVo> doUpdateByKey(NoticeInfoVo noticeInfoVo, List<Filter> filters,List<NoticeChannelRelVo> channelList,User user)throws Exception;
	
	/**新增*/
	ExtData<NoticeInfoVo> doInsert(NoticeInfoVo noticeInfoVo, List<Filter> filters,List<NoticeChannelRelVo> channelList,User user)throws Exception;
	
	/**查询单条*/
	ExtData<NoticeInfoVo> findByKey(NoticeInfoVo noticeInfoVo)throws Exception;
	
	/**提交*/
	ExtData<NoticeInfoVo> doCommitByKey(NoticeInfoVo noticeInfoVo, List<Filter> filters,User user)throws Exception;
	
	/**发布*/
	ExtData<NoticeInfoVo> doReleaseByKey(NoticeInfoVo noticeInfoVo, List<Filter> filters,User user)throws Exception;
	
	/**删除*/
	ExtData<NoticeInfoVo> doDeleteByKey(NoticeInfoVo noticeInfoVo, List<Filter> filters,User user)throws Exception;
	
	/**撤销*/
	ExtData<NoticeInfoVo> doRevokeByKey(NoticeInfoVo noticeInfoVo, List<Filter> filters,User user)throws Exception;
	
	/**驳回*/
	ExtData<NoticeInfoVo> doRejectByKey(NoticeInfoVo noticeInfoVo,List<Filter> filters,User user) throws Exception;
}