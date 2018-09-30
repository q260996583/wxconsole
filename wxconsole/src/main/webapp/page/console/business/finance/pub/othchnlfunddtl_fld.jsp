<%@ page language="java" contentType="text/html; charset=utf-8" %>
<script type="text/javascript">
var fields = 
[
 {name:'dtlNo', desc:'明细序号'  , jtype:'Long', length: 10}
,{name:'version', desc:'VERSION'  , jtype:'Long', length: 10}
,{name:'seqNo', desc:'序号'  , jtype:'Long', length: 10}
,{name:'inoutFlag', desc:'出入账标识'  , jtype:'String', length: 2}
,{name:'merName', desc:'商户名称'  , jtype:'String', length: 200}
,{name:'fundType', desc:'资金类别'  , jtype:'String', length: 30}
,{name:'occurDate', desc:'出入账日期'  , dateFormat:'Ymd', xtype: 'date', jtype:'String', length: 8,  required:true}
,{name:'ttlAmt', desc:'出入账金额'  , jtype:'Long', xtype:'money', length: 14,  required:true}
,{name:'inoutType', desc:'出入账方式'  , jtype:'String', length: 30}
,{name:'remark', desc:'备注'  , jtype:'String', length: 300, xtype:'textarea' }
,{name:'recAcc', desc:'创建人'  , jtype:'String', length: 30}
,{name:'recTime', desc:'创建时间' , dateFormat:'YmdHis',type: 'date' , jtype:'String', length: 14}
,{name:'lastUptAcc', desc:'最后修改人'  , jtype:'String', length: 30}
,{name:'lastUptTime', desc:'最后修改时间' , dateFormat:'YmdHis',type: 'date' , jtype:'String', length: 14}

];
</script>