var MainFrame = function(_conf) {
	return this.init(_conf);
};
MainFrame.prototype = {
init:function(_conf) {
	var m = {
		 DEFAULT: {MIN_HEIGHT:300,MIN_WIDTH:400}
		,settings:{
			 sid:false
			,indexName:'首页'
			,menuId:'body-menu-list'
			,menuNodeId:'menu-node-text'
//			,menuBoxId:'body-menu-list-content'
			,titleId:'top-info-title'
			,frameBoxId:'body-view'
			,menuNode:false
			,openListId:'open-list'
		}
		,msgStore: new Array()
		,failedTimes: 0
		,current: false
		,__init:function() {
			var $m = $('#' + this.settings.sid);
			$('.jy-ui-row', $m).each(function(_i,_n){
				var _rfh = $(_n).attr('fh')?$(_n).attr('fh'):'auto';
				$(_n).attr('fh',_rfh);
				$('.jy-ui-col', this).each(function(_i0,_n0){
					$(_n0).attr('fh',_rfh);
					if (!$(_n0).attr('fw')){ $(_n0).attr('fw','auto');} 
				});
			}).css({width:'100%'});
			$('.jy-ui-row,.jy-ui-col', $m).each(function(_i,_n){
				var _fh = $(_n).attr('fh');
				var _fw = $(_n).attr('fw');
				if ( _fh != 'auto' ) { $(_n).css({height:_fh + 'px'});}
				if ( _fw != 'auto' ) { $(_n).css({width:_fw + 'px'});}
			});
			this.autosize();
			this.initMenu();
			$('#' + this.settings.openListId).find('#indexpage-li a').click();
			var _this = this;
			$('#'+this.settings.titleId).hover(
					 function(){if(_this.current=='indexpage'){$('ul',this).hide();return;}  if( _this.current ) $('ul',this).show(); }
					,function(){if( _this.current ) $('ul',this).hide();});
		}
		,showFrame:function(_id, _li) {
			$('#'+this.settings.frameBoxId).children().hide();
			$('#'+this.settings.frameBoxId).find('#' + _id).show();
			if ( _li ) { } else {
				_li = $('#' + _id);
			}
			this.current = $(_li).attr('id');
			this.shiftMenu(_li);
			this.showTitle(_li);
		}
		,refreshFrame:function(_id) {
			var _fid = _id?_id:this.current;
			var frame= $('#'+this.settings.frameBoxId).find('#'+_fid+'-iframe');
			frame.attr('src',frame.attr('src'));
		}
		,closeFrame:function(_id){
			var _fid = _id?_id:this.current;
			$('#'+this.settings.frameBoxId).find('#'+_fid).remove();
			if( _fid == this.current){
				var $li = $('#'+_fid+'-li').prev();
				$li.find('a').click();
				var _preId = $li.find('a').attr('href');
				$(_preId).addClass('selected');
				var _preParentid = $(_preId).attr('parentid');
				$('#'+_preParentid).click();
			}
			$('#'+ _fid +'-li').remove();
			$('#'+_fid).removeClass('selected');
		}
		,showTitle:function(_li) {
			$('#'+this.settings.titleId).find('h2').html($(_li).attr('text'));
		}
		,addToOpenlist:function(_li) {
			// add to open list
			var _id = $(_li).attr('id');
			var _this = this;
			var $oli = $('<li id="'+_id+'-li"/>').attr('role',$(_li).attr('id')).append($('<a />').html($(_li).attr('text')).attr('href','#'+_id).click(function(){_this.showFrame(_id,_li);$('#'+ _this.settings.openListId+'-container').hide();$('#body-menu-list div li').removeClass('selected');$('#'+_id).addClass('selected');$('#'+$('#'+_id).attr('parentid')).click();}));
			$oli.append($('<span class="ui-icon ui-icon-close" >close</span>').css({'display':'block','float':'right','marginTop':'6px'}).click(function(){_this.closeFrame(_id);}));
			$('#' + this.settings.openListId).children().removeClass('opened'); 
			$oli.addClass('opened');
			$('#'+ this.settings.openListId).append($oli);
		}
		,shiftMenu:function(_li) {
			// shift menu to open state
			//var oms = new Object();oms.nav = $(menu).attr('nav'); oms.menu = $(menu).attr('id'); oms.id = _id;
			//openmenustore[_id]=oms;
			//mockmenu(oms);
		}
		,openFrame:function(_li) {
			var _id = $(_li).attr('id');
			var $li = $(_li);
			$li.parent().children().removeClass('selected'); $li.addClass('selected');
			var $fb = $('#'+this.settings.frameBoxId);
			var _this = this;
			this.current = $(_li).attr('id');
			
			// locate nav and menu
			if ( $fb.find('#' + _id).length != 0 ) {
				this.showFrame(_id,_li);
			} else {
				$fb.children().hide();
				this.showTitle(_li);
				var $div = $('<div id="'+_id+'"/>');
				var $frame = $('<iframe id="'+_id+'-iframe"/>')
					.attr('src', $li.attr('href'))
					.css({height: $fb.height(), width: $fb.width()})
					.load(function(){ 
						$(this).contents().find("body").height($fb.height()-8);
						document.getElementById($(this).attr('id')).contentWindow.afterload(); 
					});
				$fb.append($div.append($frame));
				// add to openlist
				this.addToOpenlist(_li);
			}
			this.shiftMenu(_li);
		}
		,initMenu:function() {
			var _md = sortByFields(this.settings.menuNode[0].children,'sort');
			var $mn = $('#'+this.settings.menuId); $mn.html('');
			//var _ms = this.menuStore;
			//var $mb = $('#'+this.settings.menuBoxId); $mb.html('');
			var _this = this;
			// index page
		/*	$mn.append($('<li/>').attr({'id':'role-indexpage','text':this.settings.indexName}).html($('<span />').html(this.settings.indexName)));
			$mb.append($('<div />').attr('id','box-role-indexpage').css({'display':'none'}).append($('<ul/>')
					.append($('<li/>').attr({'id':'indexpage','text':this.settings.indexName})
							.append($('<span />').html('&nbsp;').addClass('open-tag'))
							.append($('<span />').html(this.settings.indexName))
							.append($('<span />').html('&nbsp;').addClass('open-tag-tail'))
					)));*/
			
			$mn.append($('<li/>').attr({'id':'role-indexpage','text':this.settings.indexName}).html($('<span />').html(this.settings.indexName)))
			.append($('<div />').attr('id','box-role-indexpage').append($('<ul/>')
					.append($('<li/>').attr({'id':'indexpage','text':this.settings.indexName})
							.append($('<span />').html('&nbsp;').addClass('open-tag'))
							.append($('<span />').html(this.settings.indexName))
							.append($('<span />').html('&nbsp;').addClass('open-tag-tail'))
					)));			//_this.showFrame('indexpage');
			$('#'+ this.settings.openListId).append($('<li id="indexpage-li"/>').append($('<a />').html(this.settings.indexName).click(function(){_this.showFrame('indexpage');_this.showTitle('#indexpage');$('#body-menu-list div li').removeClass('selected');$('#indexpage').addClass('selected');$('#role-indexpage').click();})));
			$('#indexpage').click(function(){_this.showFrame('indexpage');_this.showTitle('#indexpage');$('#body-menu-list div li').removeClass('selected');$(this).addClass('selected');});
			$(_md).each(function(_i,_n){
				var $mnli = $('<li/>').attr(_n).removeAttr('children')
					.append($('<span />').html(_n.text));
				$mn.append($mnli); // _ms[_n.id]=_n;
				var $mbul = $('<ul />');
				_this.loadSMenu(_n.children, $mbul, 1);
				//$mb.append($('<div />').attr('id','box-'+_n.id).css({'display':'none'}).append($mbul));
				$boxdiv =$('<div />').attr('id','box-'+_n.id);
				$mn.append($boxdiv.append($mbul));
			});
			// add click event
		/*	$mn.find('li').click(function(){
				$('#'+_this.settings.menuNodeId).html($(this).attr('text'));
				$mb.children().hide();
				$mb.find('#box-'+$(this).attr('id')).show();
				$mn.hide();
			});
			$('#role-indexpage',$mn).click();*/
		}
		,loadSMenu:function(_ns, _box, _lv) {
			var _smd = sortByFields(_ns,'sort');
			var _this = this;
			$(_smd).each(function(_i,_n){
				var $smnli = $('<li/>').attr(_n).removeAttr('children')
					.append($('<span />').html('&nbsp;').addClass('open-tag'))
					.append($('<span />').html(_n.text))
					.append($('<span />').html('&nbsp;').addClass('open-tag-tail'))
					.click(function(){$('#body-menu-list div li').removeClass('selected');_this.openFrame(this);});
				if ( _n.children && _n.children.length > 0 ) {
					var $sul = $('<ul />');
					_this.loadSMenu(_n.children,$sul,_lv+1);
					$smnli.append($sul);
				}
				_box.append($smnli);
			});
		}
		,autosize:function() {
			var $m = $('#' + this.settings.sid);
			var _bh = document.body.offsetHeight ;
			_bh = (_bh? (_bh < this.DEFAULT.MIN_HEIGHT ?this.DEFAULT.MIN_HEIGHT:_bh ):this.DEFAULT.MIN_HEIGHT) ;
			var _bw = document.body.offsetWidth;
			_bw = (_bw? (_bw < this.DEFAULT.MIN_WIDTH ? this.DEFAULT.MIN_WIDTH:_bw ):this.DEFAULT.MIN_WIDTH) ;
			$m.css({height:_bh,width:_bw,overflow:'hidden',top:'0',left:'0',position:'absolute'});
			var _tth = 0; var _autoHCnt = 0;
			$('.jy-ui-row[fh!="auto"]', $m).each(function(_i,_n){
				_tth += $(_n).height();
			});
			$('.jy-ui-row[fh="auto"]', $m).each(function(_i,_n){
				_autoHCnt ++ ;
			});
			var _top=0,_left=0;
			var _autoHeight = (_bh - _tth) / _autoHCnt ; // alert(_bh+ ':'+_tth+':'+_autoHCnt);
			$('.jy-ui-row',$m).each(function(_i,_n){
				var _ttw = 0; var _autoCnt = 0;
				$('.jy-ui-col[fw!="auto"]', $(_n)).each(function(_i0,_n0){
					_ttw += $(_n0).width();
				});
				$('.jy-ui-col[fw="auto"]', $(_n)).each(function(_i0,_n0){
					_autoCnt ++ ;
				});
				var _autoWidth = (_bw - _ttw) / _autoCnt ; // alert(_bw+ ':'+_ttw+':'+_autoCnt);
				var _height = $(_n).attr('fh')=='auto'?_autoHeight:$(_n).height();
				$('.jy-ui-col', $(_n)).each(function(_i0,_n0){
					var _width = $(_n0).attr('fw')=='auto'?_autoWidth:$(_n0).width();
					$(_n0).css({position:'absolute',top:_top+'px',left:_left+'px',width:_width+'px',height:_height+'px'});
					_left += _width ; 
				});
				_left = 0;
				_top += _height;
			});
			$('.jy-ui-fixheight').each(function(_i,_n){
				var _ph = $(_n).parent().height();
				var _tth = 0;
				$(_n).parent().children(':visible').not($(_n)).each(function(_i0,_n0){
					_tth += $(_n0).height();
				});
				$(_n).css({height:(_ph-_tth)+'px'});
			});
			$('.jy-ui-fixwidth').each(function(_i,_n){
				var _pw = $(_n).parent().width();
				var _ttw = 0;
				$(_n).parent().children(':visible').not($(_n)).each(function(_i0,_n0){
					_ttw += $(_n0).width();
				});
				$(_n).css({width:(_pw-_ttw)+'px'});
			});
			var _this = this;
			$('.jy-ui-framebox').each(function(_i,_n){
//				var _pw = $('#' + _this.settings.frameBoxId).width();
//				var _ph = $('#' + _this.settings.frameBoxId).height();
//				$(this).children().css({height:_ph,width:_pw,overflow:'hidden'});
//				$(this).find('iframe').css({height:_ph,width:_pw,overflow:'hidden'});
//				$(this).find('iframe').each(function(){$(this).contents().find("body").height(_ph-8);});
			});
		}
	};
	$.extend(m.settings, _conf);
	m.__init();
	return m;
}
};