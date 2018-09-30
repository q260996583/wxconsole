$(document).ready(function() {
	
	$.formValidator.initConfig({							
		onerror : function(msg) {
			alert(msg);
		}
	});
	$('#editTidInfo').dialog({
		autoOpen : false,
		bgiframe : true,
		modal : true,
		resizable : false,
		draggable : false,
		width : 600,
		height : 400
	});
	var editTidInfo = function(record, id) {
		$('#form1').fillObject({obj:record});		
		$('#form1 :input').trigger('blur');
		$('#editTidInfo').dialog("option","title","编辑风险信息");
		$('#editTidInfo').dialog("option","buttons",
						{'更新' : function() {	
							if ($.formValidator.pageIsValid('1')) {
								$.ajaxForm({
									formId : 'form1',
									url : "doUpdateCoreTidinfoIcPara.action",
									success : function(data) {
										if (data.success) {											
											$('#editTidInfo').dialog('close');
											alert('风险信息更新成功');
											$('#querybutton').click();
										} else {
											alert('更新失败 原因是'
													+ data.syserr);
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

		$('#editTidInfo').dialog('open');
	};	
	
	$('#table').flexigrid({ 
		url : 'findTidInfoIcPara.action',
		buttons : [
				{
					name : "编辑",														
					bclass : 'page_add',
					id : 'txt',
					onpress : editTidInfo
				},{
					separator : true
				}],
		 
		width : 400,
		dir : "desc",
		sort : "orgCode",											
		usepager : true,
		colModel : [ 
    		{ display: 'AID(9F06)', dataIndex: 'aid', width: 80, align: 'center', sortable: true }
    		,{ display: '应用选择指示符ASI(DF01)', dataIndex: 'asi', width: 80, align: 'center', sortable: true }
    		,{ display: '应用版本号(9F09)', dataIndex: 'appVersion', width: 80, align: 'center', sortable: true }
    		,{ display: 'TAC－缺省(DF11)', dataIndex: 'tacDefault', width: 80, align: 'center', sortable: true }
    		,{ display: 'TAC－联机(DF12)', dataIndex: 'tacOnline', width: 80, align: 'center', sortable: true }
    		,{ display: 'TAC－拒绝(DF13)', dataIndex: 'tacReject', width: 80, align: 'center', sortable: true }
    		,{ display: '终端最低限额(9F1B)', dataIndex: 'icOfflineTxnMin', width: 80, align: 'center', sortable: true }
    		,{ display: '偏置随机选择的阈值(DF15)', dataIndex: 'radomSelLiminit', width: 80, align: 'center', sortable: true }
    		,{ display: '偏置随机选择的最大目标百分数(DF16)', dataIndex: 'radomSelectMaxpercent', width: 80, align: 'center', sortable: true }
    		,{ display: '随机选择的目标百分数', dataIndex: 'radomSelectPercent', width: 80, align: 'center', sortable: true }
    		,{ display: '缺省DDOL(DF14)', dataIndex: 'ddol', width: 80, align: 'center', sortable: true }
    		,{ display: '终端联机PIN支持能力(DF18)', dataIndex: 'onlinePin', width: 80, align: 'center', sortable: true }
    		,{ display: '终端电子现金交易限额', dataIndex: 'eCashLimit', width: 80, align: 'center', sortable: true }
    		,{ display: '非接触读写器脱机最低限额(DF19)', dataIndex: 'nonContactLimitMin', width: 80, align: 'center', sortable: true }
    		,{ display: '非接触读写器交易限额(DF20)', dataIndex: 'nonContactLimitMax', width: 80, align: 'center', sortable: true }
    		,{ display: '读写器持卡人验证方法（CVM）所需限制(DF21)', dataIndex: 'cvmLimit', width: 80, align: 'center', sortable: true }
		]
	});
		
	
	$('#querybutton').click(function(){
		$.queryTable({
			formId : 'queryForm',
			tableId : 'table'
		});
	});		
	
	$('#querybutton').click();
});