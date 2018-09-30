

$().ready(function() {
    $.formValidator.initConfig({
        onerror : function(msg) {
            alert(msg);
        }
    });
 
    $('#qstartDate1').pickdate({
        dateFmt : "yyyyMMdd"
    });
    $('#qstartDate2').pickdate({
        dateFmt : "yyyyMMdd"
    });
    $('#qendDate1').pickdate({
        dateFmt : "yyyyMMdd"
    });
    $('#qendDate2').pickdate({
        dateFmt : "yyyyMMdd"
    });
    $('#startDate').pickdate({
        dateFmt : "yyyyMMdd"
    });
    $('#endDate').pickdate({
        dateFmt : "yyyyMMdd"
    });
    $("#qstartDate1").val(AddDate(0));
    $("#qstartDate2").val(AddDate(0));
    $("#qendDate1").val(AddDate(0));
    $("#qendDate2").val(AddDate(0));
    $("#startDate").val(AddDate(0));
    $("#endDate").val(AddDate(0));
    var list=[
  	        {id:"bankCode",formValidator:{empty:false}
	        	,inputValidator:{min:1,max:10,onerror:"银行必选择"}},
  	        {id:"merCode",formValidator:{empty:false},inputValidator:{min:1,max:15,onerror:"内部商户号必选择"}},
  	        {id:"merOutCode",formValidator:{empty:false},inputValidator:{min:1,max:15,onerror:"外部商户号长度在1-15个字之间"}
  	        	,regexValidator:{regexp : "^[0-9]*$",onerror : "外部商户号仅能输入数字"}}, 	        
  	        {id:"startDate",formValidator:{empty:false}
	        	,inputValidator:{min:8,max:8,onerror:"起效清算日必选择"}},
	        {id:"endDate",formValidator:{empty:false}
	        	,inputValidator:{min:8,max:8,onerror:"失效清算日必选择"}},
	        {id:"merOutAcquireInstitCode",formValidator:{empty:true},inputValidator:{min:0,max:11,onerror:"外部标识码不得大于11位"}},
	        {id:"mccCups",formValidator:{empty:true},inputValidator:{min:0,max:10,onerror:"对银联的商户类别码（MCC）不得大于10位"}},
	        {id:"cardAcceptName",formValidator:{empty:true},inputValidator:{min:0,max:20,onerror:"受卡方名称不得大于20位"}},
	        {id:"sepcialchargeType",formValidator:{empty:true},inputValidator:{min:0,max:2,onerror:"特殊计费类型不得大于2位"}},
	        {id:"sepcialchargeLevel",formValidator:{empty:true},inputValidator:{min:0,max:1,onerror:"特殊计费级别不得大于1位"}},
  	   		{id:"busiDeductionRate",formValidator:{empty:true},inputValidator:{min:0,max:6,onerror:"位商户扣率不得大于6位"}
  	   		,regexValidator:{regexp : "^[0-9]*$",onerror : "位商户扣率仅能输入数字"}}
  	   		];


  $.someAuthentication(list);	
//    $('#addMerChn').dialog({
//        autoOpen : false,
//        bgiframe : true,
//        modal : true,
//        resizable : false,
//        draggable : false,
//        width : 800
//    });
    
    $('#addMerOrgAsk').dialog({
        autoOpen : false,
        bgiframe : true,
        modal : true,
        resizable : false,
        draggable : false,
        width : 820
    });
    
    $('#merOrgAskTidDetail').dialog({
        autoOpen : false,
        bgiframe : true,
        modal : true,
        resizable : false,
        draggable : false,
        width 		: 820
    });
    $('#upfileform').dialog({
        autoOpen : false,
        bgiframe : true,
        modal : true,
        resizable : false,
        draggable : false,
        width : 600
    });
    // 导入excel报表
    var imp_exc = function() {
        $('#upfileform').dialog("option", "title", "批量导入");
        $('#upfileform').dialog("option", "buttons", {
            '确定' : function() {
                var isCon = confirm("目前只支持.xls格式的文件,确定导入？");
                if (isCon) {
                    var obj = $('#upfileform').jsonObject();
                    $.ajaxFileUpload({
                        url : 'doImportMerOrgFile.action',
                        secureuri : false,
                        fileElementId : 'upLoadfile',
                        dataType : 'json',
                        data : {
                            jsonObject : $.toJSON(obj),
                            file : obj.upLoadfile
                        },
                        success : function(data, status) {
                            if (data.success) {
                                $('#upfileform').dialog('close');
                                alert('共有' + data.totalProperty + '条记录导入成功');
                                $('#querybutton').click();
                            } else {
                                alert('操作失败 原因是:' + data.syserr);
                            }
                        }
                    });
                    
                }
            },
            '关闭' : function() {
                $(this).dialog('close');
            }
        });
        $('#upfileform').dialog('open');
    };
  //查看交易商户银行转换申请详细信息
    var view = function(record,id) {
    	$("div[id$=Tip]").empty();   	 
   	
		if (!record) {
			alert("请选择一条记录");
			return;
		}
		$('#formreset2').click();
		$('#form2 :input').attr('disabled', 'disabled');
		$('#form2 :input').attr('border','0px');
		$('#form2 :input').each(function(i,n) {
			if (n.name in record) {
				n.value = record[n.name];
				$("td[id=q"+n.name+"]").text(record[n.name]);
			}
		});
		$('#merOrgAskTidDetail').dialog("option","title","详细信息");
		$('#merOrgAskTidDetail').dialog("option","buttons",{'关闭' : function() {
				$('#form2 :input').attr('disabled','');
				$(this).dialog('close');
			}
		});
		$('#merOrgAskTidDetail').dialog('open');
    };


	 //查询
    $('#table').flexigrid({
    	dbClickRecord	: view,
    	type 	: 'POST',
        url : 'findAllMerOrgAsk.action',
        buttons : [ {
            name : "新增",
            show : 'ROLE_ADD_MER_ORG_ASK_CZ',
            bclass : 'page_add',
            id : 'txt',
            onpress : function() {
                $("div[id$=Tip]").empty();
                $('#form1 :input').attr('disabled', '');
                $('#form1>select').attr('disabled', '');
   
                $('#formreset1').click();
                
                $('#addMerOrgAsk').dialog("option", "title", "新增");
                $('#addMerOrgAsk').dialog("option", "buttons", {
                    '确定' : function() {                    	 
                        if ($.formValidator.pageIsValid('1')) { 
                        	if($('#startDate').val()-$('#endDate').val()>0)
                    		{
                    		alert("开始日期不能早于结束日期！"); 
                    		return;
                    		}
                            $.ajaxForm({
                                formId : 'form1',
                                url : "doAddMerOrgAsk.action",
                                success : function(data) {
                                    if (data.success) {
                                        $('#addMerOrgAsk').dialog('close');
                                        alert('操作成功');
                                        $('#querybutton').click();
                                    } else {
                                        alert('操作失败 原因是' + data.syserr);
                                    }
                                }
                            });
                        } else {
                            return false;
                        }
                    },
                    '关闭' : function() {
                        $(this).dialog('close');
                    }
                });
                $('#addMerOrgAsk').dialog('open');
            }
        }, {
            separator : true
        }, {
            name : "编辑",
            show : 'ROLE_EDIT_MER_ORG_ASK_CZ',
            bclass : 'page_dtb',
            id : 'cel',
            onpress : function(record, id) {
                $("div[id$=Tip]").empty();
                if (!record) {
                    alert("请选择一条记录");
                    return;
                }
                $('#bankCode').attr('disabled', 'true');
                $('#merCode').attr('disabled', 'true');
                $('#merOutCode').attr('disabled', 'true');           
                $('#formreset1').click();
                $('#form1 :input').each(function(i, n) {
                    if (n.name in record) {
                        n.value = record[n.name];
                        $("td[id=td"+n.name+"]").text(record[n.name]);   
                       
                    }
                });              
                              
                
                $('#addMerOrgAsk').dialog("option", "title", "编辑");
                $('#addMerOrgAsk').dialog("option", "buttons", {
                    '更新' : function() {
                        if ($.formValidator.pageIsValid('1')) {
                        	if($('#q_startDate').val()-$('#q_endDate').val()>0)
                    		{
                    		alert("开始日期不能早于结束日期！"); 
                    		return;
                    		}
                            $.ajaxForm({
                                formId : 'form1',
                                url : 'doUpdateMerOrgAsk.action',                                
                                success : function(data) {
                                    if (data.success) {
                                        $('#addMerOrgAsk').dialog('close');
                                        alert('操作成功');
                                        $('#querybutton').click();
                                    } else {
                                        alert('操作失败 原因是' + data.syserr);
                                    }
                                }
                            });
                        } else {
                            return false;
                        }
                        
                    },
                    '关闭' : function() {
                        $(this).dialog('close');
                    }
                });
                
                $('#addMerOrgAsk').dialog('open');
                
            }
        }, {
            separator : true
        } , {
            name : "详细信息",
            //show : 'ROLE_ONELEVER_MER_DETAIL_CZ',
            bclass : 'page_excel',
            id : 'cel',
            onpress : view
        }, {
            separator : true
        }, {
            name : "删除",
            show : 'ROLE_DELETE_MER_ORG_ASK_CZ',
            bclass : 'page_word',
            id : 'cel',
            onpress : function(record, id) {
                if (!record) {
                    alert("请选择一条记录");
                    return;
                }
                
                
                var cf = confirm("确认要删除吗？");
                if (!cf) {
                    return;
                }
//                var obj = new Object();
//                obj.bankCode = record.bankCode;
//                obj.merOrg = record.merOrg;
//                obj.merOutOrg = record.merOutOrg;
//                obj.askBatchNo = record.askBatchNo;
                $.ajax({
                    type : 'POST',
                    url : 'doDeleteMerOrgAsk.action',
                    data : {
                        jsonObject : $.toJSON(record)
                    },
                    success : function(data) {
                        if (data.success) {
                            alert('操作成功');
                            $('#querybutton').click();
                        } else {
                            alert('操作失败 原因是' + data.syserr);
                        }
                    }
                });
            }
        },{
            separator : true
        }, {
            name : "批量导入",
            show : 'ROLE_BATCH_IMP_MER_ORG_ASK_CZ',
            bclass : 'page_add',
            id : 'cel',
            onpress : imp_exc
        } , {
            separator : true
        }, {
            name : "审批通过入库",
            show : 'ROLE_AUDIT_MER_ORG_ASK_CZ',
            bclass : 'page_word',
            id : 'cel',
            onpress : function(record, id) {
                if (!record) {
                    alert("请选择一条记录");
                    return;
                }
                
                
                var cf = confirm("确认要审批通过入库吗？");
                if (!cf) {
                    return;
                }
//                var obj = new Object();
//                obj.bankCode = record.bankCode;
//                obj.merOrg = record.merOrg;
//                obj.merOutOrg = record.merOutOrg;
//                obj.askBatchNo = record.askBatchNo;
                $.ajax({
                    type : 'POST',
                    url : 'doAuditMerOrgAsk.action',
                    data : {
                        jsonObject : $.toJSON(record)
                    },
                    success : function(data) {
                        if (data.success) {
                            alert('操作成功');
                            $('#querybutton').click();
                        } else {
                            alert('操作失败 原因是' + data.syserr);
                        }
                    }
                });
            }
        }, {
            separator : true
        }
        ],
        width : 400,
        sort : "lastUpdTm",
        dir : 'desc',
        checkbox : false,
        usepager : true,
        colModel : [ {
            display : '银行号',
            dataIndex : 'bankCode',
            align : 'center'
        },{
            display : '银行名称',
            dataIndex : 'bankName',
            align : 'center'
        }, {
            display : '内部商户号',
            dataIndex : 'merCode',
            align : 'center'
        }, {
            display : '商户名称',
            dataIndex : 'merName',
            align : 'center'
        }, {
            display : '外部商户号',
            dataIndex : 'merOutCode',
            align : 'center'
        }, {
            display : '申请批次',
            dataIndex : 'askBatchNo',
            align : 'center'
        }      
        , {
            display : '起效清算日',
            dataIndex : 'startDate',          
            align : 'center'
        }, {
            display : '失效清算日',
            dataIndex : 'endDate',          
            align : 'center'
        } ]
    });
    
    
    $('#querybutton').click(function() {
        $.queryTable({
            formId : 'queryForm',
            tableId : 'table'
        });
    });
    
    $('#querybutton').click();
    


	$('#bankSelect').queryDialog({
		width : 600,
		height : 400,
		flexigrid : {
			url : 'findAllBank.action',
			width : 500,
			dir : "orgCode",
			sort: "orgCode",
			usepager : true,
			colModel : [ {
				display : '银行机构号',
				width : 200,
				dataIndex : 'orgCode',
				align : 'center'
			}, {
				display : '银行名称',
				width : 250,
				dataIndex : 'bankName',
				align : 'center'
			} ]
		}
	});



	
	$('#bankCode').click(function() {
		$('#bankSelect').queryDialogOpen({
			success : function(data) {
				if (data) {
					$('#bankCode').val(data.orgCode);
					return true;
				} else {
					alert("请选择 一条数据");
					return false;
				}
			}
		});
	});
	$('#merchantSelect').queryDialog({
     	width : 600,
     	height : 400,												
		flexigrid:{ 
				url : 'findAllMerchantDialog.action',					
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
					width : 250,
					dataIndex : 'merName',
					align : 'center'
				}]
			}
});

$('#merCode').click(function(){							
	$('#merCode').val($('#orgCode').val());
	$('#merchantSelect').dialog("option","title","商户信息");
	$('#merchantSelect').queryDialogOpen({success:function(data){
		if(data){
			$('#merCode').val(data.orgCode);
			return true;
		}else {
			alert("请选择 一条数据");
			return false;
		}
	}});
});
});
