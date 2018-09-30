$(document).ready(
				function() {
					$('#infoDtlQuery').dialog({
					    title:"操作员日志",
						autoOpen : false,
						bgiframe : true,
						modal : true,
						resizable : false,
						draggable : false,
						width : 700,
						height : 400
					});
					   $('#table').flexigrid({
							url : 'findOperLog.action',
						   sort : "oprNo",
							usepager : true,
							colModel : [{
								display : '序号',
								dataIndex : 'oprNo',
								align : 'center',
								sortable:true
								
							},{
								display : '操作时间',
								dataIndex : 'oprTime',
								align : 'center',
								sortable:true
								
							},{
								display : '操作员登录名',
								dataIndex : 'oprLoginId',
								align : 'center'
							},{
								display : '操作员姓名',
								dataIndex : 'oprNm',
								align : 'center'
							},{
								display : '操作名称',
								dataIndex : 'resourceZh', 
								align : 'center',
								sortable:true
							},{
								display : '操作所在IP',
								dataIndex : 'oprIp',
								align : 'center'
							},{
								display : '操作状态',
								dataIndex : 'oprSuccess',
								align : 'center',
								decode:{'00':"成功",'01':"失败"}
							}]
						});
					
					   
					$('#querybutton').click(function() {
							$.queryTable({
								formId : 'queryForm',
								tableId : 'table'
							});
					});	
					$('#querybutton').trigger('click');							
					
				});