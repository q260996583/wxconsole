$(document).ready(function() {
					$('#createTime').pickdate({
						dateFmt : "yyyyMMdd"
					});					
					
//					//新增
//					$('#newMerRepInfo').dialog({
//						autoOpen : false,
//						bgiframe : true,
//						modal : true,
//						resizable : false,
//						draggable : false,
//						width : 600,
//						height : 400
//					});
//					//编辑
//					$('#editMerRepInfo').dialog({
//						autoOpen : false,
//						bgiframe : true,
//						modal : true,
//						resizable : false,
//						draggable : false,
//						width : 600,
//						height : 300
//					});
//					//新增
//					var newMerRepInfo = function() {
//						$('#formreset').click();
//						$('#newMerRepInfo').dialog("option", "title", "新增商户报表信息");
//						$('#newMerRepInfo').dialog("option", "buttons", {
//							'确定' : function() {
//								if ($.formValidator.pageIsValid('1')) {
//									$.ajaxForm({
//										formId : 'form1',
////										url : "doNewMerRepInfo.action",
//										success : function(data) {
//											if (data.success) {
//												$('#newMerRepInfo').dialog('close');
//												$('#table').flexAddData(data.root[0]);
//												alert('新增商户报表信息成功');
//											} else {
//												alert(data.syserr);
//											}
//										}
//									});
//								} else {
//									return false;
//								}
//							},
//							'关闭' : function() {
//								$(this).dialog('close');
//							}
//						});
//						$('#newMerRepInfo').dialog('open');
//					};
//					
//					//编辑
//					var editMerRepInfo = function(record, id) {
//						if (!record) {
//							alert("请选择一条记录");
//							return;
//						}
//						$('#form1').fillObject({
//							obj : record
//						});
//						$('#form1 :input').trigger('blur');
//						$('#orgCode').attr('disabled', "disabled").unFormValidator(true);
//						//编辑
//						$('#newMerRepInfo').dialog("option", "title", "编辑商户报表信息");
//						$('#newMerRepInfo').dialog("option", "buttons", {
//							'更新' : function() {
//								if ($.formValidator.pageIsValid('1')) {
//									$.ajaxForm({
//										formId : 'form1',
////										url : "doUpdateBankAccnt.action",
//										success : function(data) {
//											if (data.success) {
//												$('#table').flexModifyData(data.root[0]);
//												$('#newMerRepInfo').dialog('close');
//												alert('商户报表信息更新成功');
//											} else {
//												alert('更新失败 原因是' + data.syserr);
//											}
//										}
//									});
//								} else {
//									return false;
//								}
//							},
//							'关闭' : function() {
//								$(this).dialog('close');
//							}
//						});
//						$('#newMerRepInfo').dialog('open');
//					};

					
					
					$('#channelSelect').queryDialog({
						width : 600,
						height : 400,
						flexigrid : {
							url : 'findAllChannel.action',
							width : 550,
							dir : "channelCode",
							sort : "channelCode",
							usepager : true,
							colModel : [ {
								display : '服务商代码',
								width : 200,
								dataIndex : 'channelCode',
								align : 'center',
								sortable : true
							}, {
								display : '服务商名称',
								width : 300,
								dataIndex : 'channelName',
								align : 'center'
							} ]
						}
					});

					$('#searchChannel').click(function() {
						$('#channelSelect').queryDialogOpen({
							clear : function() {
								$('#searchChannel').val('');
							},
							success : function(data) {
								if (data) {
									$('#searchChannel').val(data.channelCode);
									return true;
								} else {
									alert("请选择 一条数据");
									return false;
								}
							}
						});
					});

					
					
					$('#tranLimitParam')
							.ajaxSelect(
									{
										url : 'findSecCodeList.action?codeType=TRANS_GROUP_CODE',
										displayField : 'codeName',
										valueField : 'codeNo',
										blank : true
									});

					$.formValidator.initConfig({
						onerror : function(msg) {
							alert(msg);
						}
					});

					var list = [ {
						id : "orgCode",
						formValidator : {
							empty : false
						},
						inputValidator : {
							min : 15,
							max : 15,
							onerror : "机构号长度不得为空不得大于20位"
						}
					}, {
						id : "merName",
						formValidator : {
							empty : false
						},
						inputValidator : {
							min : 1,
							max : 40,
							onerror : "商户名称不得为空不得大于50个汉字"
						}
					}, {
						id : "enName",
						formValidator : {
							empty : true
						},
						inputValidator : {
							min : 0,
							max : 80,
							onerror : "商户英文名称不得大于100个字母"
						}
					}, {
						id : "merOutName",
						formValidator : {
							empty : false
						},
						inputValidator : {
							min : 1,
							max : 40,
							onerror : "商户对外经营名称不得为空不得大于50个汉字"
						}
					}, {
						id : "enOutName",
						formValidator : {
							empty : true
						},
						inputValidator : {
							min : 0,
							max : 80,
							onerror : "商户对外英文名称不得大于100个字母"
						}
					} ];

					$('#merchantstatus').dialog({
						autoOpen : false,
						bgiframe : true,
						modal : true,
						resizable : false,
						draggable : false,
						width : 600,
						height : 400
					});

					$('#merchantDetail').dialog({
						autoOpen : false,
						bgiframe : true,
						modal : true,
						resizable : false,
						draggable : false,
						width : 800,
						height : 600
					});

					$('#downloadOutMerApplyFile')
							.click(
									function() {
										var orgCode = $(
												"#form2 input[id=orgCode]")
												.val();
										$
												.ajax({
													type : 'post',
													url : 'booleanMerFile.action',
													async : false,
													data : {
														"orgCode" : orgCode
													},
													success : function(data) {
														if (data.success) {
															var href = "downloadsdMerFile.action?orgCode="
																	+ orgCode;
															window.open(href);
														} else {
															alert("进件文件包不存在");
														}
													}
												});
									});

					// 详细信息
					var view = function(record, id) {
						if (!record) {
							alert("请选择一条记录");
							return;
						}
						$('#form2').fillObject({
							obj : record
						});
						$('#form2 :input').attr('disabled', 'disabled');

						if (record.tranLimit == '') {
							record.tranLimit = 0;
						}
						$('#tranLimit')
								.val(
										$
												.changeDecimal(parseFloat(record.tranLimit) / 100));
						$('#tranLimitDebit')
								.val(
										$
												.changeDecimal(parseFloat(record.tranLimitDebit) / 100));
						$('#bizLicnoExpireDate').val(
								frmBSDate(record.bizLicnoExpireDate));
						$('#personNoExpireDate').val(
								frmBSDate(record.personNoExpireDate));
						$('#cardLicnoExpireDate').val(
								frmBSDate(record.cardLicnoExpireDate));
						$('#form2 [type=checkbox]').attr("checked", "");
						if (record.businessStat.substr(0, 1) == 1)
							$('#form2 [name=payPerm]').attr("checked",
									"checked");
						if (record.businessStat.substr(1, 1) == 1)
							$('#form2 [name=preAuthPerm]').attr("checked",
									"checked");
						if (record.businessStat.substr(2, 1) == 1)
							$('#form2 [name=onlineReturnsPerm]').attr(
									"checked", "checked");
						if (record.businessStat.substr(3, 1) == 1)
							$('#form2 [name=installPayPerm]').attr("checked",
									"checked");
						if (record.businessStat.substr(4, 1) == 1)
							$('#form2 [name=integralConsPerm]').attr("checked",
									"checked");
						if (record.businessStat.substr(5, 1) == 1)
							$('#form2 [name=labourBusiPerm]').attr("checked",
									"checked");
						if (record.businessStat.substr(6, 1) == 1)
							$('#form2 [name=labourConsPerm]').attr("checked",
									"checked");
						if (record.businessStat.substr(7, 1) == 1)
							$('#form2 [name=labourPreAuthPerm]').attr(
									"checked", "checked");
						if (record.businessStat.substr(8, 1) == 1)
							$('#form2 [name=labourReturnsPerm]').attr(
									"checked", "checked");
						if (record.businessStat.substr(9, 1) == 1)
							$('#form2 [name=labourInstallPerm]').attr(
									"checked", "checked");
						if (record.businessStat.substr(10, 1) == 1)
							$('#form2 [name=transSystemCardPerm]').attr(
									"checked", "checked");
						if (record.businessStat.substr(11, 1) == 1)
							$('#form2 [name=outCardBusiPerm]').attr("checked",
									"checked");

						if (record.busiStat.substr(0, 1) == 1)
							$('#form2 [name=vipCardPerm]').attr("checked",
									"checked");
						if (record.busiStat.substr(1, 1) == 1)
							$('#form2 [name=creditCardPerm]').attr("checked",
									"checked");
						if (record.busiStat.substr(2, 1) == 1)
							$('#form2 [name=distAgencyPerm]').attr("checked",
									"checked");
						if (record.busiStat.substr(3, 1) == 1)
							$('#form2 [name=companyPerm]').attr("checked",
									"checked");
						if (record.busiStat.substr(4, 1) == 1)
							$('#form2 [name=creditBusiPerm]').attr("checked",
									"checked");
						if (record.busiStat.substr(5, 1) == 1)
							$('#form2 [name=moneyBusiPerm]').attr("checked",
									"checked");
						if (record.busiStat.substr(6, 1) == 1)
							$('#form2 [name=electronicBankingPerm]').attr(
									"checked", "checked");
						if (record.busiStat.substr(7, 1) == 1)
							$('#form2 [name=busiEtonPerm]').attr("checked",
									"checked");

						$.ajax({
							url : 'queryMerchantOutTrue.action',
							async : false,
							data : {
								jsonObject : $.toJSON(record)
							},
							success : function(data) {
								$('#merchantOutDetail').refreshWithData(data);
							}
						});
						$.ajax({
							url : 'queryCoreMerChantTids.action?mid='
									+ record.mid,
							async : false,
							data : {
								jsonObject : $.toJSON(record)
							},
							success : function(data) {
								$('#outMerTidDetail').refreshWithData(data);
							}
						});
						$('#downloadOutMerApplyFile').attr('disabled', '');
						$('#merchantDetail').dialog("option", "title", "详细信息");
						$('#merchantDetail').dialog("option", "buttons", {
							'关闭' : function() {
								$('#form2 :input').attr('disabled', '');
								$(this).dialog('close');
							}
						});
						$('#merchantDetail').dialog('open');
					};

					$('#outMerTidDetail').flexigrid({
						url : 'queryCoreMerChantTids.action',
						width : 400,
						checkbox : false,
						usepager : false,
						colModel : [ {
							display : '终端号',
							width : 100,
							dataIndex : 'tid',
							align : 'center'
						}, {
							display : '月流量费(元)',
							width : 100,
							dataIndex : 'monthFlowFee',
							align : 'center'
						}, {
							display : '终端品牌',
							width : 100,
							dataIndex : 'tidBrand',
							align : 'center'
						}, {
							display : '终端类型',
							width : 100,
							dataIndex : 'tidTypeZh',
							align : 'center'
						}, {
							display : '流量费收取方式',
							width : 100,
							dataIndex : 'chargeTypeZh',
							align : 'center'
						}, {
							display : '终端状态',
							width : 100,
							dataIndex : 'statusZh',
							align : 'center'
						}, {
							display : '终端型号',
							width : 100,
							dataIndex : 'tidModel',
							align : 'center'
						}, {
							display : '安装地址',
							width : 100,
							dataIndex : 'address',
							align : 'center'
						}, {
							display : 'SIM卡号',
							width : 100,
							dataIndex : 'reserved1',
							align : 'center'
						} ]
					});

					// 启用、停用申请
					var merchantstatus = function(record, id) {
						if (!record) {
							alert("请选择一条记录");
							return;
						}
						var bussBrhStatus = '';
						$('#form3').fillObject({
							obj : record
						});
						$('#form3 [type=radio]').attr('checked', '');
						$('#result10,#result20').unbind("click");
						$('#result10,#result20').click(function() {
							if (this.checked) {
								bussBrhStatus = this.value;
								if (this.value == "01") {
									if (record.status != '02') {
										alert('只有在停用状态下，才允许提交启用申请！');
										return false;
									}
								} else if (this.value == "02") {
									if (record.status != '01') {
										alert('只有在启用状态下，才允许提交停用申请！');
										return false;
									}
								}
							}
						});

						$('#form3 :input').trigger('blur');
						$('#merchantstatus').dialog("option", "title",
								"启用、停用修改");
						$('#merchantstatus')
								.dialog(
										"option",
										"buttons",
										{
											'修改' : function() {
												if (true) {
													if ($('#result10').attr(
															"checked") == false
															&& $('#result20')
																	.attr(
																			"checked") == false) {
														alert("请选择商户状态");
														return;
													}
													// 封装修改的数据
													record.remark = $(
															'#channgeRemark')
															.val();
													record.status = bussBrhStatus;
													$
															.ajax({
																url : 'doUpdateMerchantVo.action',
																data : {
																	jsonObject : $
																			.toJSON(record)
																},
																success : function(
																		data) {
																	if (data.success) {
																		alert('修改成功');
																		$(
																				'#table')
																				.refresh();
																		$(
																				'#merchantstatus')
																				.dialog(
																						'close');
																	} else {
																		alert('修改失败 失败原因是'
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

						$('#merchantstatus').dialog('open');
					};

					// 删除商户信息
					var deletemerchant = function(record, id) {

						if (!record) {
							alert('请选择一条记录');
							return false;
						}
						var able = confirm('确认删除该商户信息');
						if (able) {
							$.ajax({
								url : 'doDeleteMerchant.action',
								data : {
									jsonObject : $.toJSON(record)
								},
								success : function(data) {
									if (data.success) {
										alert('删除成功');
										$('#table').refresh();
									} else {
										alert('删除失败 失败原因是' + data.syserror);
									}
								}
							});
						}
					};

					$('#table').flexigrid({
						url : 'findAllTask.action',
						buttons : [ 
//						    {
//							name : "新增",
//							 show:'ROLE_MERCHANT_MN_ADD_CZ',
//							bclass : 'page_add',
//							id : 'txt',
//							onpress : newMerRepInfo
//						}, {
//							separator : true
//						}, {
//							name : "编辑修改",
//							show:'ROLE_MERCHANT_MN_EDIT_CZ',  tbl_console_roleres中的btn名
//							bclass : 'page_word',
//							id : 'cel',
//							onpress :editMerRepInfo
//						}, {
//							separator : true
//						}, {
//							name : "详细信息",
//							bclass : 'page_excel',
//							id : 'cel',
//							onpress : view
//						}, {
//							separator : true
//						}, {
//							name : "附件上传",
//							show : 'ROLE_MERCHANT_MN_ATHMNG_CZ',
//							bclass : 'page_word',
//							id : 'txt',
//							onpress : uploadAthBtn
//						},
						],
						
						dir : "desc",
						sort : "orgCode",
						usepager : true,
						colModel : [ {
							display : '操作员名称',
							dataIndex : 'userName',
							align : 'center',
							sortable : true
						}, {
							display : '操作员ID',
							dataIndex : 'loginID',
							align : 'center',
							sortable : true
						}, {
							display : '任务名称',
							dataIndex : 'taskName',
							sortable : true
						}, {
							display : '发送频率',
							dataIndex : 'expression',
							sortable : true
						}, {
							display : '新建时间',
							dataIndex : 'createTime',
							align : 'center',
							sortable : true
						}, {
							display : '修改时间',
							dataIndex : 'updateTime',
							align : 'center',
							sortable : true
						} ]
					});

					$('#merchantOutDetail').flexigrid({
						url : 'queryMerchantOutTrue.action',
						limit : 100,
						width : 400,
						usepager : false,
						colModel : [ {
							display : '外部商户号',
							width : 200,
							dataIndex : 'merOutCode',
							align : 'center'
						}, {
							display : '支付机构名称',
							width : 200,
							dataIndex : 'bankName',
							align : 'center'
						}, {
							display : '支付机构号',
							width : 200,
							dataIndex : 'bankCode',
							align : 'center'
						} ]
					});

					$('#querybutton').click(function() {
						$.queryTable({
							formId : 'queryForm',
							tableId : 'table'
						});
					});

					// 初始化查询;
					$('#querybutton').trigger('click');

				});