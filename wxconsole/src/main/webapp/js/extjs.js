//Ext.onReady(function(){
//var proxy=new Ext.data.HttpProxy({url:"findDemoWithPageInfo.action"});
//var demobean=Ext.data.Record.create([                                 
//                                 {name:"loginNm",type:"string",mapping:"loginNm"}
//                                 ]);
//var reader=new Ext.data.JsonReader({totalProperty:"totalProperty",root:"root"},demobean);
//var  demo=new Ext.data.Store({
//	proxy:proxy,
//	reader:reader
//});
//demo.load({params:{start:0,limit:6,sort:"loginNm",dir:"desc"}});
//var cm=new Ext.grid.ColumnModel([
//                             
//                                 {header:'登陆名',width:80,dataIndex:'loginNm',tooltip:"ID",sortable:true},
//                                 ]);
//var grid=new Ext.grid.GridPanel({
//		title:"用户列表",
//		width:650,
//		heigth:300,
//		cm:cm,
//		store:demo,
//		renderTo:"a",		
//		bbar:
//	        new Ext.PagingToolbar({
//	        	store:demo,
//	        	pageSize:1,
//	        	displayInfo:true,
//	        	displayMsg:"本页显示第{0}条到第{1}条的记录,一共{2}条",
//	        	emptyMsg:"没有记录"
//	        })	
//})
//
//})





function change(value,metadata,record,rowIndex,collIndex,store){
	return "<span style='margin-right:10px'><a href='#'>修改</a></span><span style='margin-right:10px'><a href='#' onclick='alert(rowIndex)'>删除</a></span>"
}

function formatTime(val){
	return Ext.util.Format.date(val);
}

Ext.onReady(function(){
	Ext.QuickTips.init();
	
	var sm = new Ext.grid.CheckboxSelectionModel(
			//单击grid上某行，让它前面的checkbox不跟着选中
			//{singleSelect:true,handleMouseDown:Ext.emptyFn}
			);
	var cm = new Ext.grid.ColumnModel([
        sm,
		{header:'登陆名',width:80,dataIndex:'loginNm',tooltip:"loginNm",sortable:true},
		{header:'员工ID',width:80,dataIndex:'oprId',tooltip:"员工ID"},
		{header:'员工姓名',width:80,dataIndex:'opName',align:'center'},
		{header:'密码',width:80,dataIndex:'password'},	
		{header:'操作',width:150,dataIndex:'',menuDisabled:true,renderer:function(value,metadata,record,rowIndex,collIndex,store){
			   return "<a href='#'>操作</a>";
		}}
	
	])
		
	var proxy = new Ext.data.HttpProxy({
		url:'findDemoWithPageInfo.action'
	});
	
	var Human = Ext.data.Record.create([
		{name:'loginNm',type:'string',mapping:'loginNm'},
		{name:'oprId',type:'string',mapping:'oprId'},
		{name:'opName',type:'string',mapping:'opName'},
		{name:'password',type:'string',mapping:'password'},
	])
	
	var reader = new Ext.data.JsonReader({
		totalProperty:'totalProperty',
		root:'root'
	},Human);
	
	var store = new Ext.data.Store({
		proxy:proxy,
		reader:reader
	})
	
	store.load({
		params:{start:0,limit:10,sort:"loginNm",dir:"desc"}
	});
	
	var grid = new Ext.grid.GridPanel({
		title:'中国公民',
		width:400,
		cm:cm,
		sm:sm,
		viewConfig:{
			forceFit:true,
			enableRowBody:true,
			showPreview:true
		},
		store:store,
		bbar:
		new Ext.PagingToolbar({
			store:store,
			pageSize:10,
			displayInfo:true,
			displayMsg:'第{0}条到第{1}条记录，一共{2}条',
			emptyMsg:'没有记录'
		}),
		tbar:[
		{
			text:'增加',
			handler:doAdd
		},'-',{
			text:'详细信息',
			handler:function(){
				var rsm = grid.getSelectionModel();
				if(rsm.getSelections().length==0){
					Ext.Msg.alert('警告','请选择要查看的条目');
					return;
				}
				var record = rsm.getSelected();
				f.getForm().loadRecord(record);
				win.show();
			}
		},'-',{
			text:'删除选定行',
			handler:doDel
		}
		],
	})
	
	Ext.form.Field.prototype.msgTarget='under';//统一指定错误消息提示方式
	Ext.form.Field.prototype.validationEvent='blur';//统一指定验证的触发事件
	
	var f = new Ext.form.FormPanel({
		items:[
		{id:'id',xtype:'hidden',width: 50,fieldLabel: 'Id',name: 'id'},
		{id:'name',xtype:'textfield',width: 150,fieldLabel: '姓名',name: 'name',allowBlank:false,blankText:'姓名不允许为空'},
		{id:'sex',xtype:'textfield',width: 150,fieldLabel: '性别',name: 'sex',allowBlank:false,blankText:'性别不允许为空'},
		{id:'birthday',xtype:'datefield',editable:false,width: 150,fieldLabel: '生日',format:'Y-m-d',name: 'birthday',allowBlank:false,blankText:'生日不允许为空'},
		{id:'memo',xtype:'textarea',width: 150,fieldLabel: '备注',name: 'memo',allowBlank:false,blankText:'备注不允许为空'}
		],
		autoHeight:true,
		frame:true,
		labelAlign:'right',
		buttonAlign:'center',
		buttons:[
	    {
	        iconCls:'option',
	        text:'提交',
	        handler:submitForm
	        
	    },{
			text:'重置',
			handler:function(){
				f.getForm().reset();
			}
		},{
		    text:'关闭',
		    iconCls:'remove',
		    handler:function(){
		    win.hide();
	    	}
	    }
    ]
	});
	
	    //提交添加或是修改的信息
	    function submitForm(){
	         //判断是添加还是修改
	    	if(!f.getForm().isValid()){
	    		Ext.Msg.alert('警告','表单中存在非法数据');
	    		return;
	    	}
	    	var jsonObject = new Human();
		    f.getForm().updateRecord(jsonObject);
		    if(f.isAdd){//添加
		      f.form.submit({//提交数据的方法
			       clientValidation:true,
			       waitMsg:'正在提交数据请稍候...',
			       waitTitle:'提示',
			       url:'PageServlet?action=add',
			       method:'post',
			       params:{jsonObject:Ext.encode(jsonObject.data)},
			       success:function(form,action){
			       	   f.isAdd = false;
				       win.hide();
				       Ext.Msg.alert("提示","添加成功");
				       store.reload();
			       },	  
			       failure:function(form,action){"提示",Ext.Msg.alert("添加失败");}  
		       });
		    }else{
		           f.form.submit({//提交数据的方法
			       clientValidation:true,
			       waitMsg:'正在提交数据请稍候...',
			       waitTitle:'提示',
			       params:{jsonObject:Ext.encode(jsonObject.data)},
			       url:"PageServlet?action=edit",
			       method:'post',
			       success:function(form,action){
				       win.hide();
				       Ext.Msg.alert("提示","编辑成功");
				       store.reload();
			       },	  
			       failure:function(form,action){"提示",Ext.Msg.alert("编辑失败");}  
		       });   
		    }
	    }
	
	var win = new Ext.Window({
		items:[
			f
		],
		title: "操作",
		width: 400,
		autoHeight: true,
		closeAction:'hide'
	});
	
	//修改或是删除时获取所选的id
	function getId(){
		var vd = grid.getSelectionModel().getSelections();
		var list = [];
		if(vd.length==0){
		 	Ext.Msg.alert("提示","请选择要操作的项");
		}else{
			for(var i=0;i<vd.length;i++){
		       var rec = vd[i];
		       list.push(rec.get('id'));
		     }
		   }
		    return list;
	 }
	 
	 function doDel(){
	     var listid = getId();//获取 选中的id集合
	     if(listid.length==0){
	       Ext.Msg.alert("提示","请选择要删除的项");     
	     }else{
	       Ext.Msg.confirm("提示","确定要删除此条数据吗?",function(btn){
	       if(btn=='yes'){
	         del(listid);
	       }
	        });
	     }
    }
    
    function doAdd(){
    	f.getForm().reset();
    	f.isAdd = true;
    	win.show();
    }
	
	function del(listid){
	    var msgTip = Ext.MessageBox.show({
	    title:'提示',
	    width:250,
	    msg:'正在删除数据请稍候...'
	    });
	    Ext.Ajax.request({
	    url:'PageServlet',	    
	    method:'post',
	  	params:{action:'del',listid:listid},
	    success:function(response,options){
	    msgTip.hide();
	    var result = Ext.util.JSON.decode(response.responseText);
	    if(result.success){
	    /*	
	    for(var i=0;i<listid.length;i++){//页面上删除数据
	      var index = store.find('id',listid[i]);
						if(index != -1){
							var rec = store.getAt(index)
							store.remove(rec);
						}		
	    }*/
	      store.reload();
	      Ext.Msg.alert('提示','删除信息成功。');
	    }else{
	      Ext.Msg.alert('提示','删除信息失败。');
	    }
	    },
	    failure:function(){
	        msgTip.hide();
			Ext.Msg.alert('提示','删除失败！');
	    }
	    });
    }
    
    new Ext.Viewport({
          enableTabScroll: true,
          layout: "fit",
          items: [grid]
        });
    
    function removeFormStore(){
		var view = grid.getView();
		var rsm = grid.getSelectionModel().getSelections();
		var store = grid.getStore();
		for(var i=0;i<rsm.length;i++){
			store.remove(rsm[i]);
			}
			view.refresh();
		}
		
	function addFormStore(){
		var obj = {
		name:'新人物',
		sex:'女',
		birthday:'1980-09-21',
		memo:'新来的'
		}
		var human = new Human(obj);
		grid.getStore().insert(0,human);
		grid.getView().refresh();
		//grid.getStore().add(human); 
		//增加到grid行尾
		}
		
		//根据id加载信息
	   function loadForm(id){
	           vform.form.load({
	           waitMsg:'正在加载数据请稍候...',
	           waitTitle:'提示',
	           url:'PageServlet?action=load',
	           success:function(){
	           		Ext.Msg.alert("提示","加载编辑信息成功");
	           },
	          		failure:function(){Ext.Msg.alert("提示","加载编辑信息失败");}
	           });
	    }
})