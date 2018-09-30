/**
 * @author Kanyong
 */


$().ready(function() {
	$('#groupNo').ajaxSelect({url:'findSecCodeList.action?codeType=SYS_USER_GROUP',displayField:'codeName',valueField:'codeNo',blank:false});

					$.formValidator.initConfig({
						onerror : function(msg) {
							alert(msg)
						}
					});

					$("#login_nm").formValidator({
						empty : false,
						onshow : "请输入内容",
						oncorrect : "√"
					}).inputValidator({
						min : 1,
						max : 40,
						onerror : "登录名最多40个字节(数字，字母或下划线)"
					}).regexValidator({
						regexp : "^[A-Za-z0-9_]+$",
						onerror : "登陆名仅能输入数字，字母或下划线"
					});

					$("#op_name").formValidator({
						empty : false,
						onshow : "请输入内容",
						oncorrect : "√"
					}).inputValidator({
						min : 1,
						max : 10,
						onerror : "用户名最多10个汉字或20个英文字母"
					});

					$("#password").formValidator({
						empty : false,
						onshow : "请输入内容",
						oncorrect : "√"
					}).inputValidator({
						min : 8,
						max : 20,
						onerror : "密码8~20个字符"
					}).regexValidator({
						regexp : "^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[!@#$]).{8,20}$",
						onerror : "密码需包括数字字母特殊字符(<span style='color:red;'>!@#$</span>)"
					});

					$("#pwdchk").formValidator({
						empty : false,
						onshow : "请输入内容",
						oncorrect : "√"
					}).regexValidator({
						regexp : "^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[!@#$]).{8,20}$",
						onerror : "密码需包括数字字母特殊字符(<span style='color:red;'>!@#$</span>)"
					}).compareValidator({
						desid : "password",
						operateor : "=",
						onerror : "2次密码不一致,请确认"
					});

					$("#status").formValidator({
						empty : false,
						onshow : "请输入内容",
						oncorrect : "√"
					});

					$("#groupNo").formValidator({
						empty : false,
						onshow : "请输入内容",
						oncorrect : "√"
					}).regexValidator({
						regexp : "^[0-9]+$",
						onerror : "请选择部门"
					});
					
					$("#cert_no").formValidator({
						empty : false,
						onshow : "请输入内容",
						oncorrect : "√"
					}).inputValidator({
						min : 18,
						max : 18,
						onerror : "证件号长度18位"
					}).functionValidator({
						fun : isCardID
					});

					$("#email")
							.formValidator({
								empty : true,
								oncorrect : "√"
							})
							.inputValidator({
								min : 1,
								max : 40,
								onerror : "EMAIL最多40个英文字母"
							})
							.regexValidator(
									{
										regexp : "^([\\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$",
										onerror : "邮箱格式不正确"
									});
$("#reserved2").formValidator({empty: true, oncorrect: "√"})
	.inputValidator({min: 1, max: 60, onerror: "预留信息最多可输入60个中英文字符。" });

					$('#addOper').dialog({
						autoOpen : false,
						bgiframe : true,
						modal : true,
						resizable : false,
						draggable : false,
						width : 800,
						height : 500
					});

					$('#tpermission').dialog({
						autoOpen : false,
						bgiframe : true,
						modal : true,
						resizable : false,
						draggable : false,
						width : 800,
						height : 500
					});

					$('#table')
							.flexigrid(
									{
										url : 'findPageOper.action',
										buttons : [
												{
													name : "新增操作员",
													show:'ROLE_USER_SINGLE_ADD_CZ',
													bclass : 'page_add',
													id : 'txt',
													onpress : function() {
														$("div[id$=Tip]").empty();
														$('#form1 :input')
																.attr('disabled','');
														$('#form1>select')
																.attr('disabled','');
														$('#formreset').click();
														$('#addOper').dialog("option","title","新增操作员");
														$('#addOper').dialog("option","buttons",{
																			'确定' : function() {
																				if ($.formValidator.pageIsValid('1')) {
																					if(!$('#org_code').val()){
																						alert('隶属机构必选择');
																					    return;
																					}
																					$.ajaxForm({
																								formId : 'form1',
																								url : "doInsertOper.action",
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
													name : "编辑",
													show:'ROLE_USER_SINGLE_EDIT_CZ',
													bclass : 'page_word',
													id : 'cel',
													onpress : function(record,id) {
														$("div[id$=Tip]").empty();
														$('#login_nm').attr('disabled','true');
														$('#password,#pwdchk').attr('disabled','true');

														if (!record) {
															alert("请选择一条记录");
															return;
														}
														$('#formreset').click();
														$('#form1 :input').each(function(i,n) {
																			if (n.name in record) {n.value = record[n.name];
																			}
																		});
														$('#password,#pwdchk').val("aaa1111!");

														$('#addOper').dialog("option","title","编辑操作员信息");
														$('#addOper').dialog("option","buttons",{'重置密码':function(){
													
																			var isable=confirm("该操作将重置该用户密码为aaa1111!,是否进行");
																			if(isable){																				
																				 $.ajax({url:'doResetUserPasswd.action',	
																					   data:{'oprId':record.opr_id},
																					   success:function(data){
																					     	if(data.success == true){																					     
																							alert("密码修改成功");
																							}
																							else alert(data.syserr);
																					   }
																					   });
																					   
																			}	
																		},'更新' : function() {
																				if ($.formValidator.pageIsValid('1')) {
																					$.ajaxForm({formId : 'form1',
																								url : 'doUpdateOper.action',
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
												}
												,
//												{
//													name : "详细信息",
//													bclass : 'page_excel',
//													id : 'cel',
//													onpress : function(record,id) {
//														$("div[id$=Tip]").empty();
//														if (!record) {
//															alert("请选择一条记录");
//															return;
//														}
//														$('#formreset').click();
//														$('#form1 :input').each(function(i,n) {
//																			if (n.name in record) {
//																				n.value = record[n.name];
//																				$(this).attr('disabled','true');
//																			}
//																		});
//
//														$('#addOper').dialog("option","title","详细信息");
//														$('#addOper').dialog(
//																		"option",
//																		"buttons",
//																		{'关闭' : function() {
//																				$('#form1 :input').attr('disabled','');
//																				$(this).dialog('close');
//																			}
//																		});
//
//														$('#addOper').dialog(
//																'open');
//
//													}
//												},
												{
													name : "分配角色",
													show:'ROLE_USER_SINGLE_ROLE_CZ',
													bclass : 'page_excel',
													id : 'cel',
													onpress : function(record,
															id) {
														if (!record) {
															alert("请选择一条记录");
															return;
														}
														$("div[id$=Tip]").empty();
														$('#form2reset')
																.click();
														$('#form2 :input')
																.each(function(i,n) {
																			if (n.name in record) {
																				n.value = record[n.name];
																			}
																		});

														
													$.ajax({
														url:'loadUserWithRole.action',
														async:false,
														data:{jsonObject:$.toJSON(record)},
														success:function(data){
															$('#roleGrid').refreshWithData(data);
														}													
													})
													
														
														
														
														
														
														
													
														$('#tpermission').dialog("option","title","分配操作员角色");
														$('#tpermission').dialog("option","buttons",{'确认' : function() {
																						roleId="";
																						data=$('#roleGrid').flexAllSelectData();
																						$.each(data,function(i){
																								if(i==0){
																									roleId=roleId+this.roleId;
																								}
																								else roleId=roleId+','+this.roleId;
																						})
																						if(roleId==""){
																							alert("请选择一个角色");
																							return;
																						}
															
																				$.ajaxForm({formId : 'form2',
																							url : 'doUpdateRoles.action',
																							dealData : function(
																									data) {
																								data.roles=roleId;																								
																								data.opr_id = record.opr_id;
																							},
																							success : function(
																									data) {
																								if (data.success) {
																									$('#tpermission').dialog('close');
																									alert('操作成功');
																									$(
																											'#queryBtn')
																											.click();
																								} else {
																									alert('操作失败 原因是'
																											+ data.syserr);
																								}
																							}
																						});

																			},
																			'关闭' : function() {
																				$(this).dialog('close');
																			}
																		});

														$('#tpermission').dialog('open');

													}
												},
												{
													separator : true
												},
												{
													name : "删除",
													show:'ROLE_USER_SINGLE_DEL_CZ',
													bclass : 'page_delete',
													id : 'txt',
													onpress : function(record,
															id) {
														if (!record) {
															alert("请选择一条记录");
															return;
														}

														var cf = confirm("确认要删除该操作员吗？");
														if (!cf) {
															return;
														}
														var obj = new Object();
														obj.opr_id = record.opr_id;
														$.ajax({type : 'POST',
																	url : 'delOper.action',
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
												}, {
													separator : true
												} ],
										width : 400,
										sort : "login_nm",
									
										checkbox : false,
										usepager : true,
										colModel : [
												{
													display : '操作员姓名',
													dataIndex : 'op_name',
													align : 'center'
												},
												{
													display : '操作员登录名',
													dataIndex : 'login_nm',
													align : 'center'
												},
												{
													display : '隶属机构',
													dataIndex : 'org_name',
													align : 'center'
												},
												{
													display : '备注',
													dataIndex : 'misc',
													align : 'center'
												},
																								{
													display : '操作员状态',
													dataIndex : 'status',
													render : function(record,
															value) {
														return value == 0 ? '启用'
																: (value == 1 ? '失效'
																		: '异常');
													},
													align : 'center'
												}]
									});
					
					
					
	$('#roleGrid').flexigrid({
		            url : 'findPageOper.action',
					limit : 100,
					width : 400,
					checkbox : true,
					usepager : false,					
					colModel : [
							{
								display : '角色ID',
								width : 200,
								dataIndex : 'roleId',
								align : 'center'
							},
							{
								display : '角色名称',
								width : 200,
								dataIndex : 'roleName',
								align : 'center'
							}]
				});		
					
					
					
					
					
					
					
					
					

					$('#queryBtn').click(function() {
						$.queryTable({
							formId : 'queryForm',
							tableId : 'table'
						});
					});
					

					$('#supOrgCodeSelect').queryDialog({
						width : 600,
						height : 400,
						flexigrid : {
							url : 'findSysOrg.action',
							width : 500,
							dir : "orgCode",
							sort: "orgCode",
							usepager : true,
							colModel : [ {
								display : '机构ID',
								width : 30,
								dataIndex : 'orgCode',
								align : 'center'
							}, {
								display : '机构名称',
								width : 150,
								dataIndex : 'orgName',
								align : 'center'
							} ]
						}
					});



					// 上级选择机构按钮
					$('#org_code').click(function() {
						$('#supOrgCodeSelect').queryDialogOpen({
							success : function(data) {
								if (data) {
									$('#org_code').val(data.orgCode);
									return true;
								} else {
									alert("请选择 一条数据");
									return false;
								}
							}
						});
					});		
					
					
					function changePwd(){
						var oldpwd= $('#changepwd input[name="passwdOrg"]').val();
						var newpwd= $('#changepwd input[name="passwd"]').val();
						var pwdrep= $('#changepwd input[name="passwdrep"]').val();
						if(newpwd==""||newpwd==""||oldpwd==""){
						alert("密码不许为空");
							return;
						}
						if(newpwd!=pwdrep){
							alert("密码和确认密码输入不一致");
							return;
						}

						 $.ajax({url:'doResetAccountPasswd.action',	
									   data:{'newpwd':newpwd,'oldpwd':oldpwd},
									   success:function(data){
									     	if(data.success == true){
									        $('#changepwd').dialog('close');
											alert("密码修改成功");
											}
											else alert(data.syserr);
									   }
									   });
									   
						}

					
					
					$('#changepwd').dialog({title:"修改密码",
						width:400,height:200,bgiframe:true,
						buttons:{'确定':changePwd,'取消':function(){$(this).dialog('close');}},autoOpen:false,draggable:false,resizable:false,modal:true});	
					 $('#changePWBtn').click(function(){						
						$('#changepwd').dialog('open');
						
					});		
					
					

					$('#q_org_code').click(function() {
						$('#supOrgCodeSelect').queryDialogOpen({
							success : function(data) {
								if (data) {
									$('#q_org_code').val(data.orgCode);
									return true;
								} else {
									alert("请选择 一条数据");
									return false;
								}
							}
						});
					});	
					
					$('#queryBtn').click();			
				});

