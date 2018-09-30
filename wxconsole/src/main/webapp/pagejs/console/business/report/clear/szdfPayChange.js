$().ready(function() {
	$('#dateStart').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);	
	$('#dateEnd').pickdate({dateFmt:"yyyyMMdd"}).val(DatePre);
   
    
  //——————————————————————————————————————————商户选择    
	$('#merSelect').queryDialog({
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
	
	//上级选择机构按钮
	$('#qmerName2').click(function(){							
		$('#orgCode').val($('#mid2').val());
		$('#merSelect').dialog("option","title","商户信息");
		$('#merSelect').queryDialogOpen({success:function(data){
			if(data){
				$('#mid2').val(data.orgCode);
				$('#qmerName2').val(data.merName);
				return true;
			}else {
				alert("请选择 一条数据");
				return false;
			}
		}});
	});
	//上级选择机构按钮
	$('#qmerName').click(function(){							
		$('#orgCode').val($('#mid').val());
		$('#merSelect').dialog("option","title","商户信息");
		$('#merSelect').queryDialogOpen({
			
			clear : function() {
				$('#mid').val('');
				 $('#qmerName').val('');
			},

			success:function(data){
			if(data){
				$('#mid').val(data.orgCode);
				$('#qmerName').val(data.merName);
				return true;
			}else {
				alert("请选择 一条数据");
				return false;
			}
		}});
	});
//——————————————————————————————————————————商户选择    
//——————————————————————————————————————————初始化
	$('#kftInitialize').click(function(){//对清算期间内支付状态payStat:2失败,冻结状态freezeFlag:0未冻结,的记录进行初始化,可将mid、artiAddFlag作为限制条件
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		var mid=$('#mid').val();
		var artiAddFlag=$('#artiAddFlag').val();
		var payStat=$('#payStat').val();
		var freezeFlag=$('#freezeFlag').val();

		
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		if('2'!=payStat){
			alert("支付状态必须为失败");
			return;
		}
		if('0'!=freezeFlag){
			alert("冻结状态必须为否");
			return;
		}
		  var cf = confirm("确定初始化?");
	      if (!cf) {
	          return;
	      }
		
		$.ajax({url:'kftInitialize.action',	
			   data:{'dateStart':dateStart,'dateEnd':dateEnd,'mid':mid,'payStat':payStat,'freezeFlag':freezeFlag,'artiAddFlag':artiAddFlag},
			   dataType : 'json',			
				type : "POST",
			   success:function(data){
			     	if(data.success == true){
			     	alert("初始化完成");
					}else {					
						alert(data.syserr);
					}
					$('#queryBtn').trigger('click');
				   }
			   });
	});	
//——————————————————————————————————————————初始化
//——————————————————————————————————————————冻结
	$('#kftfreeze').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		var mid=$('#mid').val();
		var artiAddFlag=$('#artiAddFlag').val();
		var payStat=$('#payStat').val();
		var freezeFlag=$('#freezeFlag').val();

		
		
		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		if('9'!=payStat){
			alert("支付状态必须为未请求");
			return;
		}
		if('0'!=freezeFlag){
			alert("冻结状态必须为否");
			return;
		}
		  var cf = confirm("确定冻结?");
	      if (!cf) {
	          return;
	      }
		
		$.ajax({url:'kftfreeze.action',	
			   data:{'dateStart':dateStart,'dateEnd':dateEnd,'mid':mid,'payStat':payStat,'freezeFlag':freezeFlag,'artiAddFlag':artiAddFlag},
			   dataType : 'json',			
				type : "POST",
			   success:function(data){
			     	if(data.success == true){
			     	alert("冻结完成");
					}else {					
						alert(data.syserr);
					}
					$('#queryBtn').trigger('click');
				   }
			   });
	});	
//——————————————————————————————————————————冻结
//——————————————————————————————————————————解冻
	$('#kftUnfreeze').click(function(){
		var dateStart=$('#dateStart').val();
		var dateEnd=$('#dateEnd').val();
		var mid=$('#mid').val();
		var artiAddFlag=$('#artiAddFlag').val();
		var payStat=$('#payStat').val();
		var freezeFlag=$('#freezeFlag').val();

		if(!dateStart){
			alert("请输入开始日期");
			return;
		}
		if(!dateEnd){
			alert("请输入结束日期");
			return;
		}
		if('6'!=payStat){
			alert("支付状态必须为冻结");
			return;
		}
		if('1'!=freezeFlag){
			alert("冻结状态必须为是");
			return;
		}
		  var cf = confirm("确定解冻?");
	      if (!cf) {
	          return;
	      }
		
		$.ajax({url:'kftUnfreeze.action',	
			   data:{'dateStart':dateStart,'dateEnd':dateEnd,'mid':mid,'payStat':payStat,'freezeFlag':freezeFlag,'artiAddFlag':artiAddFlag},
			   dataType : 'json',			
				type : "POST",
			   success:function(data){
			     	if(data.success == true){
			     	alert("解冻完成");
					}else {					
						alert(data.syserr);
					}
					$('#queryBtn').trigger('click');
				   }
			   });
	});	
//——————————————————————————————————————————解冻
//——————————————————————————————————————————导出excel
    $('#downFileExl').click(function(){
    	var dateStart=$('#dateStart').val();
    	var dateEnd=$('#dateEnd').val();
		var mid=$('#mid').val();
    	var artiAddFlag=$('#artiAddFlag').val();
    	var payStat=$('#payStat').val();
    	var freezeFlag=$('#freezeFlag').val();

    	if(!dateStart){
    		alert("请输入开始日期");
    		return;
    	}
    	if(!dateEnd){
    		alert("请输入结束日期");
    		return;
    	}
    //findBankPayApplySumExl
    	var href="findSzdfPayDetailExl.action?dateStart="+dateStart+"&dateEnd="+dateEnd+"&mid="+mid+"&payStat="+payStat
    	+"&artiAddFlag="+artiAddFlag+"&freezeFlag="+freezeFlag;
    	window.open(href);
    });
//——————————————————————————————————————————导出excel
    
	$('#stlmDate').pickdate({dateFmt:"yyyyMMdd"});

					$.formValidator.initConfig({
						onerror : function(msg) {
							alert(msg);
						}
					});

					$("#stlmDate").formValidator({
						empty : false,
						onshow : "请输入内容",
						oncorrect : "√"
					}).inputValidator({
						min : 8,
						max : 8,
						onerror : "请输入清算日期"
					});

					$("#mid2").formValidator({
						empty : false,
						onshow : "请输入内容",
						oncorrect : "√"
					}).inputValidator({
						min : 15,
						max : 15,
						onerror : "商户编号为15位"
					});

					$("#realAmt").formValidator({
						empty : false,
						onshow : "请输入内容",
						oncorrect : "√"
					}).inputValidator({
						min : 1,
						max : 12,
						onerror : "请输入金额"
					});


					$('#addOper').dialog({
						autoOpen : false,
						bgiframe : true,
						modal : true,
						resizable : false,
						draggable : false,
						width : 800,
						height : 300
					});

					$('#table').flexigrid({
										url : 'findSzdfPayDetai.action',
										buttons : [
												{
													name : "新增支付记录",
													show:'ROLE_REPORT_SZKFT_PAY_ADD_UPDATE_BUT_CZ',
													bclass : 'page_add',
													id : 'txt',
													onpress : function() {
														$("div[id$=Tip]").empty();
														$('#form1 :input')
																.attr('disabled','');
														$('#form1>select')
																.attr('disabled','');
														$('#formreset').click();
														$('#addOper').dialog("option","title","新增支付记录");
														$('#addOper').dialog("option","buttons",{
																			'确定' : function() {
																				if ($.formValidator.pageIsValid('1')) {																	
																					$.ajaxForm({
																								formId : 'form1',
																								url : "doInsertSzdfPayRecord.action",
																								success : function(data) {
																									if (data.success) {
																										$('#addOper').dialog('close');
																										alert('操作成功');
																										$('#queryBtn').click();
																									} else {
																										alert('操作失败 原因是'+ data.syserr);
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
														$('#addOper').dialog('open');
													}
												},
												{
													separator : true
												},
												{
													name : "支付金额修改",
													show:'ROLE_REPORT_SZKFT_PAY_MONEY_BUT_CZ',
													bclass : 'page_word',
													id : 'cel',
													onpress : function(record,id) {
														$("div[id$=Tip]").empty();

														if (!record) {
															alert("请选择一条记录");
															return;
														}
														$('#formreset').click();
														$('#form1 :input').each(function(i,n) {
																			if (n.name in record) {n.value = record[n.name];
																			}
																		});
													
														$('#addOper').dialog("option","title","修改支付金额");
														$('#addOper').dialog("option","buttons",{'更新' : function() {
															 var payStat = record.payStat;
																if(payStat!='9'){
																	alert('支付状态非未请求不能修改金额');
																    return;
																}
																var cf = confirm("确认修改支付金额？");
																if (!cf) {
																	return;
																}
															
																				if ($.formValidator.pageIsValid('1')) {
																					$.ajaxForm({formId : 'form1',
																								url : 'doUpdateSzdfPayRecord.action',
																								dealData : function(data) {
																									data.opr_id = record.opr_id;
																								},
																								success : function(data) {
																									if (data.success) {
																										$('#addOper').dialog('close');
																										alert('操作成功');
																										$('#queryBtn').click();
																									} else {
																										alert('操作失败 原因是'+ data.syserr);
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

														$('#addOper').dialog('open');

													}
												},												
												{
													separator : true
												},
												{
													name : "手工录入记录删除",
													show:'ROLE_REPORT_SZKFT_PAY_ADD_DEL_BUT_CZ',
													bclass : 'page_delete',
													id : 'txt',
													onpress : function(record,id) {
														if (!record) {
															alert("请选择一条记录");
															return;
														}
														
                                                        var artiAddFlag = record.artiAddFlag;
														if(artiAddFlag!='1'){
															alert('非手工录入记录不能删除');
														    return;
														}
														 var payStat = record.payStat;
															if(payStat!='9'){
																alert('支付状态非未请求不能删除');
															    return;
															}
														
														var cf = confirm("确认要删除该支付记录吗？");
														if (!cf) {
															return;
														}
														
														var obj = new Object();
														obj.baseSeqNo = record.baseSeqNo;
														$.ajax({type : 'POST',
																	url : 'delSzdfPayRecord.action', 
																	data : {jsonObject : $.toJSON(obj)},//delOper
																	success : function(data) {
																		if (data.success) {
																			alert('操作成功');
																			$('#queryBtn').click();
																		} else {
																			alert('操作失败 原因是'+ data.syserr);
																		}
																	}
																});
													}
												}, {
													separator : true
												},
												{
													separator : true
												},{
													name : "初始化",
													show:'ROLE_REPORT_SZKFT_PAY_INIT_BUT_CZ',
													bclass : 'page_word',
													id : 'txt',
													onpress : function(record,id) {
														if (!record) {
															alert("请选择一条记录");
															return;
														}
														
                                                        var payStat = record.payStat;
														if(payStat!='2'){
															alert('非失败记录不能初始化');
														    return;
														}
														var cf = confirm("确认要初始化该支付记录吗？");
														if (!cf) {
															return;
														}
														
														var obj = new Object();
														obj.baseSeqNo = record.baseSeqNo;
														
														$.ajax({type : 'POST',
																	url : 'dokftSingleInitialize.action', 
																	data : {jsonObject : $.toJSON(obj)},
																	success : function(data) {
																		if (data.success) {
																			alert('操作成功');
																			$('#queryBtn').click();
																		} else {
																			alert('操作失败 原因是'+ data.syserr);
																		}
																	}
																});
													}
												},{
													separator : true
												},{
													name : "冻结",
													show:'ROLE_REPORT_SZKFT_PAY_FROZEN_BUT_CZ',
													bclass : 'page_word',
													id : 'txt',
													onpress : function(record,id) {
														if (!record) {
															alert("请选择一条记录");
															return;
														}
                                                        var payStat = record.payStat;
														if(payStat!='9'){
															alert('非未请求记录不能冻结');
														    return;
														}
														var cf = confirm("确认要冻结该支付记录吗？");
														if (!cf) {
															return;
														}
														
														var obj = new Object();
														obj.baseSeqNo = record.baseSeqNo;
														
														$.ajax({type : 'POST',
																	url : 'dokftSingleFreeze.action', 
																	data : {jsonObject : $.toJSON(obj)},
																	success : function(data) {
																		if (data.success) {
																			alert('操作成功');
																			$('#queryBtn').click();
																		} else {
																			alert('操作失败 原因是'+ data.syserr);
																		}
																	}
																});
													}
												},{
													separator : true
												},{
													name : "解冻",
													show:'ROLE_REPORT_SZKFT_PAY_THAW_BUT_CZ',
													bclass : 'page_word',
													id : 'txt',
													onpress : function(record,id) {
														if (!record) {
															alert("请选择一条记录");
															return;
														}
                                                        var payStat = record.payStat;
														if(payStat!='6'){
															alert('非冻结记录不能解冻');
														    return;
														}
														var cf = confirm("确认要解冻该支付记录吗？");
														if (!cf) {
															return;
														}
														
														var obj = new Object();
														obj.baseSeqNo = record.baseSeqNo;
														
														$.ajax({type : 'POST',
																	url : 'dokftSingleUnFreeze.action', 
																	data : {jsonObject : $.toJSON(obj)},
																	success : function(data) {
																		if (data.success) {
																			alert('操作成功');
																			$('#queryBtn').click();
																		} else {
																			alert('操作失败 原因是'+ data.syserr);
																		}
																	}
																});
													}
												}],
										width : 400,
										sort : "login_nm",
									
										checkbox : false,
										usepager : true,
										colModel : [ {
											display : '清算日期',												
											dataIndex : 'stlmDate',
											align : 'center',
											sortable:true
										},{
											display : '商户名称',												
											dataIndex : 'merName',
											align : 'center',
											sortable:true
										},{
											display : '商户账户全称',												
											dataIndex : 'privateAccntName',											
											sortable:true
										},{
											display : '商户编号',											
											dataIndex : 'mid',
											align : 'center'
										},{
											display : '商户账号',												
											dataIndex : 'privateAccntNo',											
											sortable:true
										},{
											display : '开户行',											
											dataIndex : 'privateAccntBank',											
											sortable:true
										},{
											display : '清算额',											
											dataIndex : 'stlmAmt',	
											render : function(record, value) {
												return (value == '0' || value =='') ? '0.00' :value;
											},
											sortable:true
										},{
											display : '应收流量费',											
											dataIndex : 'flowFee',
											render : function(record, value) {
												return (value == '0' || value =='') ? '0.00' :value;
											},
											align : 'center'
										},{
											display : '应付款金额',											
											dataIndex : 'realAmt',
											render : function(record, value) {
												return (value == '0' || value =='') ? '0.00' :value;
											},
											align : 'center'
										},{
											display : '支付状态',				
											dataIndex : 'payStat',
											render : function(record, value) {
												return (value =='1') ? '成功' :((value =='2') ? '失败' :((value =='3') ? '快付通处理中' :((value =='7') ? '退票' :((value =='8') ? '未响应' :((value =='9') ? '未请求' :(value=='6'?'冻结':'未知状态'))))));	
											},
											align : 'center'
										},{
											display : '是否手工录入',											
											dataIndex : 'artiAddFlag',
											render : function(record, value) {
												return (value == '1') ? '是' :'否';
											},
											align : 'center'
										},{
											display : '是否冻结',											
											dataIndex : 'freezeFlag',
											render : function(record, value) {
												return (value == '1') ? '是' :'否';
											},
											align : 'center'
										},{
											display : '原始流水号',	
											hidden:true,
											dataIndex : 'baseSeqNo',										
											align : 'center'
										}]
									});

					$('#queryBtn').click(function() {
						if(!$('#dateStart').val()){
							alert('起始清算日期必须填写');
							return false;
						}
						if(!$('#dateEnd').val()){
							alert('结束清算日期必须填写');
							return false;
						}
						
						$.queryTable({
							formId : 'queryForm',
							tableId : 'table'
						});
					});

					$('#queryBtn').click();			
				});

