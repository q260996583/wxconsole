Ext.ns("Mngr");
Mngr.MainFrame = function() {
};
Mngr.MainFrame.prototype = {
	webTitle : "首页",
	promptConnectFailure : "网络异常，请重新登陆!",
	tabs0Title : "登陆信息",
	emptyMenuTitle : "菜单项",
	mainExit : "注销",
	Prompt : "提示",
	storeTotalProperty : "totalProperty",
	storeRoot : "root",
	prompt_connection : null,
	prompyTimes : 0,
	promptConnUrl : null,
	menudata : null,
	tabs : null,
	tabs0Url : "#",
	IFrameComponent : null,
	leftTreeContainer : null,
	head : null,
	tool_bar : null,
	content : null,
	head_title : "",
	exitUrl : "#",
	leftTreeWidth : 200,
	readedMsg: new Array(),
	setMenudata : function(a) {
		if (a) {
			this.menudata = a;
		}
	},
	setPromptConnUrl : function(a) {
		if (a) {
			this.promptConnUrl = a;
		}
	},
	setExitUrl : function(a) {
		if (a) {
			this.exitUrl = a;
		}
	},
	setTabs0Url : function(a) {
		if (a) {
			this.tabs0Url = a;
		}
	},
	constructIFrameComponent : function() {
		this.IFrameComponent = Ext.extend(Ext.BoxComponent, {
			onRender : function(b, a) {
				this.el = b.createChild({
					tag : "iframe",
					id : "iframe-" + this.id,
					frameBorder : 0,
					src : this.url
				});
			}
		});
	},
	addTabs : function(f, g, a, e) {
		var c = f;
		var d = e.findById(c);
		if (d) {
			e.activate(c);
			return;
		}
		var b = new this.IFrameComponent({
			id : c,
			url : a
		});
		e.add({
			id : c,
			title : g,
			layout : "fit",
			frame : true,
			items : [ b ],
			closable : true
		}).show();
	},
	ClickEvent : function(c, e, b, a, d) {
		if (b && a) {
			this.addTabs(c, e, a, d);
		}
	},
	constructTree : function(c, b, e, d) {
		var a = new Ext.tree.TreePanel({
			id : b,
			autoWidth : true,
			border : false,
			useArrows : false,
			autoScroll : true,
			animate : true,
			lines : true,
			rootVisible : false,
			containerScroll : true,
			loader : new Ext.tree.TreeLoader({
				preloadChildren : true,
				clearOnLoad : false
			}),
			root : new Ext.tree.AsyncTreeNode({
				text : "system",
				id : "root",
				expanded : true,
				children : e
			}),
			collapseFirst : false
		});
		new Ext.tree.TreeSorter(a, {
			folderSort : true,
			property : "sort"
		});
		return a;
	},
	constructTabs : function() {
		var a = new this.IFrameComponent({
			id : "-2",
			url : this.tabs0Url
		});
		this.tabs = new Ext.TabPanel({
			enableTabScroll : true,
			region : "center",
			activeTab : 0,
			defaults : {
				autoScroll : true
			},
			plugins : new UX.tabs.TabCloseMenu(),
			items : [ {
				title : this.tabs0Title,
				id : "-2",
				layout : "fit",
				frame : true,
				items : [ a ],
				closable : false
			} ]
		});
	},
	constructLeftTreeContainer : function() {
		this.leftTreeContainer = new Ext.Panel({
			id : "tree_menu",
			region : "west",
			split : true,
			collapsible : true,
			collapsed : true,
			collapseFirst : false,
			width : this.leftTreeWidth,
			layout : "card",
			layoutConfig : {
				animate : true
			},
			activeItem : 0
		});
	},
	constructContent : function() {
		this.constructIFrameComponent();
		this.constructTabs();
		this.constructLeftTreeContainer();
		this.tool_bar = new Ext.Toolbar({
			id : "tool-bar",
			height : 30
		});
		this.content = new Ext.Panel({
			title : this.head_title,
			tbar : this.tool_bar,
			region : "center",
			layout : "border",
			items : [ this.tabs, this.leftTreeContainer ]
		});
	},
	constructViewport : function() {
		new Ext.Viewport({
			enableTabScroll : true,
			layout : "border",
			items : [ this.content ]
		});
	},
	afterConstruct : function() {
		this.menudata = this.menudata[0].children;
		var e = this.menudata;
		var f = 0;
		var a = new Array();
		for ( var d = 0; d < e.length; d++) {
			if (f == 0) {
				a.push(e[d].sort);
				f++;
			} else {
				for ( var c = 0; c <= f; c++) {
					if (e[d].sort <= a[c] || c == f) {
						a.splice(c, 0, e[d].sort);
						f++;
						break;
					}
				}
			}
		}
		for ( var b = 0; b < a.length; b++) {
			for ( var c = 0; c < this.menudata.length; c++) {
				if (a[b] == this.menudata[c].sort) {
					this.tool_bar.add({
						id : "click_" + c,
						text : this.menudata[c].text,
						totalnode : this.menudata[c],
						handler : function(g, i) {
							this.leftTreeContainer.setTitle(g.totalnode.text);
							var h = this.constructTree(this.leftTreeContainer,
									g.totalnode.id, g.totalnode.children,
									g.totalnode.text);
							h.on("click", function(j, k) {
								k.stopEvent();
								this.ClickEvent(j.id, j.text, j.isLeaf(),
										j.attributes.href, this.tabs);
							}.createDelegate(this));
							this.leftTreeContainer.add(h);
							this.leftTreeContainer.getLayout().setActiveItem(
									g.totalnode.id);
							this.leftTreeContainer.expand(true);
						}.createDelegate(this)
					});
					this.tool_bar.add("-");
					break;
				}
			}
		}
		this.tool_bar.add( "->"
			, { id:'msgtip', text: '用户消息', iconCls: 'user-msg', 
				handler: function() { this.addTabs('role_sysconf_msgbox','消息收件箱', 'recvMsgSetup.action', this.tabs);}.createDelegate(this) }
			, new Ext.Action({ text : this.mainExit, iconCls : 'user-down',
				handler: function() { window.location.href = this.exitUrl; }.createDelegate(this)})
		);
	},
	promptConnState : function() {
		this.prompt_connection = {
			run : function() {
				Ext.Ajax.request({
					url : this.promptConnUrl,
					success : function(a, b) {
						var d = Ext.util.JSON.decode(a.responseText);
						//var c = d[this.storeRoot];
						if (d.success) {
							//
							var msg = '';
							Ext.each(d.root, function(n){
								if ( n &&  n.msgTitle ) {
									var id = this.readedMsg.indexOf(n.msgId);
									if ( id < 0 ) {
										Mngr.MsgTip.msg(n.msgTitle, this.fmtTime(n.sendTime)+' by '+n.sendAcct, true);
										this.readedMsg.push(n.msgId);
									}
									//msg += '<h3>' + n.msgTitle + '</h3>' + this.fmtTime(n.sendTime) + ' by ' + n.sendAcct + '<br /> ---------------';
								}
							}.createDelegate(this));
							var _msgtip = this.tool_bar.findById('msgtip');
							_msgtip.setText(d.totalProperty + ' 条未读消息');
							// _msgtip.setTooltip(msg);
							this.prompyTimes = 0;
						} else {
							if (this.prompyTimes == 2) {
								this.prompyTimes = 0;
								Ext.MessageBox.alert(this.prompt,
										this.promptConnectFailure);
							} else {
								this.prompyTimes++;
							}
						}
					}.createDelegate(this),
					failure : function(a, b) {
						if (this.prompyTimes == 2) {
							this.prompyTimes = 0;
							Ext.MessageBox.alert(this.prompt,
									this.promptConnectFailure);
						} else {
							this.prompyTimes++;
						}
					}.createDelegate(this)
				});
			}.createDelegate(this),
			interval : 1000 * 60 * 2
		};
		if (this.promptConnUrl) {
			Ext.TaskMgr.start(this.prompt_connection);
		}
	},
	fmtTime: function(v) {
		if ( v ) {
			return v.substr(0,4) + '-' + v.substr(4,2) + '-' + v.substr(6,2) + ' ' + v.substr(8,2) + ':' + v.substr(10,2) + ':' + v.substr(12,2);
		}
		return '--';
	},
	createSelf : function() {
		Ext.QuickTips.init();
		this.promptConnState();
		this.constructContent();
		this.constructViewport();
		this.afterConstruct();
	}
};
/**
 * Extjs消息提示框
 * MsgTip.msg('消息标题', '消息内容');//不自动隐藏
 * MsgTip.msg('消息标题', '消息内容',true);//默认5秒后自动隐藏
 * MsgTip.msg('消息标题', '消息内容',true,10);//10秒后自动隐藏
 */
Mngr.MsgTip = function(){
    var msgCt;
    function createBox(t, s){
        return ['<div class="msg">',
                '<div class="x-box-tl"><div class="x-box-tr"><div class="x-box-tc"></div></div></div>',
                '<div class="x-box-ml"><div class="x-box-mr"><div class="x-box-mc" style="font-size=12px;"><h3>', t, '</h3>', s, '</div></div></div>',
                '<div class="x-box-bl"><div class="x-box-br"><div class="x-box-bc"></div></div></div>',
                '</div>'].join('');
    }
    return {
        msg : function(title, message,autoHide,pauseTime){
            if(!msgCt){
                msgCt = Ext.DomHelper.insertFirst(document.body, {id:'msg-div22',style:'position:absolute;top:10px;width:300px;margin:0 auto;z-index:20000;'}, true);
            }
            msgCt.alignTo(document, 't-t');
            //给消息框右下角增加一个关闭按钮
            message+='<br><span style="text-align:right;font-size:12px; width:100%;">' +
              '<font color="blank"><u style="cursor:hand;" onclick="Mngr.MsgTip.hide(this);">关闭</u></font></span>';
            var m = Ext.DomHelper.append(msgCt, {html:createBox(title, message)}, true);
            m.slideIn('t');
            if(!Ext.isEmpty(autoHide)&&autoHide==true){
             if(Ext.isEmpty(pauseTime)){
              pauseTime=5;
             }
             m.pause(pauseTime).ghost("tr", {remove:true});
            }
        },
        hide:function(v){
         var msg=Ext.get(v.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement);
         msg.ghost("tr", {remove:true});
        }
    };
}();