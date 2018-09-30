$(document).ready(function() {
// 初始化表单验证控件
$.formValidator.initConfig({validatorgroup:'1',formid:'form2',onerror:function(msg){alert(msg);}});
$("#a_orgCode").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:15,max:15,onerror:"服务商内部商户号不能为空且只能是15个字(数字，字母)"}).regexValidator({regexp:"^[A-Za-z0-9]+$",onerror:"服务商内部商户号仅能输入数字，字母"});
$("#a_accntbankNo").formValidator({validatorgroup:'1',empty:true,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:0,max:20,onerror:"开户银行网点号不能超过20个字(数字，字母)"}).regexValidator({regexp:"^[A-Za-z0-9]+$",onerror:"开户银行网点号仅能输入数字，字母"});
$("#a_merName").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:60,onerror:"商户名称不能为空且最多60个字"});
$("#a_merOutName").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:60,onerror:"商户对外经营名称不能为空且最多60个字"});
$("#a_enName").formValidator({validatorgroup:'1',empty:true,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:0,max:60,onerror:"商户英文名称最多60个字"});
$("#a_enOutName").formValidator({validatorgroup:'1',empty:true,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:0,max:60,onerror:"商户对外英文名称最多60个字"});
$("#a_mcc").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,onerror:"mcc码不能为空"});
$("#a_mccGrp").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,onerror:"商户类别(结算)不能为空"});
$("#a_mccGrpImp").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,onerror:"商户类别(预期)不能为空"});
$("#a_mccRemark").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({max:400,onerror:"进件类别备注最多400个字符"});
$("#a_channel").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,onerror:"服务商号不能为空"});
$("#a_areaCode").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,onerror:"区域码不能为空"});
$("#a_licenseNo").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:30,onerror:"营业执照统一社会信用代码码不能为空且最多30个字(数字，字母)"}).regexValidator({regexp:"^[A-Za-z0-9]+$",onerror:"营业执照统一社会信用代码码仅能输入数字，字母"});
$("#a_licenseAddr").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:100,onerror:"营业执照注册地址不能为空且最多100个字"});
$("#a_address").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:100,onerror:"商户装机地址不能为空且最多100个字"});
$("#a_taxNo").formValidator({validatorgroup:'1',empty:true,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:0,max:30,onerror:"税务登记证号码最多30位(数字，字母)"}).regexValidator({regexp:"^[A-Za-z0-9]+$",onerror:"税务登记证号码仅能输入数字，字母"});
$("#a_certNo").formValidator({validatorgroup:'1',empty:true,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:0,max:30,onerror:"组织机构代码证最多30位(数字，字母,-)"}).regexValidator({regexp:"^[A-Za-z0-9-]+$",onerror:"组织机构代码仅能输入数字，字母或者-"});
$("#a_personName").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:4,max:60,onerror:"法人姓名不能为空且最多30位字符"}).regexValidator({regexp:"^[A-Z a-z.]{2,29}[A-Za-z]$|^[\u4E00-\u9FA5]{2,30}$",onerror:"法人姓名格式不正确，2-30位字符"});
$("#a_personNo").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:30,onerror:"法人证件号不能为空"});
$("#a_busiBgtTime").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:6,max:6,onerror:"营业开始时间只能6位数字，时间格式 HHmmss"}).regexValidator({regexp:"^([0-1]?[0-9]|2[0-3])([0-5][0-9])([0-5][0-9])$",onerror:"请输入有效的时间格式，格式 HHmmss"});
$("#a_busiEndTime").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:6,max:6,onerror:"营业结束时间只能6位数字，时间格式 HHmmss"}).regexValidator({regexp:"^([0-1]?[0-9]|2[0-3])([0-5][0-9])([0-5][0-9])$",onerror:"请输入有效的时间格式，格式 HHmmss"});
$("#a_area").formValidator({validatorgroup:'1',empty:true,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:0,max:12,onerror:"营业面积(平方米)最多12个字(数字)"}).regexValidator({regexp:"^[0-9]*$",onerror:"营业面积(平方米)仅能输入数字"});
$("#a_monthRent").formValidator({validatorgroup:'1',empty:true,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:0,max:11,onerror:"月租金(元)最多11个字"}).regexValidator({regexp:"^\\d{0,8}(\\.\\d{0,2})?$",onerror:"0.00 =< 月租金(元) < 10000000.00"});
$("#a_posNum").formValidator({validatorgroup:'1',empty:true,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:0,max:5,onerror:"收银台数最多5个字(数字)"}).regexValidator({regexp:"^[0-9]*$",onerror:"收银台数仅能输入数字"});
$("#a_bankAccntId").formValidator({validatorgroup:'1',empty:false,onshow:"请选择对公账户",oncorrect:"√"}).inputValidator({min:1,max:20,onerror:"请选对公账户"});
$("#a_accntType").formValidator({validatorgroup:'1',empty:false,onshow:"请选择商户账户类型",oncorrect:"√"}).inputValidator({min:1,max:20,onerror:"请选商户账户类型"});
//lixl add 20161213 start
//$("#a_wechatPayOrg").formValidator({validatorgroup:'1',empty:false,onshow:"请选择支付机构",oncorrect:"√"}).inputValidator({min:1,max:20,onerror:"请选择支付机构"});
//$("#a_alipayPayOrg").formValidator({validatorgroup:'1',empty:false,onshow:"请选择支付机构",oncorrect:"√"}).inputValidator({min:1,max:20,onerror:"请选择支付机构"});

//lixl add 20161213 end
$("#a_accntName").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:60,onerror:"商户账户名称不能为空且最多60位"});
$("#a_accntNo").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:30,onerror:"商户账户号码不能为空且最多30位"}).regexValidator({regexp:"^[0-9]+$",onerror:"商户账户号码只能输入数字"});
$("#a_accntBank").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:60,onerror:"商户开户行不能为空且最多60位"});
$("#a_feeRate").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:6,onerror:"商户手续费率最多6个字"}).regexValidator({regexp:"^\\d{0,2}(\\.\\d{0,3})?$",onerror:"0.000 =< 手续费率(%) < 100.000"});
$("#a_debitRate").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:8,onerror:"手续费率必须填写"}).regexValidator({regexp:"^\\d{0,2}(\\.\\d{0,4})?$",onerror:"0.0000 =< 手续费率(%) < 100.0000"});
$("#a_wechatPayRate").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:8,onerror:"手续费率必须填写"}).regexValidator({regexp:"^\\d{0,2}(\\.\\d{0,4})?$",onerror:"0.0000 =< 手续费率(%) < 100.0000"});
$("#a_alipayPayRate").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:8,onerror:"手续费率必须填写"}).regexValidator({regexp:"^\\d{0,2}(\\.\\d{0,4})?$",onerror:"0.0000 =< 手续费率(%) < 100.0000"});
$("#a_outCardRate").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:8,onerror:"手续费率必须填写"}).regexValidator({regexp:"^\\d{0,2}(\\.\\d{0,4})?$",onerror:"0.0000 =< 手续费率(%) < 100.0000"});
$("#a_creditRate").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:8,onerror:"手续费率必须填写"}).regexValidator({regexp:"^\\d{0,2}(\\.\\d{0,4})?$",onerror:"0.0000 =< 手续费率(%) < 100.0000"});
$("#a_debitMaxFee").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:11,onerror:"商户手续费封顶值(元)必填且最多11个字符"}).regexValidator({regexp:"^\\d{0,8}(\\.\\d{0,2})?$",onerror:"0.00 =< 商户手续费封顶值(元) < 10000000.00"});
$("#a_merContact").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:4,max:60,onerror:"商户联系人不能为空且最多30个字"}).regexValidator({regexp:"^[\u4E00-\u9FA5]{2,30}$",onerror:"商户联系人格式不正确，2-30位汉字"});
$("#a_merFax").formValidator({validatorgroup:'1',empty:true,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:0,max:20,onerror:"商户传真最多20个字(数字，字母)"}).regexValidator({regexp:"^[A-Za-z0-9]+$",onerror:"商户传真仅能输入数字，字母"});
$("#a_merPhone").formValidator({validatorgroup:'1',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:20,onerror:"商户联系电话不能为空且最多20个字"}).regexValidator({regexp:"^0?1[3,4,5,6,7,8]{1}[0-9]{9}$|^0[0-9]{2,3}[0-9]{7,8}$",onerror:"商户联系电话仅能输入数字，字母或者-，必须包含地区编码"});
$("#a_personNoType").formValidator({validatorgroup:'1',empty:false,onshow:"请选择法人证件类型",oncorrect:"√"}).inputValidator({min:1,max:20,onerror:"请选择法人证件类型"});
$("#a_bankBranchNo").formValidator({validatorgroup:'1',empty:true,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:0,max:12,onerror:"开户银行网点号不能超过12个字(数字，字母)"});

$.formValidator.initConfig({validatorgroup:'2',formid:'form3',onerror:function(msg){alert(msg);}});
$("#b_orgCode").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:15,max:15,onerror:"服务商内部商户号不能为空且只能是15个字(数字，字母)"}).regexValidator({regexp:"^[A-Za-z0-9]+$",onerror:"服务商内部商户号仅能输入数字，字母"});
$("#b_accntbankNo").formValidator({validatorgroup:'2',empty:true,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:0,max:20,onerror:"开户银行网点号不能超过20个字(数字，字母)"}).regexValidator({regexp:"^[A-Za-z0-9]+$",onerror:"开户银行网点号仅能输入数字，字母"});
$("#b_merName").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:60,onerror:"商户名称不能为空且最多60个字"});
$("#b_merOutName").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:60,onerror:"商户对外经营名称不能为空且最多60个字"});
$("#b_enName").formValidator({validatorgroup:'2',empty:true,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:0,max:60,onerror:"商户英文名称最多60个字"});
$("#b_enOutName").formValidator({validatorgroup:'2',empty:true,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:0,max:60,onerror:"商户对外英文名称最多60个字"});
$("#b_mcc").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,onerror:"mcc码不能为空"});
$("#b_mccGrp").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,onerror:"商户类别(结算)不能为空"});
$("#b_mccGrpImp").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,onerror:"商户类别(预期)不能为空"});
$("#b_mccRemark").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({max:400,onerror:"进件类别备注最多400个字符"});
$("#b_areaCode").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,onerror:"区域码不能为空"});
$("#b_licenseNo").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:30,onerror:"营业执照统一社会信用代码码不能为空且最多30个字(数字，字母)"}).regexValidator({regexp:"^[A-Za-z0-9]+$",onerror:"营业执照统一社会信用代码码仅能输入数字，字母"});
$("#b_licenseAddr").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:100,onerror:"营业执照注册地址不能为空且最多100个字"});
$("#b_address").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:100,onerror:"商户装机地址不能为空且最多100个字"});
$("#b_taxNo").formValidator({validatorgroup:'2',empty:true,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:0,max:30,onerror:"税务登记证号码最多30位(数字，字母)"}).regexValidator({regexp:"^[A-Za-z0-9]+$",onerror:"税务登记证号码仅能输入数字，字母"});
$("#b_certNo").formValidator({validatorgroup:'2',empty:true,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:0,max:30,onerror:"组织机构代码证最多30位(数字，字母,-)"}).regexValidator({regexp:"^[A-Za-z0-9-]+$",onerror:"组织机构代码仅能输入数字，字母或者-"});
$("#b_personName").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:4,max:60,onerror:"法人姓名不能为空且最多20位"}).regexValidator({regexp:"^[A-Z a-z.]{2,29}[A-Za-z]$|^[\u4E00-\u9FA5]{2,30}$",onerror:"法人姓名格式不正确，2-30位字符"});
$("#b_personNo").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:30,onerror:"法人证件号不能为空"});
$("#b_busiBgtTime").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:6,max:6,onerror:"营业开始时间只能6位数字，时间格式为 HHmmss"}).regexValidator({regexp:"^([0-1]?[0-9]|2[0-3])([0-5][0-9])([0-5][0-9])$",onerror:"请输入有效的时间格式，格式 HHmmss"});
$("#b_busiEndTime").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:6,max:6,onerror:"营业结束时间只能6位数字，时间格式为 HHmmss"}).regexValidator({regexp:"^([0-1]?[0-9]|2[0-3])([0-5][0-9])([0-5][0-9])$",onerror:"请输入有效的时间格式，格式 HHmmss"});
$("#b_area").formValidator({validatorgroup:'2',empty:true,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:0,max:12,onerror:"营业面积(平方米)最多12个字(数字)"}).regexValidator({regexp:"^[0-9]*$",onerror:"营业面积(平方米)仅能输入数字"});
$("#b_monthRent").formValidator({validatorgroup:'2',empty:true,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:0,max:11,onerror:"月租金(元)最多11个字"}).regexValidator({regexp:"^\\d{0,8}(\\.\\d{0,2})?$",onerror:"0.00 =< 月租金(元) < 10000000.00"});
$("#b_posNum").formValidator({validatorgroup:'2',empty:true,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:0,max:5,onerror:"收银台数最多5个字(数字)"}).regexValidator({regexp:"^[0-9]*$",onerror:"收银台数仅能输入数字"});
$("#b_bankAccntId").formValidator({validatorgroup:'2',empty:false,onshow:"请选择对公账户",oncorrect:"√"}).inputValidator({min:1,max:20,onerror:"请选对公账户"});
$("#b_accntType").formValidator({validatorgroup:'2',empty:false,onshow:"请选择商户账户类型",oncorrect:"√"}).inputValidator({min:1,max:20,onerror:"请选商户账户类型"});
$("#b_accntName").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:60,onerror:"商户账户名称不能为空且最多60位"});
$("#b_accntNo").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:30,onerror:"商户账户号码不能为空且最多30位"}).regexValidator({regexp:"^[0-9]+$",onerror:"商户账户号码只能输入数字"});
$("#b_accntBank").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:60,onerror:"商户开户行不能为空且最多60位"});
$("#b_debitRate").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:8,onerror:"手续费率必须填写"}).regexValidator({regexp:"^\\d{0,2}(\\.\\d{0,4})?$",onerror:"0.0000 =< 手续费率(%) < 100.0000"});
$("#b_wechatPayRate").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:8,onerror:"手续费率必须填写"}).regexValidator({regexp:"^\\d{0,2}(\\.\\d{0,4})?$",onerror:"0.0000 =< 手续费率(%) < 100.0000"});
$("#b_alipayPayRate").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:8,onerror:"手续费率必须填写"}).regexValidator({regexp:"^\\d{0,2}(\\.\\d{0,4})?$",onerror:"0.0000 =< 手续费率(%) < 100.0000"});
$("#b_outCardRate").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:8,onerror:"手续费率必须填写"}).regexValidator({regexp:"^\\d{0,2}(\\.\\d{0,4})?$",onerror:"0.0000 =< 手续费率(%) < 100.0000"});
$("#b_creditRate").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:8,onerror:"手续费率必须填写"}).regexValidator({regexp:"^\\d{0,2}(\\.\\d{0,4})?$",onerror:"0.0000 =< 手续费率(%) < 100.0000"});
$("#b_debitMaxFee").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:11,onerror:"商户手续费封顶值(元)必填且最多11个字符"}).regexValidator({regexp:"^\\d{0,8}(\\.\\d{0,2})?$",onerror:"0.00 =< 商户手续费封顶值(元) < 10000000.00"});

$("#b_feeRate").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:6,onerror:"商户手续费率最多6个字"}).regexValidator({regexp:"^\\d{0,2}(\\.\\d{0,3})?$",onerror:"0.000 =< 手续费率(%) < 100.000"});
$("#b_topValue").formValidator({validatorgroup:'2',empty:true,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:0,max:11,onerror:"商户手续费封顶值(元)最多11个字"}).regexValidator({regexp:"^\\d{0,8}(\\.\\d{0,2})?$",onerror:"0.00 =< 商户手续费封顶值(元) < 10000000.00"});
$("#b_merContact").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:4,max:60,onerror:"商户联系人不能为空且最多30个字"}).regexValidator({regexp:"^[\u4E00-\u9FA5]{2,30}$",onerror:"商户联系人格式不正确，2-30位汉字"});
$("#b_merFax").formValidator({validatorgroup:'2',empty:true,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:0,max:20,onerror:"商户传真最多20个字(数字，字母)"}).regexValidator({regexp:"^[A-Za-z0-9]+$",onerror:"商户传真仅能输入数字，字母"});
$("#b_merPhone").formValidator({validatorgroup:'2',empty:false,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:1,max:20,onerror:"商户联系电话不能为空且最多20个字"}).regexValidator({regexp:"^0?1[3,4,5,6,7,8]{1}[0-9]{9}$|^0[0-9]{2,3}[0-9]{7,8}$",onerror:"商户联系电话仅能输入数字，字母或者-，必须包含地区编码"});
$("#b_bankBranchNo").formValidator({validatorgroup:'2',empty:true,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:0,max:20,onerror:"开户行行号最多20个字"});
$("#b_docTransferName").formValidator({validatorgroup:'2',empty:true,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:0,max:50,onerror:"调单联系人最多50个字"});
$("#b_docTransferPhone").formValidator({validatorgroup:'2',empty:true,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:0,max:20,onerror:"调单联系人电话最多20个字"}).regexValidator({regexp:"^0?1[3,4,5,6,7,8]{1}[0-9]{9}$|^0[0-9]{2,3}[0-9]{7,8}$",onerror:"商户联系电话仅能输入数字"});
$("#b_docTransferEmail").formValidator({validatorgroup:'2',empty:true,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:0,max:100,onerror:"调单联系人邮箱最多100个字"}).regexValidator({regexp:"/^(([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-]",onerror:"邮箱格式不对"});
$("#b_personNoType").formValidator({validatorgroup:'2',empty:false,onshow:"请选择法人证件类型",oncorrect:"√"}).inputValidator({min:1,max:20,onerror:"请选择法人证件类型"});
$("#b_bankBranchNo").formValidator({validatorgroup:'2',empty:true,onshow:"请输入内容",oncorrect:"√"}).inputValidator({min:0,max:12,onerror:"开户银行网点号不能超过12个字(数字，字母)"});
//lixl add 20161213 start
//$("#b_wechatPayOrg").formValidator({validatorgroup:'2',empty:false,onshow:"请选择支付机构",oncorrect:"√"}).inputValidator({min:1,max:20,onerror:"请选择支付机构"});
//$("#b_alipayPayRate").formValidator({validatorgroup:'2',empty:false,onshow:"请选择支付机构",oncorrect:"√"}).inputValidator({min:1,max:20,onerror:"请选择支付机构"});
//lixl add 20161213 end
// 初始化控件
$('#qStartDate').pickdate({dateFmt:"yyyyMMdd"}).val(DateCurr);	
$('#qEndDate').pickdate({dateFmt:"yyyyMMdd"}).val(DateCurr);
$('#a_bizLicnoExpireDate').pickdate({dateFmt:"yyyyMMdd"});
$('#b_bizLicnoExpireDate').pickdate({dateFmt:"yyyyMMdd"});
$('#a_personNoExpireDate').pickdate({dateFmt:"yyyyMMdd"});
$('#b_personNoExpireDate').pickdate({dateFmt:"yyyyMMdd"});
$('#a_cardLicnoExpireDate').pickdate({dateFmt:"yyyyMMdd"});
$('#b_cardLicnoExpireDate').pickdate({dateFmt:"yyyyMMdd"});

var __defCodeBoxParam = function(__opt) {
	return $.extend({emptyOpt:true,valueField:'codeNo', displayField:'codeName', render:function(res){return res.codeName;}, failedMsg:'获取应用参数失败!'}, __opt);
};
var __defPayOrgParam = function(__opt) {
	return $.extend({emptyOpt:true,valueField:'orgCode', displayField:'bankName', render:function(res){return res.bankName;}, failedMsg:'获取应用参数失败!'}, __opt);
};
$.ajax({url:'findSecCodeList.action?codeType=OUTMER_CONF_STATUS', type:'POST', dataType:'json', success:function(data){
	if ( data && data.success ) { $.dataSelectBox(__defCodeBoxParam({selectId:'searchStatus'}), data.root);} else { console.log('获取参数失败'); }
}});
$.ajax({url:'findSecCodeList.action?codeType=ACCNT_TYPE_SD', type:'POST', dataType:'json', success:function(data){
	if ( data && data.success ) { 
		$.dataSelectBox(__defCodeBoxParam({selectId:'a_accntType'}), data.root);
		$.dataSelectBox(__defCodeBoxParam({selectId:'b_accntType'}), data.root);
	} else { console.log('获取参数失败'); }
}});
$.ajax({url:'findSecCodeList.action?codeType=MCC_GRP_DESC', type:'POST', dataType:'json', success:function(data){
	if ( data && data.success ) { 
		$.dataSelectBox(__defCodeBoxParam({selectId:'a_mccGrp'}), data.root);
		$.dataSelectBox(__defCodeBoxParam({selectId:'a_mccGrpImp'}), data.root);
		$.dataSelectBox(__defCodeBoxParam({selectId:'b_mccGrp'}), data.root);
		$.dataSelectBox(__defCodeBoxParam({selectId:'b_mccGrpImp'}), data.root);
	} else { console.log('获取参数失败'); }
}});
$.ajax({url:'findSecCodeList.action?codeType=CRD_TYPE', type:'POST', dataType:'json', success:function(data){
	if ( data && data.success ) { 
		$.dataSelectBox(__defCodeBoxParam({selectId:'a_personNoType'}), data.root);
		$.dataSelectBox(__defCodeBoxParam({selectId:'b_personNoType'}), data.root);
		$.dataSelectBox(__defCodeBoxParam({selectId:'a_cardPersonNoType'}), data.root);
		$.dataSelectBox(__defCodeBoxParam({selectId:'b_cardPersonNoType'}), data.root);
	} else { console.log('获取参数失败'); }
}});
//lixl 20161213 add start
/*$.ajax({url:'findBankByBinFlag.action?binFlag=1', type:'POST', dataType:'json', success:function(data){
	if ( data && data.success ) { 
		$.dataSelectBox(__defPayOrgParam({selectId:'a_wechatPayOrg'}), data.root);
		$.dataSelectBox(__defPayOrgParam({selectId:'a_alipayPayOrg'}), data.root);
		$.dataSelectBox(__defPayOrgParam({selectId:'b_wechatPayOrg'}), data.root);
		$.dataSelectBox(__defPayOrgParam({selectId:'b_alipayPayOrg'}), data.root);
	} else { console.log('获取参数失败'); }
}});*/
//lixl 20161213 add end
var tidTypes = new Array();
$.ajax({type:'POST',url:'findScoreSecCodeList.action?codeType=TID_TYPE', success:function(data){if(data.success){tidTypes=data.root;}else{alert('操作失败 原因是'+data.syserr);}}});
var COMPID = 1;
var cid = function() { return 'comp-' + (COMPID++); };
var TID_TR_TPL = $('#tidTrTpl').val();
var TID_VAL_TR_TPL = $('#tidValTrTpl').val();
$('#addTid').click(function() {
	var __cid = cid();
	$('#tidList tbody').append(htmlFromTpl({'cid':__cid}, TID_TR_TPL));
	$.dataSelectBox(__defCodeBoxParam({selectId:__cid+'-tidType'}), tidTypes);
});
		
$('#delTid').click(function() {
	var rows = $("#tidList tbody tr").size();
	if (rows < 1) {
		alert("没有终端可以删除", "系统提示", function() {});
	} else {
		$('#tidList tbody input:checked').each(function(_i,_n){ 
			var rowid = $(_n).attr('rowid');
			$('#'+rowid).remove();
		});
	}
});
		
$('#addTid1').click(function() {
	var __cid = cid();
	$('#tidList1 tbody').append(htmlFromTpl({'cid':__cid}, TID_TR_TPL));
	$.dataSelectBox(__defCodeBoxParam({selectId:__cid+'-tidType'}), tidTypes);
});

$('#delTid1').click(function() {
	var rows = $("#tidList1 tbody tr").size();
	if (rows < 1) {
		alert("没有终端可以删除", "系统提示", function() {});
	} else {
		$('#tidList1 tbody input:checked').each(function(_i,_n){ 
			var rowid = $(_n).attr('rowid');
			$('#'+rowid).remove();
		});
	}
});

//新增商户界面遍历新增终端信息
var loadTids = function(tableId) {
	if ($("#" + tableId + " tbody tr").size() < 1) { alert("终端不能为空！");  return false; }
	var tids = new Array();
	$("#" + tableId + " tbody tr").each(function(_i,_n){
		var tidObj = new Object();
		$(_n).find(':input').each(function(_j,_m){
			var fld = $(_m).attr('name');
			if ( fld && fld != '' ) tidObj[fld] = $(_m).val();
		});
		
		//checkbox是否被选中  选中传值1未选中传值0   wxb		
		if ($(_n).find('.qrCheck').attr('checked')) {
			tidObj.reserved2 = '1'
		} else {
			tidObj.reserved2 = '0';
		}		
		
		tids.push(tidObj);
	});
	return tids;
};

// 校验终端信息是否有问题
var checkTids = function(tids) {
	if ( tids ) {
		var k = true;
		$.each(tids, function(_i,_n){
			var tid = _n;
//			if (tid.tidType == "02") {
//		        if (tid.reserved1.length == 0) {
//		            alert("终端类型为无线时，SIM卡号不能为空");
//		            k = false;
//		        }
//		    }
		    // 验证终端
			if (k && tid.tidType.length > 2 || tid.tidType.length == 0) {
				alert("终端类型不能为空");
		        k = false;
		    }
		    if (k && (tid.tidBrand.length > 30 || tid.tidBrand.length == 0)) {
		        alert("终端品牌不能为空且最多30个字");
		        k = false;
		    }
		    if (k && (tid.tidModel.length > 20 || tid.tidModel.length == 0)) {
		        alert("终端型号不能为空且最多20个字");
		        k = false;
		    }
		    if (k && (tid.address.length > 100 || tid.address.length == 0)) {
		        alert("安装地址不能为空且最多100个字");
		        k = false;
		    }
		    if (k && tid.snCode.length > 50) {
		        alert("SN号最多50个字");
		        k = false;
		    }
		});
		return k;
	}
	return false;
};

// 保存商户进件信息
var addMerSaveBtn = function() {
	var tids = loadTids('tidList'); 
	if ( tids == false ) return false;
	if ( !checkTids(tids) ) return false;

	if ($.formValidator.pageIsValid("1")) {
		var mhtObj = $('#form2').formToJSON();
		var accntType = $('#a_accntType').val();
		var personNoType = $('#a_personNoType').val();
   		var cardPersonNoType = $('#a_cardPersonNoType').val();
   		var personNo = $('#a_personNo').val();
   		var cardPersonNo = $('#a_cardPersonNo').val();
   		// var checkNum = /^[1-9]([0-9]{14}|[0-9]{17})$/;
   		var checkNum = /(^\d{15}$)|(^\d{17}([0-9]|X|x)$)/ ;
   		if (!personNoType) {
   	    	alert('法人证件类型必填');
   	    	return false;
   	    }
   	 	if (!personNo) {
			alert('法人证件号必填');
	    	return false;
	    }
   	 	if (personNoType == '1') {
	    	if (!checkNum.test(personNo)) {
	    		alert('法人证件号非法');
	    		return false;
	    	}
	    }
   	 	if (accntType == '1') {
	   	 	if (!cardPersonNoType) {
	   	 		alert('商户开户人证件类型必填');
		    	return false;
		    }
	   	 	if (cardPersonNoType == '1') {
		    	if (!checkNum.test(cardPersonNo)) {
		    		alert('商户开户人证件号非法');
		    		return false;
		    	}
		    }
	   		if (!cardPersonNo) {
	   			alert('商户开户人证件号必填');
		    	return false;
		    }
   	 	}
	    $.ajax({type:"post", url:"checkBlackMerChant.action", dataType:"json",
	        data:{ licenseNo: mhtObj.licenseNo, personNo: mhtObj.personNo },
	        success:function(data) {
	            if (!data.success) { alert(data.syserr); return false;
	            } else {
	                $.ajax({type:"post", url:"doInsertMerchantAdd.action", dataType:"json", data:{ mers: $.toJSON(mhtObj), tids:$.toJSON(tids) },
	                    success:function(data) {
	                        if (data.success) {
	                            alert("商户添加成功"); $('#querybutton').click(); $("#addMer").dialog("close");
	                        } else {
	                            alert("操作失败 原因是" + data.syserr, "系统提示", function() {});
	                        }
	                    }
	                });
	            }
	        }
	    });
	} else {
	    return false;
	}
};

var updMerSaveBtn = function() {
	var tids = loadTids('tidList1'); 
	if ( tids == false ) return false;
	if ( !checkTids(tids) ) return false;

	if ($.formValidator.pageIsValid("2")) {
		var mhtObj = $('#form3').formToJSON();
		var accntType = $('#b_accntType').val();
		var personNoType = $('#b_personNoType').val();
   		var cardPersonNoType = $('#b_cardPersonNoType').val();
   		var personNo = $('#b_personNo').val();
   		var cardPersonNo = $('#b_cardPersonNo').val();
   		// var checkNum = /^[1-9]([0-9]{14}|[0-9]{17})$/;
   		var checkNum = /(^\d{15}$)|(^\d{17}([0-9]|X|x)$)/ ;
   		if (!personNoType) {
   	    	alert('法人证件类型必填');
   	    	return false;
   	    }
   	 	if (!personNo) {
			alert('法人证件号必填');
	    	return false;
	    }
   	 	if (personNoType == '1') {
	    	if (!checkNum.test(personNo)) {
	    		alert('法人证件号非法');
	    		return false;
	    	}
	    }
   	 	if (accntType == '1') {
	   	 	if (!cardPersonNoType) {
	   	 		alert('商户开户人证件类型必填');
		    	return false;
		    }
	   	 	if (cardPersonNoType == '1') {
		    	if (!checkNum.test(cardPersonNo)) {
		    		alert('商户开户人证件号非法');
		    		return false;
		    	}
		    }
	   		if (!cardPersonNo) {
	   			alert('商户开户人证件号必填');
		    	return false;
		    }
   	 	}
	    $.ajax({type:"post", url:"checkBlackMerChant.action", dataType:"json",
	        data:{ licenseNo: mhtObj.licenseNo, personNo: mhtObj.personNo },
	        success:function(data) {
	            if (!data.success) { alert(data.syserr); return false;
	            } else {
	                $.ajax({type:"post", url:"doUpdateMerchantAdd.action", dataType:"json", data:{ mers: $.toJSON(mhtObj), tids:$.toJSON(tids) },
	                    success:function(data) {
	                        if (data.success) {
	                            alert("商户修改成功"); $('#querybutton').click(); $("#editMer").dialog("close");
	                        } else {
	                            alert("操作失败 原因是" + data.syserr, "系统提示", function() {});
	                        }
	                    }
	                });
	            }
	        }
	    });
	} else {
	    return false;
	}
};

var updMerDeleteBtn = function() {
	if (!confirm("确认要删除该商户吗？")) { return; }
	var mid = record.mid;
	var firstTcn = record.firstTcn;
	var orgCode = record.orgCode;
	$.ajax({url: 'delMerTid.action', type: 'POST', dataType:'json', data:{mid: mid, orgCode: orgCode, firstTcn:firstTcn}
		,success : function(data) {
			if (data.success) {
				alert('操作成功');
				$(this).dialog('close');
				$('#querybutton').click();
			} else {
				alert('操作失败 原因是'+ data.syserr);
			}
		}
	});
};

$('#addMer').dialog({title:'增加商户进件',autoOpen:false,bgiframe:true,modal:true,resizable:false,draggable:false,width:900,height:600
,buttons:{'保存': addMerSaveBtn,'关闭':function(){ $(this).dialog('close'); } }});
$('#editMer').dialog({title:'编辑信息',autoOpen:false,bgiframe:true,modal:true,resizable:false,draggable:false,width:900,height:600 });
		
function deltid() {
	$('#tidList tbody').html(''); 
	$('#tidList1 tbody').html(''); 
}
		
//新增商户
var addMer = function(record, id) {
	$('#tidList tbody').html(''); 
	$('#form2 :input').val();
	$('#form2 :input').attr('disabled', '');
	$('#form2reset').click();
	$.formValidator.resetTipState('1');
	$('#a_ipFeeType2').attr("disabled",true);
	$('#a_ipFeeRate2').attr("disabled",true);
	$('#a_ipFeeType1').attr("disabled",true);
	$('#a_ipFeeRate1').attr("disabled",true);
	$('#a_ipFeeRateMax1').attr("disabled",true);
	//ajax获取外部商户号
	$.ajax({type: 'POST', url: 'getOrgCodeSeq.action', success : function(data) {if(data.success){ $('#a_orgCode').val(data.root[0]); } else{ alert("获取服务商内部商户号失败。"); } } });
	$('#addMer').dialog('open');
};
// 编辑商户信息
var editMer = function(record, id) {
	$('#tidList1 tbody').html(''); 
	$('#form3reset').click();
	$.formValidator.resetTipState('2');
	if (!record) { alert("请选择一条记录", "系统提示", function() { }); return; }
	$('#form3 :input').attr('disabled', false);
	var mid = record.mid;
	/*$('#editMer :input').each(function(i, n) {
		if (n.name in record) {
			n.value = record[n.name];
			$(this).attr('disabled', false);
		}
	});*/
	$.fillForm('form3', record);
	
	var status = record.status;
	if(status=='03'){
		alert("审核通过的商户不能进行编辑。");
		return false;
	} else if(status=='02'){
		alert("业务通过的商户不能进行编辑。");
		return false;
	}
				
	var ipType = record.ipType2;
	if(ipType=='1'){
		$('#b_ipType').attr("checked","checked");
		$('#b_ipFeeType2').attr("disabled",false);
		$('#b_ipFeeRate2').attr("disabled",false);
	}else{
		$('#b_ipType').attr("checked","");
		$('#b_ipFeeType2').attr("disabled",true);
		$('#b_ipFeeRate2').attr("disabled",true);
	}
				
	var ipType1 = record.ipType1;
	if(ipType1=='1'){
		$('#b_ipType_1').attr("checked","checked");
		$('#b_ipFeeType1').attr("disabled",false);
		$('#b_ipFeeRate1').attr("disabled",false);
		$('#b_ipFeeRateMax1').attr("disabled",false);
	}else{
		$('#b_ipType_1').attr("checked","");
		$('#b_ipFeeType1').attr("disabled",true);
		$('#b_ipFeeRate1').attr("disabled",true);
		$('#b_ipFeeRateMax1').attr("disabled",true);
	}
	$("#b_ipFeeType1").val(record.ipFeeType1);
	$("#b_ipFeeType2").val(record.ipFeeType2);
	$('#b_accntType').change();	
	$('#editMer').dialog('option', 'title', '编辑进件信息');
	$('#editMer').dialog('option','buttons',{'更新': updMerSaveBtn,'删除': updMerDeleteBtn, '关闭':function(){ $(this).dialog('close'); }});
	$('#editMer').dialog('open');

	// 编辑商户界面获取该商户的终端信息
	$.ajax({ type: 'POST', dataType:'json', url: 'queryMerTids.action', data:{mid: mid},
		success: function(data) {
			if ( data.success && data.root.length > 0 ) {
				$.each(data.root, function(_i,_n){
					var __cid = cid();
					$('#tidList1 tbody').append(htmlFromTpl({'cid':__cid}, TID_TR_TPL));
					$.dataSelectBox(__defCodeBoxParam({selectId:__cid+'-tidType'}), tidTypes);
					$('#'+__cid+'-row :input').each(function(_j,_m){
						if ( _m.name && _m.name in _n ) {
							$(_m).val(_n[_m.name]);
						}
						
					//判断新增商户时候是否要求生成二维码    wxb
					if(_n.reserved2=="1"  ){
						$('#'+__cid+'-row .qrCheck').attr("checked",true);
					}else{						
						$('#'+__cid+'-row .qrCheck').attr("checked",true);
					}
					
					});								
				});
			} else {
				alert("操作失败 原因是" + data.syserr, "系统提示", function() { });
			}
		}
	});
};

// 商户详细页面
var detail = function(record, id) {
	$('#tidList1 tbody').html(''); 
	$.formValidator.hideTipState('2');
	$('#form3reset').click();
	if (!record) { alert("请选择一条记录", "系统提示", function() {}); return; }
	$.fillForm('form3', record);
	$('#b_accntType').change();	
	$('#form3 :input').attr('disabled', true);
	$('#form3 :input').attr('border', '0px');
	$('#editMer').dialog('option', 'title', '商户进件信息');
	$('#editMer').dialog('option', 'buttons', { '关闭': function() {$(this).dialog('close'); } });
	$('#editMer').dialog('open');
	var mid = record.mid;
	//判断是不是审批通过的商户
	if(record.status=='05'){
		$.ajax({type: 'POST', url : 'queryCoreMerChantTids.action', dataType:'json', data:{mid:mid},
			success: function(data) {
				if (data.success && data.root.length > 0 ) {
					$.each(data.root, function(_i,_n){
						var __cid = cid();
						$('#tidList1 tbody').append(htmlFromTpl($.extend({'cid':__cid},_n), TID_VAL_TR_TPL));
						$.dataSelectBox(__defCodeBoxParam({selectId:__cid+'-tidType'}), tidTypes);
						$('#'+__cid+'-tidType').val(_n.tidType);						
					});
				} else {
					alert("操作失败 原因是" + data.syserr, "系统提示", function() {});
				}
			}
		});
	} else {
		$.ajax({ type: 'POST', url: 'queryMerTids.action', dataType:'json', data:{mid:mid},
			success: function(data) {
				if (data.success && data.root.length > 0 ) {
					$.each(data.root, function(_i,_n){
						var __cid = cid();
						$('#tidList1 tbody').append(htmlFromTpl($.extend({'cid':__cid},_n), TID_VAL_TR_TPL));
						$.dataSelectBox(__defCodeBoxParam({selectId:__cid+'-tidType'}), tidTypes);
						$('#'+__cid+'-tidType').val(_n.tidType);						
						
					});
				} else {
					alert("操作失败 原因是" + data.syserr, "系统提示", function() {});
				}
			}	
		});
	}
};

var submitMer = function(record,id) {
	if(!record){
		alert('请选择一条记录');
		return false;
	}
	if (!confirm("确认要提交该商户吗？")) { return; }
	$.ajax({url:'doSubmitMerchantAdd.action',
		data:{jsonObject:$.toJSON(record)},dataType:'json',
		success:function(data){
			if(data.success){
				alert('提交成功');
				$('#table').refresh();
			} else{
				alert('提交失败 失败原因是'+data.syserr);
			}												
		}
	});
}

$('#mccSelect').queryDialog({width:800,height:600,flexigrid:{url:'findMccDesc.action',width:550,dir:"mcc",sort:"mcc",usepager:true
,colModel:[
 {display:'MCC码',width:100,dataIndex:'mcc',align:'center',sortable:true}
,{display:'描述',width:300,dataIndex:'mccDesc',align:'center'}
,{display:'类别',width:100, dataIndex:'mccGrpDesc', align:'center'}
]}});

$('#areaCodeSelect').queryDialog({width:800,height:600,flexigrid:{url:'findAreaCodeList.action',width:500,dir:"codeNo",usepager:true
,colModel:[
 {display:'地区代码',width:200,dataIndex:'codeNo',align:'center'}
,{display:'地区描述',width:300,dataIndex:'codeName',align:'center'}
]}});

$('#channelSelect').queryDialog({width:800,height:600,flexigrid:{url:'findMerChannel.action',width:550,dir:"channelCode",sort:"channelCode",usepager:true
,colModel:[
 {display:'服务商代码',width:200,dataIndex:'channelCode',align:'center',sortable:true}
,{display:'服务商名称',width:300,dataIndex:'channelName',align:'center'}
]}});

$('#branchBankSelect').queryDialog({width:900,height:400,flexigrid:{url:'branchBankComobo.action',width:550,dir:"mcc",sort:"mcc",usepager:true
,colModel:[
 {display:'银行行号',dataIndex:'unionBankNo',width:80,align:'center',sortable:true}
,{display:'上级行号',dataIndex:'parentBankNo',width:100,align:'center',sortable:true}
,{display:'银行名称',dataIndex:'bankName',width:200,align:'center',sortable:true}
,{display:'银行地址',dataIndex:'address',width:300,align:'center',sortable:true}
]}});

var bankCatCodeList,bankinfoAreaCode;
var bindAutocompleteField = function(id,src) {
	$('#'+id).autocomplete({source: src, delay: 500})
};

$.ajax({url:'findSecCodeList.action?codeType=BANK_CODE', dataType:'json'
,success: function(data){ 
	if(data.success&&data.root){
		bankCatCodeList = new Array();
		$.each(data.root, function(_i,_n){
			bankCatCodeList.push({label: _n.codeName + ' - ' + _n.codeNo, value: _n.codeNo});
		});
		bindAutocompleteField('branchBankSelect_parentBankNo',bankCatCodeList);
	}
}});
$.ajax({url:'findSecCodeList.action?codeType=BANKINF_AREA_CODE', dataType:'json'
,success: function(data){ 
	if(data.success&&data.root){
		bankinfoAreaCode = new Array();
		$.each(data.root, function(_i,_n){
			bankinfoAreaCode.push({label: _n.codeName + ' - ' + _n.codeNo, value: _n.codeNo});
		});
		bindAutocompleteField('branchBankSelect_cityCode',bankinfoAreaCode);
	}
}});

		
// 新增服务商选择
$('#a_channel').click(function() {
	$('#channelSelect').queryDialogOpen({
		clear : function() { $('#a_channel').val(''); },
		success : function(data) {
			if (data) {
				$('#a_channel').val(data.channelCode).focus().blur();
				return true;
			} else {
				alert("请选择 一条数据");
				return false;
			}
		}
	});
});
		
// 新增页面 mcc选择
$('#a_mcc').click(function() {
	$('#mccSelect').queryDialogOpen({
		clear : function() {$('#a_mcc').val(''); },
		success : function(data) {
			if (data) {
				$('#a_mcc').val(data.mcc).focus().blur();
				$('#a_mccGrp').val('').val(data.mccGrp).focus().blur();
				$('#a_mccGrpImp').val('').val(data.mccGrp).focus().blur();
				return true;
			} else {
				alert("请选择 一条数据");
				return false;
			}
		}
	});
});
//修改页面 mcc选择
$('#b_mcc').click(function() {
	$('#mccSelect').queryDialogOpen({
		clear : function() {$('#b_mcc').val(''); },
		success : function(data) {
			if (data) {
				$('#b_mcc').val(data.mcc).focus().blur();
				$('#b_mccGrp').val('').val(data.mccGrp).focus().blur();
				$('#b_mccGrpImp').val('').val(data.mccGrp).focus().blur();
				return true;
			} else {
				alert("请选择 一条数据");
				return false;
			}
		}
	});
});

//新增页面 区域码选择
$('#a_areaCode').click(function() {
	$('#areaCodeSelect').queryDialogOpen({
		clear : function() {
			$('#a_areaCode').val('');
		},
		success : function(data) {
			if (data) {
				$('#a_areaCode').val(data.codeNo).focus().blur();
				return true;
			} else {
				alert("请选择 一条数据");
				return false;
			}
		}
	});
});
// 修改页面 区域码选择
$('#b_areaCode').click(function() {
	$('#areaCodeSelect').queryDialogOpen({
		clear : function() { $('#b_areaCode').val(''); },
		success : function(data) {
			if (data) {
				$('#b_areaCode').val(data.codeNo).focus().blur();
				return true;
			} else {
				alert("请选择 一条数据");
				return false;
			}
		}
	});
});
		
// 新增页面 开户行选择
$('#a_bankBranchNo').click(function() {
	$('#branchBankSelect').queryDialogOpen({
		clear : function() {
			$('#a_bankBranchNo').val('');
			$('#a_accntBank').val('');
			$('#a_accntBankPrivateDesc').val('');
			$('#a_bankBranchNoDesc').val('');
		},
		success : function(data) {
			if (data) {
				$('#a_bankBranchNo').val(data.unionBankNo).focus().blur();
				$('#a_accntBank').val(data.parentBankNo).focus().blur();
				$('#a_accntBankPrivateDesc').val(data.parentBankNoDesc).focus().blur();
				$('#a_bankBranchNoDesc').val(data.bankName).focus().blur();
				return true;
			} else {
				alert("请选择 一条数据");
				return false;
			}
		}
	});
});

// 修改页面 开户行选择
$('#b_bankBranchNo').click(function() {
	$('#branchBankSelect').queryDialogOpen({
		clear : function() {
			$('#b_bankBranchNo').val('');
			$('#b_accntBank').val('');
			$('#b_accntBankPrivateDesc').val('');
			$('#b_bankBranchNoDesc').val('');
		},
		success : function(data) {
			if (data) {
				$('#b_bankBranchNo').val(data.unionBankNo).focus().blur();
				$('#b_accntBank').val(data.parentBankNo).focus().blur();
				$('#b_accntBankPrivateDesc').val(data.parentBankNoDesc).focus().blur();
				$('#b_bankBranchNoDesc').val(data.bankName).focus().blur();
				return true;
			} else {
				alert("请选择 一条数据");
				return false;
			}
		}
	});
});
		
		
$('#table').flexigrid({url: 'findAllMerchantAdd.action', width: 400, sort: "lastUptTime", dir: "desc", usepager: true, checkbox: false,
buttons : [
 { name: "新增商户", bclass: 'page_excel', id: 'addMerMenu', onpress: addMer },{ separator: true }
,{ name: "编辑商户", bclass: 'page_word', id: 'cel', onpress: editMer }
,{ name: "上传附件", bclass: 'page_word', id: 'cel', onpress: uploadAthBtn },{ separator: true }
,{ name: "提交商户", bclass: 'page_word', id: 'cel', onpress: submitMer },{ separator: true }
,{ name: "商户详情", bclass: 'page_excel', id: 'detail', onpress: detail }           
],
colModel : [ 
 { display: '服务商内部商户号', dataIndex: 'orgCode', align: 'center' }
,{ display: '一级服务商号', dataIndex: 'firstTcn', align: 'center' }
,{ display: '商户名称', dataIndex: 'merName', align: 'center' }
,{ display: 'MCC码', dataIndex: 'mcc', align: 'center' }
,{ display: '商户类别(预期)', dataIndex: 'mccGrpImpDesc', align: 'center' }
,{ display: '商户类别(结算)', dataIndex: 'mccGrpDesc', align: 'center' }
,{ display: '借记交易费率%', dataIndex: 'debitRate', align: 'center', render: fmtRate4 }
,{ display: '借记封顶费', dataIndex : 'debitMaxFee', align : 'right', render:fmtMoney }
,{ display: '贷记交易费率', dataIndex: 'creditRate', align: 'center', render: fmtRate4 }
,{ display: '支付宝交易费率', dataIndex: 'alipayPayRate', align: 'center', render: fmtRate4 }
,{ display: '微信交易费率', dataIndex: 'wechatPayRate', align: 'center', render: fmtRate4 }
,{ display: '外卡交易费率', dataIndex: 'outCardRate', align: 'center', render: fmtRate4 }
,{ display: '商户账户类型', dataIndex: 'accntTypeZh', align: 'center' }
,{ display: '审批状态', dataIndex: 'statusZh', align: 'center' }
// ,{ display: '商户手续费收取类型', dataIndex: 'feeTypeZh', align: 'center' }
,{ display: '风控审批时间', dataIndex: 'approveDate', align: 'center', render: fmtTime }
,{ display: '业务审批时间', dataIndex: 'admitDate', align: 'center', render: fmtTime }
]});
		
$('#querybutton').click(function(){
	//wxb
	var startTime=$("#qStartDate").val();
	var endTime=$("#qEndDate").val();
	if(startTime&&endTime){
		if(startTime>endTime){
			alert("起始日期不能晚于结束日期！");
			return false;
		}
	}
	$.queryTable({formId: 'queryForm', tableId: 'table' }); });	
//初始化查询;
$('#querybutton').trigger('click');	
$('#a_accntType').change(function(){
	if ($(this).val() == '0') {
		$('#a_cardPersonNo').parent().parent().hide();
		$('#a_cardPersonNo').val('');
		$('#a_cardPersonNo').attr('disabled','disabled');
		$('#a_cardPersonNoTypeDesc').parent().parent().hide();
		$('#a_cardPersonNoTypeDesc').val('');
		$('#a_cardPersonNoTypeDesc').attr('disabled','disabled');
		$('#a_cardLicnoExpireDate').parent().parent().hide();
		$('#a_cardLicnoExpireDate').val('');
		$('#a_cardLicnoExpireDate').attr('disabled','disabled');
		
	} else {
		$('#a_cardPersonNo').parent().parent().show();
		$('#a_cardPersonNo').removeAttr('disabled');
		$('#a_cardPersonNoTypeDesc').parent().parent().show();
		$('#a_cardPersonNoTypeDesc').removeAttr('disabled');
		$('#a_cardLicnoExpireDate').parent().parent().show();
		$('#a_cardLicnoExpireDate').removeAttr('disabled');
	}
});
$('#a_accntType').change();	
$('#b_accntType').change(function(){
	if ($(this).val() == '0') {
		$('#b_cardPersonNo').parent().parent().hide();
		$('#b_cardPersonNo').val('');
		$('#b_cardPersonNo').attr('disabled','disabled');
		$('#b_cardPersonNoTypeDesc').parent().parent().hide();
		$('#b_cardPersonNoTypeDesc').val('');
		$('#b_cardPersonNoTypeDesc').attr('disabled','disabled');
		$('#b_cardLicnoExpireDate').parent().parent().hide();
		$('#b_cardLicnoExpireDate').val('');
		$('#b_cardLicnoExpireDate').attr('disabled','disabled');
		
	} else {
		$('#b_cardPersonNo').parent().parent().show();
		$('#b_cardPersonNo').removeAttr('disabled');
		$('#b_cardPersonNoTypeDesc').parent().parent().show();
		$('#b_cardPersonNoTypeDesc').removeAttr('disabled');
		$('#b_cardLicnoExpireDate').parent().parent().show();
		$('#b_cardLicnoExpireDate').removeAttr('disabled');
	}
});
$('#b_accntType').change();	

$('#a_debitRate').change(function(){
	if ($(this).val() < '0.42' && $(this).val() != ''){
		$('#a_debitRateLab').show();
	} else{
		$('#a_debitRateLab').hide();
	}
});
$('#a_debitRate').change();

$('#b_debitRate').change(function(){
	if ($(this).val() < '0.42' && $(this).val() != ''){
		$('#b_debitRateLab').show();
} else{
		$('#b_debitRateLab').hide();
	}
});
$('#b_debitRate').change();


$('#a_creditRate').change(function(){
	if ($(this).val() < '0.52' && $(this).val() != ''){
		$('#a_creditRateLab').show();
	} else{
		$('#a_creditRateLab').hide();
	}
});

$('#a_creditRate').change();

$('#b_creditRate').change(function(){
	if ($(this).val() < '0.52' && $(this).val() != ''){
		$('#b_creditRateLab').show();
} else{
		$('#b_creditRateLab').hide();
	}
});
$('#b_creditRate').change();

$('#a_wechatPayRate').change(function(){
	if ($(this).val() < '0.25' && $(this).val() != ''){
		$('#a_wechatPayRateLab').show();
	} else{
		$('#a_wechatPayRateLab').hide();
	}
});

$('#a_wechatPayRate').change();

$('#b_wechatPayRate').change(function(){
	if ($(this).val() < '0.25' && $(this).val() != ''){
		$('#b_wechatPayRateLab').show();
} else{
		$('#b_wechatPayRateLab').hide();
	}
});
$('#b_wechatPayRate').change();




$('#a_alipayPayRate').change(function(){
	if ($(this).val() < '0.25' && $(this).val() != ''){
		$('#a_alipayPayRateLab').show();
	} else{
		$('#a_alipayPayRateLab').hide();
	}
});

$('#a_alipayPayRate').change();

$('#b_alipayPayRate').change(function(){
	if ($(this).val() < '0.25' && $(this).val() != ''){
		$('#b_alipayPayRateLab').show();
} else{
		$('#b_alipayPayRateLab').hide();
	}
});
$('#b_alipayPayRate').change();


});

