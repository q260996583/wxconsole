<%@ page language="java" contentType="text/html; charset=utf-8" %>
<script type="text/javascript">
var fields = 
[
 {name:'seqNo', desc:'序号'  , jtype:'Long', length: 10}
,{name:'version', desc:'VERSION'  , jtype:'Long', length: 10}
,{name:'channelCode', desc:'服务商编码'  , jtype:'String', length: 15, required:true }
,{name:'cupsReviewId', desc:'外部调单标识'  , jtype:'String', length: 40}
,{name:'transSeq', desc:'交易流水号'  , jtype:'Long', length: 12, required:true}
,{name:'pospStmt', desc:'交易日期'  , dateFormat:'Ymd',xtype: 'date', jtype:'String', length: 8, required:true}
,{name:'stlmDate', desc:'清算日期'  , dateFormat:'Ymd',xtype: 'date', jtype:'String', length: 8, required:true}
,{name:'tid', desc:'终端标识码'  , jtype:'String', length: 8, required:true}
,{name:'mid', desc:'商户代码'  , jtype:'String', length: 15, required:true}
,{name:'pan', desc:'卡号'  , jtype:'String', length: 19}
,{name:'transAmt', desc:'交易金额'  , jtype:'Long', xtype:'money', length: 12}
,{name:'merName', desc:'商户名称'  , jtype:'String', length: 100}
,{name:'address', desc:'商户装机地址'  , jtype:'String', length: 500}
,{name:'merPhone', desc:'商户联系电话'  , jtype:'String', length: 30}
,{name:'txnResult', desc:'交易是否成功'  , jtype:'String', length: 4, ctype:'TXN_SLIP_TXNRESULT' }
,{name:'txnResultDesc', desc:'交易是否成功' }
,{name:'docTransferName', desc:'调单联系人姓名'  , jtype:'String', length: 20}
,{name:'docTransferPhone', desc:'调单联系人电话'  , jtype:'String', length: 50}
,{name:'docTransferEmail', desc:'调单联系人邮件'  , jtype:'String', length: 100}
,{name:'limitTime', desc:'调单期限' , dateFormat:'YmdHis',xtype: 'datetime' , jtype:'String', length: 14, required:true}
,{name:'status', desc:'状态'  , jtype:'String', length: 2}
,{name:'statusDesc', desc:'状态'  , jtype:'String'}
,{name:'auditInfo', desc:'审核意见'  , jtype:'String', xtype:'textarea', length: 600, required:true}
,{name:'remark', desc:'备注信息'  , jtype:'String', xtype:'textarea',length: 600}
,{name:'procResult', desc:'调单处理结果'  , jtype:'String', xtype:'textarea',length: 600}
,{name:'cupsResult', desc:'银联处理结果'  , jtype:'String', xtype:'textarea', length: 600}
,{name:'attachmentList', desc:'签购单'  , jtype:'String', xtype:'file', length: 400}
,{name:'reserved1', desc:'保留域1'  , jtype:'String', length: 200}
,{name:'reserved2', desc:'保留域2'  , jtype:'String', length: 200}
,{name:'recAcc', desc:'创建人'  , jtype:'String', length: 30}
,{name:'recTime', desc:'发起时间' , dateFormat:'YmdHis',xtype: 'datetime' , jtype:'String', length: 14}
,{name:'lastUptAcc', desc:'最后修改人'  , jtype:'String', length: 30}
,{name:'lastUptTime', desc:'最后修改时间' , dateFormat:'YmdHis',xtype: 'datetime' , jtype:'String', length: 14}
,{name:'auditTime', desc:'调单审核时间' , dateFormat:'YmdHis',xtype: 'datetime' , jtype:'String', length: 14}
,{name:'submitTime', desc:'调单处理时间' , dateFormat:'YmdHis',xtype: 'datetime' , jtype:'String', length: 14}
];
          
</script>