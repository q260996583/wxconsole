package com.jiuyv.yl.console.common.entity;

/**
 * The Interface ErrorCode.
 * 
 * @company Shanghai JinYu Software Systems CO.,LTD.
 * @author 
 * @since 2014-1-3 10:32:29
 * @version 1.0.0
 */
public interface ErrorCode {
	// 10__:安全模块
	// 100_:角色错误信息
	/** CODE:1001. */
	String CODE_1001 = "1001";
	/** MSG:请选择角色权限. */
	String CODE_1001_MSG = "请选择角色权限";
	/** MSG:未查询到指定角色. */
	String CODE_1001_MSG_1 = "未查询到指定角色";
	/** CODE:1003. */
	String CODE_1003 = "1003";
	/** MSG:角色已经删除，不能进行删除操作. */
	String CODE_1003_MSG = "角色已经删除，不能进行删除操作";

	// 101_:机构错误信息
	/** CODE:1011. */
	String CODE_1011 = "1011";
	/** MSG:机构信息异常. */
	String CODE_1011_MSG = "机构信息异常";
	/** MSG:未查询到指定机构. */
	String CODE_1011_MSG_1 = "未查询到指定机构";
	/** CODE:1012 */
	String CODE_1012 = "1012";
	/** MSG:请勿操作指定机构 */
	String CODE_1012_MSG = "请勿操作系统机构";
	/** CODE:1013. */
	String CODE_1013 = "1013";
	/** MSG:机构已经删除，不能进行删除操作. */
	String CODE_1013_MSG = "机构已经删除，不能进行删除操作";
	/** MSG:机构已经删除，不能进行更新操作 */
	String CODE_1013_MSG_1 = "机构已经删除，不能进行更新操作";
	/** CODE:1014 */
	String CODE_1014 = "1014";
	/** MSG:该机构已存在 */
	String CODE_1014_MSG = "该机构已存在";
	
	// 102_:用户错误信息
	/** CODE:1021 */
	String CODE_1021 = "1021";
	/** MSG:未查询到指定用户. */
	String CODE_1021_MSG = "未查询到指定用户";
	/** CODE:1022 */
	String CODE_1022 = "1022";
	/** MSG:该用户已被冻结. 请刷新页面后继续操作. */
	String CODE_1022_MSG = "该用户已被冻结. 请刷新页面后继续操作";
	String CODE_1022_MSG_1 = "该用户未被冻结, 请刷新页面后继续操作";

	/** CODE:1023*/
	String CODE_1023 = "1023";
	/** MSG:该用户已存在. */
	String CODE_1023_MSG = "该用户已存在";
	/** MSG:该登录账号已存在. */
	String CODE_1023_MSG_1 = "该登录账号已存在";
	/** CODE:1024*/
	String CODE_1024 = "1024";
	/** MSG:请选择角色. */
	String CODE_1024_MSG = "请选择角色";
	/** MSG:请填写登录名. */
	String CODE_1024_MSG_1 = "请填写登录名";
	/** CODE:1025*/
	String CODE_1025 = "1025";
	/** MSG:新旧密码不能相同！. */
	String CODE_1025_MSG = "新旧密码不能相同！";
	/** MSG:请输入正确的密码.  */
	String CODE_1025_MSG_1 = "请输入正确的密码";
	/** CODE:1026.  */
	String CODE_1026 = "1026";
	/** MSG:请输入手机号.  */
	String CODE_1026_MSG = "请输入手机号";
	/** MSG:用户状态修改失败. */
	String CODE_1027 = "1027";
	String CODE_1027_MSG = "用户状态修改失败";
	/** MSG:插入用户商户关联失败. */
	String CODE_1028 = "1028";
	String CODE_1028_MSG = "插入用户商户关联失败";
	// 103_:日志查询错误
	/** CODE:1031 */
	String CODE_1031 = "1031";
	/** MSG:请求日志流水号为空. */
	String CODE_1031_MSG = "请求日志流水号为空";
	
	/** CODE:1032 */
	String CODE_1032 = "1032";
	/** MSG:未查询到请求日志流水信息. */
	String CODE_1032_MSG = "未查询到请求日志流水信息";
	
	// 99__:系统\框架错误信息
	/** CODE:9901 */
	String CODE_9901 = "9901";
	/** MSG:页面对象获取失败 */
	String CODE_9901_MSG = "页面对象获取失败";
	
	/** CODE:9902 */
	String CODE_9902 = "9902";
	/** MSG:数据库插入单条记录失败. */
	String CODE_9902_MSG = "数据库插入单条记录失败";
	/** MSG:数据库更新单条记录失败. */
	String CODE_9902_MSG_1 = "数据库更新单条记录失败";
	/** MSG:数据更新失败，请重新加载页面后继续操作*/
	String CODE_9902_MSG_2 = "数据更新失败，请重新加载页面后继续操作";
	
	/** CODE:9901 */
	String CODE_9903 = "9903";
	/** MSG:会话失效，请重新登录 */
	String CODE_9903_MSG = "会话失效，请重新登录";

	// 40__: 站内信息管理
	/** CODE:4001 */
	String CODE_4001 = "4001";
	/** MSG:未查询到匹配的消息信息 */
	String CODE_4001_MSG = "未查询到匹配的消息信息. ";
	/** CODE:4002 */
	String CODE_4002 = "4002";
	/** MSG:仅草稿状态消息可进行此操作 */
	String CODE_4002_MSG = "仅草稿状态消息可进行此操作（保存/发送/删除）. ";
	/** CODE:4003 */
	String CODE_4003 = "4003";
	/** MSG:消息标题不能为空 */
	String CODE_4003_MSG = "消息标题不能为空";
	/** MSG:消息内容不能为空*/
	String CODE_4003_MSG_1 = "消息内容不能为空";
	/** MSG:收件人信息不能为空*/
	String CODE_4003_MSG_2 = "收件人信息不能为空";
	/** MSG:页面获取信息失败 */
	String CODE_4003_MSG_3 = "页面获取信息失败";
	/** CODE:4004 */
	String CODE_4004 = "4004";
	/** MSG:消息已删除 */
	String CODE_4004_MSG = "消息已删除";
	/** CODE:4011 */
	String CODE_4011 = "4011";
	/** MSG:未查询到匹配模板 */
	String CODE_4011_MSG = "未查询到匹配模板. ";
	/** CODE:4013 */
	String CODE_4013 = "4013";
	/** MSG:未查询到匹配模板 */
	String CODE_4013_MSG = "页面获取信息失败. ";
	
	/** CODE:4020 */
	String CODE_4020 = "4020";
	/** MSG:参数不能为空 */
	String CODE_4020_MSG_P = "参数[%s]不能为空";
	/** CODE:4021 */
	String CODE_4021 = "4021";
	/** MSG:参数校验不通过 */
	String CODE_4021_MSG_P = "参数[%s]校验不通过";
	/** CODE:4020 */
	String CODE_4022 = "4022";
	/** MSG:参数不能为空 */
	String CODE_4022_MSG_P = "未查询到指定参数信息";
	
	
	// 批处理
	/** 批处理日志新增错误code */
	String ERR_BATCH_LOG_INSERT_FAIL = "0800";
	/** 批处理状态修改错误code */
	String ERR_BATCH_STATUS_UPD_FAIL = "0801";
	/** 批处理失败错误code */
	String ERR_BATCH_EXCUTE_FAIL = "0802";
	/** 取得下一个批处理步骤失败code */
	String ERR_BATCH_GET_NEXT_STEP_FAIL = "0803";
	/** 取不到butchSt错误code(不存在或存在多个) */
	String ERR_BATCH_STATE_NOT_VALID = "0804";
	/** 清算日String->Date转型失败 **/
	String ERR_STLMDAY_PARSE_FAIL = "0809";
	/** 入参为空 **/
	String ERR_NULL_ARGS = "0805";
	/** 数据库插入失败 */
	String ERR_SETTLE_DAO_INSERT_FAIL = "0806";
	/** 数据库更新失败 */
	String ERR_SETTLE_DAO_UPDATE_FAIL = "0807";
	
	/** 前一清算日步骤尚未结束 **/
	String ERR_BATCH_PREV_DAY_STEP_NOT_FINISH = "0850";
	/** 未找到配置的步骤service **/
	String ERR_STEP_SERVICE_NOT_EXISTS = "0851";
	
	/** 数据库插入失败 */
	String ERR_BATCHDATA_INSERT_FAIL = "0900";
	/** 数据库更新失败 */
	String ERR_BATCHDATA_UPDATE_FAIL = "0901";
	
	// 20__: 网站会员管理
	/** CODE:2001. */
	String CODE_2001 = "2001";
	/** MSG:未查询到指定会员. */
	String CODE_2001_MSG = "未查询到指定会员";
	/** CODE:2002. */
	String CODE_2002 = "2002";
	/** MSG:该会员已经是无效状态. */
	String CODE_2002_MSG = "该会员已经是无效状态";
	/** MSG:该会员是无效状态,无效状态会员不可更新 */
	String CODE_2002_MSG_1 = "该会员是无效状态,无效状态会员不可更新";
	/** CODE:2003 */
	String CODE_2003 = "2003";
	/** MSG:该会员已存在 */
	String CODE_2003_MSG = "该会员已存在";
	
	/** CODE:2011. */
	String CODE_2011 = "2011";
	/** MSG:未查询到指定贷款记录. */
	String CODE_2011_MSG = "未查询到指定贷款记录";
	/** CODE:2012 */
	String CODE_2012 = "2012";
	/** MSG:该商户已存在 */
	String CODE_2012_MSG = "该商户已存在";
	
	/** CODE:2021. */
	String CODE_2021 = "2021";
	/** MSG:未查询到指定商户. */
	String CODE_2021_MSG = "未查询到指定商户";
	/** CODE:2022. */
	String CODE_2022 = "2022";
	/** MSG:该商户已经是无效状态. */
	String CODE_2022_MSG = "该商户已经是无效状态";
	/** MSG:该商户已经是无效状态,无效状态商户不可更新 */
	String CODE_2022_MSG_1 = "该商户已经是无效状态,无效状态商户不可更新";
	/** CODE:2023 */
	String CODE_2023 = "2023";
	/** MSG:该商户已存在 */
	String CODE_2023_MSG = "该商户已存在";

	// 30__: 服务商管理
	/** CODE:3001. */
	String CODE_3001 = "3001";
	/** MSG:未查询到指定服务商. */
	String CODE_3001_MSG = "未查询到指定服务商";
	/** CODE:3002. */
	String CODE_3002 = "3002";
	/** MSG:该服务商已存在. */
	String CODE_3002_MSG = "该服务商已存在";
	
}
