(function($){
jQuery.extend({
inputToObj : function(_obj, _input, _p) {
	var obj = _obj;
	var n = _input;
	var p = arguments[2]||{};
	switch (n.type) {
	case "radio":
		if (n.checked) {
			obj[n.name] = $(n).val();
		}
		break;
	case "checkbox":
		if (!obj[n.name]) {
			obj[n.name] = new Array();
		}
		if (n.checked) {
			obj[n.name].push($(n).val());
		}
		;
		break;
	default:
		if (p.noEmpty) {
			if ($(n).val() != "") {
				obj[n.name] = $(n).val();
			}
		} else
			obj[n.name] = $(n).val() || '';
		break;
	}
	var xtype = $(n).attr('xtype');
	switch ( xtype ) {
		case 'money':
			if ($(n).val() != "") {
				obj[n.name] = $(n).val()*100 ;
			}
			break;
		case 'rate':
			if ($(n).val() != "") {
				obj[n.name] = $(n).val()*100 ;
			}
			break;
		case 'rate3':
			if ($(n).val() != "") {
				obj[n.name] = $(n).val()*1000 ;
			}
			break;	
		case 'rate4':
			if ($(n).val() != "") {
				obj[n.name] = $(n).val()*10000 ;
			}
			break;	
		default : break;
	}
},
/*----------------------------表单数据AJAX提交---------------------------*/		
ajaxForm:function(setting){		
	var p = setting;
	var form = $('#' + p.formId);
	var obj = new Object();
	$(':input', form).not(':button,.ignore').each(function(i, n) {
	    switch (n.type) {
	    case "radio":
	        if (n.checked) {
	            obj[n.name] = $(n).val()
	        }
	        break;
	    case "checkbox":
	        if (!obj[n.name]) {
	            obj[n.name] = new Array()
	        }
	        if (n.checked) {
	            obj[n.name].push($(n).val())
	        };
	        break;
	    default:
	        if (p.noEmpty) {
	            if ($(n).val() != "") {
	                obj[n.name] = $(n).val()
	            }
	        } else obj[n.name] = $(n).val() || '';
	        break
	    }
	    var xtype = $(n).attr('xtype');
		switch ( xtype ) {
			case 'money':
				if ($(n).val() != "") {
					obj[n.name] = $(n).val()*100 ;
				}
				break;
			case 'rate':
				if ($(n).val() != "") {
					obj[n.name] = $(n).val()*100 ;
				}
				break;
			case 'rate3':
				if ($(n).val() != "") {
					obj[n.name] = $(n).val()*1000 ;
				}
				break;	
			case 'rate4':
				if ($(n).val() != "") {
					obj[n.name] = $(n).val()*10000 ;
				}
				break;	
			default : break;
		}
	});
	if (p.dealData) {
	    p.dealData(obj)
	}
	var objstr = $.toJSON(obj);
	$.ajax({
	    url: p.url,
	    dataType: 'json',
	    type: 'POST',
	    data: {
	        jsonObject: objstr
	    },
	    success: p.success
	});	 	   
},
	 
	 /*----------------------------简化验证---------------------------*/
	 someAuthentication:function(list){
			$(list).each(function(i){					
				var obj=$("#"+this.id);
				if(obj.length==0)
				return;
		
				obj.formValidator(this.formValidator);
				
				if(this.inputValidator)
				obj.inputValidator(this.inputValidator);
				
				if(this.regexValidator)
				obj.regexValidator(this.regexValidator);
						
				if(this.functionValidator)
				obj.functionValidator(this.functionValidator);
				if(this.compareValidator)
				obj.compareValidator(this.compareValidator);
				
			});
		},
	 
		
		changeDecimal:function(x,pos){
			 var f_x = parseFloat(x);
			   pos=pos||2;
			   if (isNaN(f_x))
			   {
			      //alert('function:changeTwoDecimal->parameter error');
			      return "";
			   }
			   var f_x = Math.round(x*100)/100;
			   var s_x = f_x.toString();
			   var pos_decimal = s_x.indexOf('.');
			   if (pos_decimal < 0)
			   {
			      pos_decimal = s_x.length;
			      s_x += '.';
			   }
			   while (s_x.length <= pos_decimal + pos)
			   {
			      s_x += '0';
			   }
			   return s_x;
			
		},
		
		changeDecimalThree:function(x,pos){
			 var f_x = parseFloat(x);
			   pos=pos||3;
			   if (isNaN(f_x))
			   {
			      //alert('function:changeTwoDecimal->parameter error');
			      return "";
			   }
			   var f_x = Math.round(x*1000)/1000;
			   var s_x = f_x.toString();
			   var pos_decimal = s_x.indexOf('.');
			   if (pos_decimal < 0)
			   {
			      pos_decimal = s_x.length;
			      s_x += '.';
			   }
			   while (s_x.length <= pos_decimal + pos)
			   {
			      s_x += '0';
			   }
			   return s_x;
			
		},
		changeFenToYuan:function(x){
			 return $.changeDecimal(parseFloat(x)/100);
		},
		changeYuanToFen:function(x){
			 return $.changeDecimal(parseFloat(x)*100);
		},
		createIframe:function(setting){
			var  p=$.extend({url:'',text:'标签',only:true},setting);
			var fid=''+new Date().getTime();
			var action=p.url.substr(0,p.url.indexOf('?'));
			if(p.only){
				if(p.url in iframeId){					
				}
				else {
					iframeId[action]=fid;					
				}
				parent.addTab(iframeId[action],p.text,p.url);
			}
			else parent.addTab(fid,p.text,p.url);
			
		},
		
		
	 /*----------------------------表单数据AJAX提交---------------------------*/
	
		queryTable:function(setting){
		
		
	    var p=$.extend({filter:[]},setting);
		var filter=new Array();		
		var qdiv=$('#'+p.formId);	
	
    	$(':input[comparison]',qdiv).each(function(){    
    		var theType=(typeof $(this).val());
    		if(theType!="object"){
    		    if($(this).val()){
    		    	var qtype = "string";
    		    	if($(this).attr('ftype')){
    		    		qtype = $(this).attr('ftype');
    		    	}
    		    	filter.push({"field":this.name,"data":{"type":qtype,"value":$(this).val(),"comparison":$(this).attr("comparison")}});
    		    }
    		}
    	})
    
    	$.each(p.filter,function(i,n){
    		var v=n.value();
    		if(v)
    		filter.push({"field":n.field,"data":{"type":n.type,"value":v,"comparison":n.comparison}});
    	});
    	
    	 var params=new Array();
		    $(':input.param',qdiv).each(function(){
		    	params.push({name:this.name,value:$(this).val()});
		    });	
  
       	$('#'+p.tableId).flexReload(filter,params);
		
		
	},
	fillForm:function(_id,_r){
		$('#'+ _id +' :input').each(function(i,n) {
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
				if ( $(n).hasClass('hasDatepicker') ) { 
					$(n).datepicker('setDate',frmTime(v));
				}
			}
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
			$.fillInput($oinput.attr('id'),oldValue);
			$.fillInput($ninput.attr('id'),newValue);
			if ( oldValue != newValue ) {
				$ninput.addClass('diff');
			}
		});
	},
	fillInput:function(_inputid,_value) {
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
	},
	dataSelectBox:function(options, res) {
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
			if (isArray(options.selectId)) {
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
	 
	 
 	})
 	

})(jQuery);
var isArray = function (object){ return object && typeof object==='object' && Array == object.constructor; }