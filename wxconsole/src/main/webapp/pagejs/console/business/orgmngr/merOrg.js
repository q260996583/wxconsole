

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
    $("#qstartDate1").val(AddDate(0));
    $("#qstartDate2").val(AddDate(0));
    $("#qendDate1").val(AddDate(0));
    $("#qendDate2").val(AddDate(0));
	
    
    $('#merOrgDetail').dialog({
        autoOpen : false,
        bgiframe : true,
        modal : true,
        resizable : false,
        draggable : false,
        width 		: 820
    });

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
		$('#merOrgDetail').dialog("option","title","详细信息");
		$('#merOrgDetail').dialog("option","buttons",{'关闭' : function() {
				$('#form2 :input').attr('disabled','');
				$(this).dialog('close');
			}
		});
		$('#merOrgDetail').dialog('open');
    };


	 //查询
    $('#table').flexigrid({
    	dbClickRecord	: view,
    	type 	: 'POST',
        url : 'findAllMerOrg.action',
        buttons : [ {
            name : "详细信息",
            //show : 'ROLE_ONELEVER_MER_DETAIL_CZ',
            bclass : 'page_excel',
            id : 'cel',
            onpress : view
        }, {
            separator : true
        }, {
            name : "启用/未启用",
            show : 'ROLE_STARTORSTOP_MER_ORG_CZ',
            bclass : 'page_word',
            id : 'cel',
            onpress : function(record, id) {
                if (!record) {
                    alert("请选择一条记录");
                    return;
                }
                var statue = record.statue;
                if(statue == "0"){
                	var cf = confirm("确认要启用吗？");
                	if (!cf) {
                        return;
                    }
                }
                if(statue == "1"){
                	var scf = confirm("确认要不启用吗？");
                	if (!scf) {
                        return;
                    }
                }         
//                var obj = new Object();
//                obj.bankCode = record.bankCode;
//                obj.merOrg = record.merOrg;
//                obj.merOutOrg = record.merOutOrg;
                $.ajax({
                    type : 'POST',
                    url : 'doStartOrStopMerOrg.action',
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
        }     
        , {
            display : '起效清算日',
            dataIndex : 'startDate',          
            align : 'center'
        }, {
            display : '失效清算日',
            dataIndex : 'endDate',          
            align : 'center'
        } , {
            display : '状态',
            dataIndex : 'statueZh',          
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
    


});
