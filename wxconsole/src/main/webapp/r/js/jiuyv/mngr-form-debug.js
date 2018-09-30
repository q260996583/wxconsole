jQuery.jyform = {
getRootPath: function (){
    //获取当前网址，如： http://localhost:8083/proj/meun.jsp
    var curWwwPath = window.document.location.href;
    //获取主机地址之后的目录，如： proj/meun.jsp
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPath = curWwwPath.substring(0, pos);
    //获取带"/"的项目名，如：/proj
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/')+1);
    return(localhostPath + projectName);
},
dateBox:function(options){
	var select = options.select;
	if ( select.hasClass('hasDatepicker')) { return ; }
	var dtid = select.attr('id') + '-display';
	var show = $('<input id="'+ dtid +'" type="text"/>');
	select.parent().prepend(show);
	select.datepicker($.extend({
		showWeek:false,
		firstDay:1,
		showOn:"button",
		buttonImage:"r/img/icon/calendar.png",
		buttonImageOnly: true,
		onSelect:function(){$(this).blur();},
		minDate:new Date(1900,0,1),
		maxDate:new Date(3000,11,31),
		changeMonth: true,
	    changeYear: true,
		dateFormat: 'yymmdd',
		altField: '#'+dtid, 
		altFormat:'yy-mm-dd'
	}, options));
	show.detach();
	show.insertAfter(select);
	select.css({'width':'0px',border:'0','color':'#fff'});
	show.css({'width':'115px','marginRight':'3px'});
	select.attr('readOnly','true').attr('disabled','true');
	show.attr('readOnly','true');
	if ( typeof(options.enabled)=='undefined' || options.enabled ) {
		show.click(function(){ select.datepicker('show');});
	} else {
		$(show).next().hide();
	}
}
,dateTimeBox:function(options){
	var select = options.select;
	if ( select.hasClass('hasDatepicker')) { return ; }
	var dtid = select.attr('id') + '-display';
	var show = $('<input id="'+ dtid +'" type="text"/>');
	select.parent().prepend(show);
	select.datetimepicker($.extend({
		showWeek:false,
		firstDay:1,
		showOn:"button",
		buttonImage:"r/img/icon/calendar.png",
		buttonImageOnly: true,
		onSelect:function(){$(this).blur();},
		minDate:new Date(1900,0,1),
		maxDate:new Date(3000,11,31), 
		dateFormat: 'yymmdd',
		timeFormat: "HHmmss",
		changeMonth: true,
	    changeYear: true,
		pickerTimeFormat: 'HH:mm:ss',
		altField: '#'+dtid, 
		altFormat:'yy-mm-dd',
		altSeparator: ' ',
		altFieldTimeOnly: false,
		altTimeFormat: 'HH:mm:ss',
		stepMinute: 10,
		stepSecond: 10,
		separator:''
	}, options));
	show.detach();
	show.insertAfter(select);
	select.css({'width':'0px',border:'0','color':'#fff'});
	show.css({'width':'115px','marginRight':'3px'});
	select.attr('readOnly','true').attr('disabled','true');
	show.attr('readOnly','true');
	if ( typeof(options.enabled)=='undefined' || options.enabled ) {
		show.click(function(){ select.datepicker('show');});
	} else {
		$(show).next().hide();
	}
}
,dataSelectBox:function(options, res) {
	if ( res && res.length > 0 ) {
		var src_opts = options.emptyOpt?"<option value=''></option>":"";
		var store_data = new Array();
		for ( var cnt in res) {
			var src = res[cnt];
			var sval = src[options.valueField];
			var sopt = src[options.displayField];
			if ( typeof sval == 'undefined' || typeof sopt == 'undefined' ) {
				continue;
			}
			// console.log('val:' + sval + '[' + typeof sval + '],opt:' + sopt + '[' + typeof sval+']');
			if ( options.render ) {
				sopt = options.render(src);
			}
			if ( options.val) {
				if ( isArray(options.val)) {
					var checked = false;
					for(var _i in options.val) {
						if ( options.val[_i] == sval ) {
							src_opts += "<option value='"+sval+"' selected='selected'>"+ sopt +"</option>";
							checked = true;
							break;
						}
					}
					if ( !checked ) {
						src_opts += "<option value='"+sval+"' >"+ sopt +"</option>";
					}
				} else if (options.val == sval) {
					src_opts += "<option value='"+sval+"' selected='selected'>"+ sopt +"</option>";
				} else {
					src_opts += "<option value='"+sval+"' >"+ sopt +"</option>";
				}
			} else {
				src_opts += "<option value='"+sval+"' >"+ sopt +"</option>";
			}
			store_data[sval] =  src;
		}
		if ($.isArray(options.selectId)) {
			$(options.selectId).each(function(i,n){
				$('#' + n).html(src_opts);
			});
		} else {
			$("#" + options.selectId ).append(src_opts);
		}
		if ( options.select) {
			$(options.select).append(src_opts);
		}
		if ( options.store ) {
			options.store[options.selectId] = store_data;
		}
		if ( options.func ) {
			options.func(res);
		}
	} else if(typeof (res)=="object"){
		var src_opts = options.emptyOpt?"<option value=''></option>":"";
		var store_data = new Array();
		var src = res;
		var sval = src[options.valueField];
		var sopt = src[options.displayField];
		if ( options.render ) {
			sopt = options.render(src);
		}
		if (typeof sval != "undefined"
				&& typeof sopt!= "undefined"){
			src_opts += "<option value='"+sval+"' >"+ sopt +"</option>";
			store_data[sval] =  src;
		}
		$("#" + options.selectId ).append(src_opts);
		if ( options.store ) {
			options.store[options.selectId] = store_data;
		}
		if ( options.func ) {
			options.func(res);
		}
	}else {
		if ( console ) console.log(options.failedMsg?options.failedMsg:'获取信息失败！');
		// alert(options.failedMsg?options.failedMsg:'获取信息失败！');
	}	
}
,ajaxSelectBox:function(options){ // 
	jQuery.jyajax.ajaxRequest(options.url, '', function(res){
		$.jyform.dataSelectBox(options, res);
	});
}
//用户下拉列表
,sysuserBox:function(options) {
	var opt = $.extend({
		valueField:'loginNm',
		displayField:'loginNm',
		render:function(res){return res.loginNm;},
		failedMsg:'获取用户失败!'
	},options);
	if ( !opt.url && opt.ctype ) {
		opt.url = 'findUserList.action?codeType=' + opt.ctype;
	}
	jQuery.jyform.ajaxSelectBox(opt);
}

//


,sysCodeBox:function(options) { $.jyform.syscodeBox(options); }
,syscodeBox:function(options) {
	var opt = $.extend({
		valueField:'codeNo',
		displayField:'codeName',
		render:function(res){return res.codeName;},
		failedMsg:'获取系统代码失败!'
	},options);
	if ( !opt.url && opt.ctype ) {
		opt.url = 'findSecCodeList.action?codeType=' + opt.ctype;
	}
	jQuery.jyform.ajaxSelectBox(opt);
}
,qrySysCodeBox:function(options) {
	$('#'+options.selectId).append('<OPTION value="" >全部</OPTION>'); 
	$('#' + options.selectId).val('');
	var opt = $.extend({
		valueField:'codeNo',
		displayField:'codeName',
		render:function(res){return res.codeName;},
		failedMsg:'获取系统代码失败!'
	},options);
	if ( !opt.url && opt.ctype ) {
		opt.url = 'findSecCodeList.action?codeType=' + opt.ctype;
	}
	jQuery.jyform.ajaxSelectBox(opt);
}
,frmSysCodeBox:function(options) {
	$('#'+ options.selectId).append('<OPTION value="" ></OPTION>'); 
	$('#' + options.selectId).val('');
	var opt = $.extend({
		valueField:'codeNo',
		displayField:'codeName',
		render:function(res){return res.codeName;},
		failedMsg:'获取系统代码失败!'
	},options);
	if ( !opt.url && opt.ctype ) {
		opt.url = 'findSecCodeList.action?codeType=' + opt.ctype;
	}
	jQuery.jyform.ajaxSelectBox(opt);
}
,components:function() {
	$('input[xtype]').each(function(i,n){
		var $n = $(n);
		var xtype = $n.attr('xtype');
		var uid = $n.attr('id');
		var enable = $n.attr('readonly')?false:true;
		if ( uid ) {
			if ( xtype == 'time' || xtype == 'datetime') {
				$.jyform.dateTimeBox({select:$n, enabled: enable});
			}
			if ( xtype == 'date' ) {
				$.jyform.dateBox({select:$n, enabled: enable});
			}
		}
	});
	$.jyform.sysCodeBoxes();
	// default error image
	$("form img").bind("error",function(){   
		this.src="r/img/bg/default.png";   
	});
	$('input[readonly=readonly]').css({'backgroundColor':'#F2F2F2','border':'1px solid #F2F2F2'});
	$('input[xtype=money]').css({'textAlign':'right'});
}
,coreParamBoxes:function() {
	var codeUrl = 'findCoreParamList.action';
	var codes = ''; 
	$('select[ptype]').each(function(i,n){
		var $n = $(n);
		var _ptype = $n.attr('ptype');
		if ( codes == '') {
			codes = codes + _ptype;
		} else {
			codes = codes + ',' + _ptype;
		}
	});
	// load syscode from remote
	var jsonfilter = [{"field":"type","data":{"type":"list","value":codes,"comparison":"eq"}}];
	$.ajax({url:codeUrl, type:'POST', cache:false, ifModified:false, dataType:"json", async:false, data:{'jsonfilter':$.toJSON(jsonfilter),'dir':'showId'},
		success:function(data){
			if (data.success == false){ 
				jQuery.jyajax.outputErrors(data);
			} else { 
				var jsondata = jQuery.jyajax.jsonWeightloss(data);
				var codeMap = {};
				$(jsondata).each(function(i,n){
					if ( n.type ) {
						if ( codeMap[n.type] ) {
							codeMap[n.type].push(n);
						} else {
							codeMap[n.type] = new Array();
							codeMap[n.type].push(n);
						}
					}
				});
				
				$('select[ptype]').each(function(i,n){
					var $n = $(n);
					var _ptype = $n.attr('ptype');
					var _sid = $n.attr('id');
					var _c = $n.attr('comparison');
					var _v = $n.attr('def');
					if ( _c ) {
						// $.jyform.qrySysCodeBox({selectId:_sid,ctype:_ctype});
						var opt = {selectId:_sid, ctype:_ptype, func:function(){ $.jyform.multiSelectBox(_sid); }};
						if ( _v && (typeof (_v)) != "undefined" ) { 
							// console.log(typeof (_v));
							if ( _v.indexOf(',') > 0 ) {
								opt.val = _v.split(',');
							} else {
								opt.val = _v; 
							}
						}
						//$.jyform.sysCodeBox(opt);
						var options = $.extend({
							valueField:'code', displayField:'display1',
							render:function(res){return res.display1;}, failedMsg:'获取应用参数失败!'
						},opt);
						$.jyform.dataSelectBox(options, codeMap[_ptype]);
					} else {
						var opt = {selectId:_sid, ctype:_ptype};
						$('#'+ _sid).append('<OPTION value="" ></OPTION>'); 
						$('#' + _sid).val('');
						var options = $.extend({
							valueField:'code', displayField:'display1',
							render:function(res){return res.display1;}, failedMsg:'获取应用参数失败!'
						},opt);
						$.jyform.dataSelectBox(options, codeMap[_ptype]);
					}
				});
			}
		}
	});
}
,sysCodeBoxes:function(){
	var codeUrl = 'findCodeList.action';
	var codes = 'NO_USE,NO_USE2'; 
	$('select[ctype]').each(function(i,n){
		var $n = $(n);
		var _ctype = $n.attr('ctype');
		codes = codes + ',' + _ctype;
	});
	// load syscode from remote
	var jsonfilter = [{"field":"codeType","data":{"type":"list","value":codes,"comparison":"eq"}}];
	$.ajax({url:codeUrl, type:'POST', cache:false, ifModified:false, dataType:"json", async:false, data:{'jsonfilter':$.toJSON(jsonfilter),'dir':'codeSort'},
		success:function(data){
			if (data.success == false){ 
				jQuery.jyajax.outputErrors(data);
			} else { 
				var jsondata = jQuery.jyajax.jsonWeightloss(data);
				var codeMap = {};
				$(jsondata).each(function(i,n){
					if ( n.codeType ) {
						if ( codeMap[n.codeType] ) {
							codeMap[n.codeType].push(n);
						} else {
							codeMap[n.codeType] = new Array();
							codeMap[n.codeType].push(n);
						}
					}
				});
				
				$('select[ctype]').each(function(i,n){
					var $n = $(n);
					var _ctype = $n.attr('ctype');
					var _sid = $n.attr('id');
					var _c = $n.attr('comparison');
					var _v = $n.attr('def');
					//console.log(_v);
					if ( _c ) {
						// $.jyform.qrySysCodeBox({selectId:_sid,ctype:_ctype});
						var opt = {selectId:_sid, ctype:_ctype, func:function(){ $.jyform.multiSelectBox(_sid); }};
						
						if ( _v && (typeof (_v)) != "undefined" ) { 
							if ( _v.indexOf(',') > 0 ) {
								opt.val = _v.split(',');
							} else {
								opt.val = _v; 
							}
						}
						//$.jyform.sysCodeBox(opt);
						var options = $.extend({
							valueField:'codeNo', displayField:'codeName',
							render:function(res){return res.codeName;}, failedMsg:'获取系统代码失败!'
						},opt);
						$.jyform.dataSelectBox(options, codeMap[_ctype]);
					} else {
						var opt = {selectId:_sid, ctype:_ctype};
						$('#'+ _sid).append('<OPTION value="" ></OPTION>');
						if ( _v  && (typeof (_v)) != "undefined" ) { 
							 opt.val=_v;						
						}
						var options = $.extend({
							valueField:'codeNo', displayField:'codeName',
							render:function(res){return res.codeName;}, failedMsg:'获取系统代码失败!'
						},opt);
						$.jyform.dataSelectBox(options, codeMap[_ctype]);
					}
				});
			}
		}
	});
}
,dictInfoBox:function(options) {
	var opt = $.extend({
		valueField:'dictCode',
		displayField:'dictShortName',
		render:function(res){return res.dictShortName;},
		failedMsg:'获取数据字典失败!'
	},options);
	if ( !opt.url && opt.ctype ) {
		opt.url = 'findEntityDictInfoList.action?dictType=' + opt.ctype;
	}
	jQuery.jyform.ajaxSelectBox(opt);
},

cascadeBox:function(options) {
	$('#' + options.selectId).empty();
	var opt = $.extend({
		valueField:options.valueField,
		displayField:options.displayField,
		failedMsg:'获取数据失败!'
	},options);
	if ( !opt.url ) {
		opt.url = options.url;
	}
	jQuery.jyform.ajaxSelectBox(opt);
},

commonValidator:function(vg,fields){
	$(fields).each(function(i,n){
		if ( typeof n == 'object' ) {
			$("#"+n.id).formValidator({ empty : n.empty, onshow : "请输入内容", oncorrect : "√",validatorgroup:vg }).functionValidator({fun:chkCNLen});
		} else {
			$("#" + n).formValidator({ empty : true, onshow : "请输入内容", oncorrect : "√" }).functionValidator({fun:chkCNLen});
		}
	});
}
,jsonForm:function(setting) {
	var p = setting;
	var form = $('#' + p.formId);
	var obj = new Object();
	$(':input', form).not(':button,.ignore').each(function(i, n) {
		switch (n.type) {
		case "radio":
			if (n.checked) { obj[n.name] = $(n).val(); }
			break;
		case "checkbox":
			if (!obj[n.name]) { obj[n.name] = new Array(); }
			if (n.checked) { obj[n.name].push($(n).val()); }
			;
			break;
		default:
			if (p.noEmpty) { if ($(n).val() != "") { obj[n.name] = $(n).val(); }
			} else obj[n.name] = $(n).val() || '';
			break;
		}
	});
	if (p.dealData) {
		p.dealData(obj);
	}
	return obj;
}
,jsonfilter:function(id) {
	if ( id ) {
		var qfrm = $('#'+id);
		var filter = new Array();
	    $(':input[cp]',qfrm).each(function() {
	      if ($(this).val() && this.name ) {
	    	  var ftype = $(this).attr("ft");
	    	  filter.push({
	    		  "field" : this.name, 
	    		  "data" : { "type" : ftype ? ftype:'string' ,"value" : $(this).val() ,"comparison" : $(this).attr("cp")}});
	      }
		});
	    return $.toJSON(filter);
	}
}
,iframefix:function(id){
	$('#' + id).load(function(){ 
		var mainheight = $(this).contents().find("body").height()+30; 
		$(this).height(mainheight); 
	});
}
,menulist:function(id){
	var $menu = $('#'+id);
	var itemsId = $menu.attr('menu');
	var $items = $('#'+itemsId);
	$items.css({'position': 'absolute', 'width': '100px'}).menu();
	$menu.click(function(){
//		var m = $items.show();
		$items.toggle().position({ my: "left top", at: "left bottom", of: this });
		$(document).one( "click", function() { $items.hide(); });
	 	return false;
	});
	$menu.click().click();
	/*$('#' + id)
		.click(function() {
		 	var menu = $(this).next().show().position({ my: "left top", at: "left bottom", of: this });
		 	$(document).one( "click", function() { 
		 		menu.hide(); 
		 	}); 
		 	return false;
		}).next().hide().menu();
	$('#' + id).next().css({'position': 'absolute', 'width': '100px'});*/
}
,toolbarfix:function(id){
	var rtb = $('#' + id);
	var startPos = rtb.offset().top;
	rtb.css({'width':'100%', 'height':'auto','background-color': '#dfe8f6','overflow':'auto', 'border-bottom':'1px solid #8db2e3', 'padding': '3px 0 3px 0'/*,'background': "url('r/img/bg/bg-band.png') 0 -387px repeat-x" */});
	rtb.find('ul').css({'margin':'0','display':'relative'});
	rtb.find('ul li').css({'display':'block','float':'left','margin-right':'.8em'});
	rtb.find('ul li label').css({'display': 'inline-block', 'width': '60px', 'text-align': 'right', 'margin-right': '.8em','margin-top':'.2em'});
	rtb.find('ul li input').css({'margin-top':'3px'});
	$.event.add(window,'scroll',function(){var p = $(window).scrollTop();rtb.css({'position':((p)>startPos)?'fixed':'static','top':((p)>startPos)?'0px':''});});
}
,gridHeightFix:function(id){
	if ($('#'+id).length>0) {
		$('#'+id).flexFixHeight();
		$(window).resize(function(){ $('#' + id).flexFixHeight() ;} );
	}
}
,lazyFixHeight:function(id) {
	var $t = $('#'+id);
	var bh = $t.data("bh");
	var ph = $t.parent().height();
	if ( bh && bh == ph) {
		$t.flexFixHeight();
	} else {
		$t.data("bh", ph);
		setTimeout("$.jyform.lazyFixHeight('"+id+"')",200);
	}
},
/**
 * generate html node object from 
 * @param _f field
 * @param _t template string
 * @returns
 */
htmlFromTpl:function(_f,_t){
	var html =  _t.replace(/{([^{}]+)}/g,function(word){ 
		var _attr=word.replace(/({|})+/g,""); 
		return _f[_attr]; });
	return $(html);
}
,__fillForm: function( _r, i, n) {
	// fillForm 的简单粒度封装
	if ( n.name in _r) { 
		v = _r[n.name] ;
		if ( $(n).attr('xtype') == 'money' ) {
			v = frmMoney(v);
		} 
		if ( $(n).attr('xtype') == 'rate' ) {
			v = frmRate(v);
		}
		if ( $(n).attr('xtype') == 'rate3' ) {
			v = frmRate3(v);
		}
		if ( $(n).attr('xtype') == 'rate4' ) {
			v = frmRate4(v);
		}
		if ( $(n).attr('xtype') == 'date') {
			var cid = $(n).attr('id');
			$('#'+cid+'-disp').val(frmBSDate(v));
		}
		if ( $(n).attr('xtype') == 'datetime') {
			var cid = $(n).attr('id');
			$('#'+cid+'-disp').val(frmBSTime(v));
		}
		$(n).val(v);
		if ( $(n).hasClass('hasDatepicker') && v && v!==''  ) { 
			$(n).datepicker('setDate',frmTime(v));
		}
	}
}
,fillForm:function(_id,_r){
	$('#'+ _id +' :input').each(function(i,n) {
		$.jyform.__fillForm( _r, i, n);
	});
},
fillCompareForm:function(_id,_oldBean,_newBean,_fieldDef){
	if( !_newBean || !_oldBean ) {
		return;
	}
	$.each(_fieldDef,function(i,n){
		var _name = n.jcode;
		var oldValue = _oldBean[_name];
		var newValue = _newBean[_name];
		$oinput = $('#'+ _id +' [name='+_name+'].oldVal');
		$ninput = $('#'+ _id +' [name='+_name+'].newVal');
		$.jyform.fillInput($oinput.attr('id'),oldValue);
		$.jyform.fillInput($ninput.attr('id'),newValue);
		var nid = $ninput.attr('id');
		if ( oldValue != newValue ) {
			$ninput.addClass('diff');
			if( $ninput.attr('xtype') == 'date' || $ninput.attr('xtype') == 'datetime' ) {
				$('#' + nid + '-display').addClass('diff');
			}
		} else {
			$ninput.removeClass('diff');
			if( $ninput.attr('xtype') == 'date' || $ninput.attr('xtype') == 'datetime' ) {
				$('#' + nid + '-display').removeClass('diff');
			}
		}
	});
}
,fillInput:function(_inputid,_value) {
	var $input = $('#'+_inputid);
	if ( $input.attr('xtype') == 'money' ) {
		_value = frmMoney(_value);
	} 
	if ( $input.attr('xtype') == 'rate' ) {
		_value = frmRate(_value);
	}
	if ( $input.attr('xtype') == 'rate3' ) {
		_value = frmRate3(_value);
	}
	if ( $input.attr('xtype') == 'rate4' ) {
		_value = frmRate4(_value);
	}
	if ( $input.attr('xtype') == 'feeRate' ) { // alias in mht.webmngr
		_value = frmRate4(_value);
	}
	if ( $input.attr('xtype') == 'date') {
		var cid = $input.attr('id');
		$('#'+cid+'-disp').val(frmBSDate(_value));
	}
	if ( $input.attr('xtype') == 'datetime') {
		var cid = $input.attr('id');
		$('#'+cid+'-disp').val(frmBSTime(_value));
	}
	$input.val(_value);
	if ( $input.hasClass('hasDatepicker') ) { 
		$input.datepicker('setDate',frmTime(_value));
	}
},fillFileForm:function(_id,_fileList){
	if( !_fileList || !_id ) {
		return;
	}
	if( !isArray(_fileList) ) {
		var _fldSeq = _fileList.fldSeq;
		$input = $('#'+ _id +' [fldseq='+_fldSeq+']');
		$input.val(_fileList.fldVal);
		$input.attr('attachId',_fileList.attachId);
	} else {
		$.each(_fileList,function(i,n){
    		var _fldSeq = n.fldSeq;
    		$input = $('#'+ _id +' [fldseq='+_fldSeq+']');
    		$input.val(n.fldVal);
    		$input.attr('attachId',n.attachId);
    	});
	}
}
,resetForm:function(_id) {
	$('#'+_id+' div[id$=Tip]').empty();
	$('#'+_id+' :input').removeAttr('disabled');
	$('#'+_id+'>select').removeAttr('disabled');
	$('#'+_id)[0].reset();
}
,multiSelectBox:function(_id, _opts) {
	var _ori = $('#' + _id) ;
	var vid = _id + '-input'; 
	var _input = $('<input id="' + vid + '" />');
	_input.attr('name',_ori.attr('name'))
		.attr('ftype', 'list')
		.attr('comparison',_ori.attr('comparison'));
	_input.css({'display':'none'});
	_ori.after(_input);
	_ori.removeAttr('comparison');
	var _setVal = function() {
		var checked = $('#'+_id).multiselect('getChecked');
		var _v = '';
		if ( checked.length == 0 ) {
			$('#' + vid).val(_v);
		}
		$(checked).each(function(i,n){_v += ($(n).val() + ',');});
		$('#' + vid).val(_v);
	};
	$('#'+_id).multiselect($.extend({
		minWidth:160, height:100,
		selectedList:3, 
		classes:'ui-btn-sm',
		checkAllText: '全选',
		uncheckAllText: '取消',
		noneSelectedText: '请选择...',
		selectedText: '已选 # 项',
		close:function(){
			_setVal();
		}
	}, _opts));
	_setVal();
}
};

$.jytree = {
setState:function(p,t){
	var state = "";
	p.children('ul').children('li').each(function() {
		var chidrenstate;
		if ($(this).hasClass('leaf')) {
			if ($(this).attr('check') == 'true') {
				$(this).children('a').addClass('checked');
				t.open_branch($(this).parents('li'));
				chidrenstate = "checked";
			} else {
				$(this).children('a').addClass('unchecked');
				chidrenstate = "unchecked";
			}
		} else {
			chidrenstate = $.jytree.setState($(this),t);
		}
		if (state == "undetermined"){
			return;
		}
		if (state == "") {
			state = chidrenstate;
		} else if (state != chidrenstate) {
			state = "undetermined";
		}
	});
	$(p).children('a').addClass(state);
		return state;
	}
};

(function($, undefined) {
    $.fn.getCursorPosition = function() {
        var el = $(this).get(0);
        var pos = 0;
        if ('selectionStart' in el) {
            pos = el.selectionStart;
        } else if ('selection' in document) {
            el.focus();
            var Sel = document.selection.createRange();
            var SelLength = document.selection.createRange().text.length;
            Sel.moveStart('character', -el.value.length);
            pos = Sel.text.length - SelLength;
        }
        return pos;
    };
})(jQuery);

$.fn.extend({
    insertAtCursor : function(myValue) {
        var $t = $(this)[0];
        if (document.selection) {
            this.focus();
            sel = document.selection.createRange();
            sel.text = myValue;
            this.focus();
        } else if ($t.selectionStart || $t.selectionStart == '0') {
            var startPos = $t.selectionStart;
            var endPos = $t.selectionEnd;
            var scrollTop = $t.scrollTop;
            $t.value = $t.value.substring(0, startPos) + myValue + $t.value.substring(endPos, $t.value.length);
            this.focus();
            $t.selectionStart = startPos + myValue.length;
            $t.selectionEnd = startPos + myValue.length;
            $t.scrollTop = scrollTop;
        } else {
            this.value += myValue;
            this.focus();
        }
    }
});