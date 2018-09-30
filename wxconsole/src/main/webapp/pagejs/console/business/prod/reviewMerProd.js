$(document).ready(function() {
$('#commitDateStart').pickdate({dateFmt:"yyyyMMdd"});
$('#commitDateEnd').pickdate({dateFmt:"yyyyMMdd"});
$('#reviewDateStart').pickdate({dateFmt:"yyyyMMdd"});
$('#reviewDateEnd').pickdate({dateFmt:"yyyyMMdd"});
$('#merchantSelect').queryDialog({
     	width : 600,
     	height : 400,												
		flexigrid:{ 
				url : 'findAllMerchant.action',					
				width : 550,
				dir : "orgCode",
				sort:"orgCode",
				usepager : true,
				colModel : [ {
					display : '商户代码',
					width : 200,
					dataIndex : 'orgCode',
					align : 'center',
					sortable:true
				}, {
					display : '商户名称',
					width : 300,
					dataIndex : 'merName',
					align : 'center'
				}]
			}
});

$('#prodstatus').ajaxSelect({url:'findSecCodeList.action?codeType=D0_REVIEW_STATUS',displayField:'codeName',valueField:'codeNo',blank:true});

$.formValidator.initConfig({							
	onerror : function(msg) {
		alert(msg);
	}
});

$('#merOuterTidDetail').dialog({
	autoOpen : false,
	bgiframe : true,
	modal : true,
	resizable : false,
	draggable : false,
	width : 800,
	height : 500
});

//编辑机构
var edittid= function(record, id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}
	if('1' != record.addStatus) {
		alert("该商户未提交!");
		return;
	}
	$('#form2 :input').attr('disabled','disabled');
	//$.jyform.resetForm('form2');
	//$('#form2').fillObject({obj:record});
	$.ajax({url:'qryMerReviewAllInfo.action', type:'POST', dataType:'json', data:{jsonObject:$.toJSON(record)}
	,success:function(data){
		if ( data.success ) {
			if ( data.root && data.root[0] ) {
				$('#form2').fillObject({obj:data.root[0]});
				//$.jyform.fillForm('form2', data.root[0]);
				var prodSrc = "getMerProdImage.action?mid=" + record.mid + "&athType=MER_D0_PROD_PROT";
				$("#prodImg").attr('src',prodSrc);
			} else alert('未查询到审核信息. ');
		} else {
			alert('操作失败 原因是'+ data.syserr); 
		}
	}});
	//$('#form2 :input').attr('readOnly','disabled');
	var tr1 = "<TR ><TD width='120' class='flabel'><font color='red'>*</font>审核状态 ：</TD><TD class='finput'><select id='addStatus' name='addStatus'><option></option><option value='2'>审核通过</option><option value='3'>审核驳回</option></select></TD></TR>";
	var tr2 = "<TR rowspan='2'><TD class='flabel'><font color='red'>*</font>审核意见：</TD><TD class='finput'><textarea id='reviewOpinion' rows='3' cols='3'  name='backReason'></textarea></TD></TR>";

	var reviewHtml = tr1 + tr2;
	$('#reviewLog').html(reviewHtml);
	$('#merOuterTidDetail').dialog("option","title","审核信息");
	$('#merOuterTidDetail').dialog("option","buttons",{'确认' : function() {
			if(null == $('#addStatus').val() || '' == $('#addStatus').val()) {
				alert('请选择审核状态');
				return false;
			}
			if(null == $('#reviewOpinion').val() || '' == $('#reviewOpinion').val()) {
				alert('审核意见不能为空');
				return false;
			}
			$.ajaxForm({
				formId : 'form2',
				url : "doReviewMerProd.action",
				success : function(data) {
					if (data.success) {
						$('#querybutton').trigger('click');
						$('#form2 :input').attr('disabled','');
						$('#merOuterTidDetail').dialog('close');
						alert('成功！');
					} else {
						alert(data.syserr);
					}
				}
			});
		}
		,'关闭' : function() {
			$('#form2 :input').attr('disabled','');
				$(this).dialog('close');
			}
		});
	$('#merOuterTidDetail').dialog('open');
};	
						
var  viewtid = function(record,id) {
	if (!record) {
		alert("请选择一条记录");
		return;
	}
	$('#form2 :input').attr('disabled','disabled');
	//$.jyform.resetForm('form2');
	//$('#form2').fillObject({obj:record});
	$.ajax({url:'qryMerReviewAllInfo.action', type:'POST', dataType:'json', data:{jsonObject:$.toJSON(record)}
	,success:function(data){
		if ( data.success ) {
			if ( data.root && data.root[0] ) {
				$('#form2').fillObject({obj:data.root[0]});
				//$.jyform.fillForm('form2', data.root[0]);
				var prodSrc = "getMerProdImage.action?mid=" + record.mid + "&athType=MER_D0_PROD_PROT";
				$("#prodImg").attr('src',prodSrc);
			} else alert('未查询到审核信息. ');
		} else {
			alert('操作失败 原因是'+ data.syserr); 
		}
	}});
	$.ajax({url:'qryMerAudiLog.action', type:'POST', dataType:'json', data:{jsonObject:$.toJSON(record)}
	,success:function(data){
		if ( data.success ) {
			var reviewLogHtml = '';
			if ( data.root && data.root[0] ) {
				$(data.root).each(function(){
					var tr1 = "<tr><td><br/></td><td><br/></td></tr>";
					var tr2 = "<tr><TD width='120' class='flabel'>审核状态：</TD><TD class='finput'>"+ this.addStatusDesc +"</TD></tr>";
					var tr3 = "<tr><TD class='flabel'>审核意见：</TD><TD class='finput'>"+ this.backReason +"</TD></tr>";
					var tr4 = "<tr><TD class='flabel'>审核人：</TD><TD class='finput'>"+ this.audiOpt +"</TD></tr>";
					var tr5 = "<tr><TD class='flabel'>审核时间：</TD><TD class='finput'>"+ this.reviewDate +"</TD></tr>";
					reviewLogHtml += tr1 + tr2 + tr3 + tr4 + tr5;
				});
			}
			$('#reviewLog').html(reviewLogHtml);
		} else {
			alert('操作失败 原因是'+ data.syserr); 
		}
	}});
	//$('#form2 :input').attr('readOnly','disabled');
	$('#merOuterTidDetail').dialog("option","title","详细信息");
	$('#merOuterTidDetail').dialog("option","buttons",{'关闭' : function() {
		$('#form2 :input').attr('disabled','');
		$(this).dialog('close');
		}
		});
	$('#merOuterTidDetail').dialog('open');
};


//lxl add
$('#table').flexigrid({ 
		url : 'qryReviewMerProd.action',
		buttons : [
				{
					name : "审核",
					bclass : 'page_word',
					id : 'cel',
					onpress :edittid
				},{
					separator : true
				},{
					name : "详细信息",
					bclass : 'page_excel',
					id : 'cel',
					onpress : viewtid
				},{
					separator : true
				}				
				],
		 
		width : 400,
		dir : "desc",
		sort : "updDate",											
		usepager : true,
		colModel : [ {
			display : '商户号',												
			dataIndex : 'mid',
			align : 'center',
			sortable:true
		},{
			display : '商户名称',												
			dataIndex : 'merName',											
			sortable:true
		},{
			display : '服务商号',												
			dataIndex : 'channelCode',											
			sortable:true
		},{
			display : '服务商名称',											
			dataIndex : 'channelName',											
			sortable:true
		},{
			display : 'D0结算费率',	
			render:fmtRate4,
			align: 'center',
			dataIndex : 'addD0fee',											
			sortable:true
		},{
			display : '初始单笔限额',				
			render:fmtMoney,
			align: 'center',
			dataIndex : 'addOneLimit',											
			sortable:true
		},{
			display : '初始单日限额',		
			render:fmtMoney,
			align: 'center',
			dataIndex : 'addDayLimit',
			align : 'center'
		},
		{
			display : '申请时间',												
			dataIndex : 'updDate',
			align : 'center'
		},
		{
			display : '审核时间',												
			dataIndex : 'reviewDate',
			align : 'center'
		},
		{
			display : '审核状态',												
			dataIndex : 'addStatusDesc',
			align : 'center'
		},
		{
			display : '审核意见',												
			dataIndex : 'backReason',
			align : 'center'
		}]
	});
		
	
	$('#querybutton').click(function(){
		$.queryTable({
			formId : 'queryForm',
			tableId : 'table'
		});
	});						
	
	//初始化查询;
	$('#querybutton').trigger('click');
	
});