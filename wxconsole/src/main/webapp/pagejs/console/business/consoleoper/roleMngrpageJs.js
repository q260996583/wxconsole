/**
 * @author Kanyong
 */

;
$()
		.ready(
				function() {
					$.formValidator.initConfig({
						onerror : function(msg,obj) {
							alert(msg);
							$(obj).focus();
						}
					});
					

					$("#roleName").formValidator({
						empty : false,
						onshow : "请输入角色名",
						oncorrect : "输入合法",
						onfocus : "请输入角色名"
					}).inputValidator({
						min : 1,
						max : 64,
						onerror : "角色名长度1-64个英文字符"
					});
					$("#org_code").formValidator({
						empty : false,
						onshow : "请选择机构",
						oncorrect : "输入合法",
						onfocus : "请选择机构"
					}).inputValidator({
						min : 1,
						max : 15,
						onerror : "请选择角色所在机构"
					});

					$('#roleDetail_div').dialog({
						autoOpen : false,
						bgiframe : true,
						modal : true,
						resizable : false,
						draggable : false,
						width : 800,
						height : 500
					});
					
			var edit=	function(record,id) {				
				if (!record) {
					alert("请选择一条记录");
					return;
				}
		    $('#form1 :input').attr('disabled','');		
			var urlStr= 'findResourceTreeWithChecked.action?jsonObject='+$.toJSON(record);
			$('#resourceTree').jsTree({url:urlStr,theme_name:'checkbox'});
			$('#form1').fillObject({obj:record});
				$('#roleDetail_div').dialog(
						"option",
						"title",
						"编辑角色信息");
					$('#formreset')
						.click();
				$('#roleDetail_div')
						.dialog("option","buttons",	{
									'更新': function(){										
										if ($.formValidator.pageIsValid('1')) {												
											var selectRes="";
											$('#resourceTree a.undetermined,#resourceTree a.checked').each(function(i){
												selectRes=selectRes+$(this).parent().attr('id')+",";
											});	
											if(selectRes==""){
												alert("资源不能为空");
												return;												
											}
											$.ajaxForm({formId : 'form1',
														url : 'doUpdateRole.action',
														dealData:function(data){																								
															data.resourcesStr=selectRes;
														},									
														success : function(data) {
															if (data.success) {
																$('#roleDetail_div').dialog('close');
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
									}	,
									'关闭' : function() {$(this).dialog('close');}
								});
				$('#roleDetail_div').dialog('open');			
						
			};
			
			var add=function() {
				$('#form1').fillObject({obj:null});
				$('#form1 :input').attr('disabled','');
				$('#role_id').val("<由系统自动生成>").attr('style','font-style:italic').attr('disabled','disabled');				
				var urlStr= 'findResourceTree.action';
				$('#resourceTree').jsTree({url:urlStr,theme_name:'checkbox'});				
				$('#roleDetail_div').dialog("option","title","新增角色");
				$('#roleDetail_div').dialog("option","buttons",	{'确定' : function() {
										if ($.formValidator.pageIsValid('1')) {
											var selectRes="";
											$('#resourceTree a.undetermined,#resourceTree a.checked').each(function(i){
												selectRes=selectRes+$(this).parent().attr('id')+",";
											});		
											if(selectRes==""){
												alert("资源不能为空");
												return;												
											}
											$.ajaxForm({
														formId : 'form1',
														url : "doInsertRole.action",
														dealData : function(data) {																							
															data.resourcesStr=selectRes;
														},
														success : function(data) {
															if (data.success) {
																$('#roleDetail_div').dialog('close');
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
				$('#roleDetail_div').dialog('open');
			}
			
			
			var  view=function(record,id) {
				if (!record) {
					alert("请选择一条记录");
					return;
				}
				$('#form1').fillObject({obj:record});
				$('#form1 :input').attr('disabled','disabled');
				var urlStr= 'findResourceTreeWithChecked.action?jsonObject='+$.toJSON(record);
				$('#resourceTree').jsTree({url:urlStr,theme_name:'checkbox',onchange:function(){}});
				$('#roleDetail_div').dialog("option","title","详细信息");
				$('#roleDetail_div').dialog("option","buttons",{'关闭' : function() {
					$('#form1 :input').attr('disabled','');
					$(this).dialog('close');
					}
					});
				$('#roleDetail_div').dialog('open');
			}
			
			
			var del= function(record,id) {
				if (!record) {
					alert("请选择一条记录");
					return;
				}

				var cf = confirm("确认要删除该操作员吗？");
				if (!cf) {
					return;
				}
				var obj = new Object();
				obj.roleId = record.roleId;
				$.ajax({type : 'POST',
							url : 'delRole.action',
							data : {jsonObject : $.toJSON(obj)},
							success : function(	data) {
								if (data.success) {
									alert('操作成功');
									$('#queryBtn').click();
								} else {
									alert('操作失败 原因是'+ data.syserr);
								}
							}
						});
			}
			
			
			
			
			
			
			
			

					$('#table').flexigrid(	{
										url : 'findPageRole.action',
										buttons : [
												{
													name : "新增角色",
													show : 'ROLE_USER_ROLE_ADD_CZ',
													bclass : 'page_add',
													id : 'txt',
													onpress : add
												},
												{
													separator : true
												},
												{
													name : "编辑角色",
													show : 'ROLE_USER_ROLE_EDIT_CZ',
													bclass : 'page_word',
													id : 'cel',
													onpress : edit
												},
												{
													separator : true
												},
												{
													name : "详细信息",
													bclass : 'page_excel',
													id : 'cel',
													onpress : view
												},
												{
													separator : true
												},
												{
													name : "删除",
													show : 'ROLE_USER_ROLE_DEL_CZ',
													bclass : 'page_delete',
													id : 'txt',
													onpress :del
												} ],
										width : 400,
										sort : "roleId",
									
										checkbox : false,
										usepager : true,
										colModel : [
												{
													display : '角色ID',
													width : 100,
													dataIndex : 'roleId',
													align : 'center'
												},
												{
													display : '角色名',
													width : 250,
													dataIndex : 'roleName',
													align : 'center'
												},
												{
													display : '隶属机构',
													width : 340,
													dataIndex : 'org_name',
													align : 'center'
												},{
													display : '角色描述',
													dataIndex : 'role_desc',
													align : 'center'
												},
												{
													display : '角色状态',
													width : 90,
													dataIndex : 'flag',
													render : function(record,
															value) {
														return value == 0 ? '启用'
																: (value == 1 ? '失效'
																		: '异常');
													},
													align : 'center'
												} ]
									});

					$('#queryBtn').click(function() {
						$.queryTable({
							formId : 'queryForm',
							tableId : 'table'
						});
					});

				});

$().ready(function() {
	$('#queryBtn').click();
});

$().ready(function() {
	$('#supOrgCodeSelect').queryDialog({
		width : 600,
		height : 400,
		flexigrid : {
			url : 'findSysOrg.action',
			width : 500,
			dir : "orgCode",
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
});