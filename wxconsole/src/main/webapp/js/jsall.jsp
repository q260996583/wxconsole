<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link type="text/css" rel="stylesheet"
	href="css/validator.css" />
<link type="text/css" rel="stylesheet"
	href="css/iflexgrid.css" />
<link type="text/css" rel="stylesheet"
	href="css/ui/jquery-ui-1.8.6.custom.css" />
	<link type="text/css" rel="stylesheet"
	href="css/console.css" />
	<link href="js/jqtree/tree_component.css" rel="stylesheet" type="text/css"></link>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/iflexigrid.js"></script>
<script type="text/javascript" src="js/ui/jquery.bgiframe.js"></script>

<script type="text/javascript" src="js/jqtree/css.js"></script>    
<script type="text/javascript" src="js/jqtree/tree_component.js"></script>
<script type="text/javascript" src="js/consoleUtil.js"></script>
<script type="text/javascript" src="js/consoleQUtil.js"></script>
<script type="text/javascript" src="js/tojson.js"></script>
<script type="text/javascript" src="js/validator/formValidator.js"></script>
<script type="text/javascript" src="js/ui/jquery.ui.core.min.js"></script>
<script type="text/javascript" src="js/ui/jquery.ui.widget.min.js"></script>
<script type="text/javascript" src="js/ui/jquery.ui.position.min.js"></script>
<script type="text/javascript" src="js/ui/jquery.ui.dialog.min.js"></script>
<script type="text/javascript" src="js/ui/jquery.ui.tabs.min.js"></script>
<script type="text/javascript" src="js/ui/jquery.ui.autocomplete.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<script type="text/javascript" src="datepicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/mngr-render-debug.js"></script>
<style type="text/css">

.my-dialog .ui-dialog-titlebar{
 display: none;
}
.input01{ width:150px; }

</style>
	<!-- 遮罩层 -->
			<div id="a_load"  style="display: none;min-height: 25px;">
				<div style="text-align:center;" >
			<img src="images/ajaxLoader.gif" >正在加载 请稍后....
				</div>
			</div>

<script type="text/javascript">
Date.prototype.Format = function(formatStr)   
{   
    var str = formatStr;   
    var Week = ['日','一','二','三','四','五','六']; 

    str=str.replace(/yyyy|YYYY/,this.getFullYear());   
    str=str.replace(/yy|YY/,(this.getYear() % 100)>9?(this.getYear() % 100).toString():'0' + (this.getYear() % 100));   

    str=str.replace(/MM/,this.getMonth()>9?this.getMonth().toString():'0' + (this.getMonth()+1));   
    str=str.replace(/M/g,this.getMonth());   

    str=str.replace(/w|W/g,Week[this.getDay()]);   

    str=str.replace(/dd|DD/,this.getDate()>9?this.getDate().toString():'0' + this.getDate());   
    str=str.replace(/d|D/g,this.getDate());   

    str=str.replace(/hh|HH/,this.getHours()>9?this.getHours().toString():'0' + this.getHours());   
    str=str.replace(/h|H/g,this.getHours());   
    str=str.replace(/mm/,this.getMinutes()>9?this.getMinutes().toString():'0' + this.getMinutes());   
    str=str.replace(/m/g,this.getMinutes());   

    str=str.replace(/ss|SS/,this.getSeconds()>9?this.getSeconds().toString():'0' + this.getSeconds());   
    str=str.replace(/s|S/g,this.getSeconds());   

    return str;   
}  

//+--------------------------------------------------- 
//| 日期计算 
//+--------------------------------------------------- 
Date.prototype.DateAdd = function(strInterval, Number) {   
  var dtTmp = this; 
  switch (strInterval) {   
      case 's' :return new Date(Date.parse(dtTmp) + (1000 * Number)); 
      case 'n' :return new Date(Date.parse(dtTmp) + (60000 * Number)); 
      case 'h' :return new Date(Date.parse(dtTmp) + (3600000 * Number)); 
      case 'd' :return new Date(Date.parse(dtTmp) + (86400000 * Number)); 
      case 'w' :return new Date(Date.parse(dtTmp) + ((86400000 * 7) * Number)); 
      case 'q' :return new Date(dtTmp.getFullYear(), (dtTmp.getMonth()) + Number*3, dtTmp.getDate(), dtTmp.getHours(), dtTmp.getMinutes(), dtTmp.getSeconds()); 
      case 'm' :return new Date(dtTmp.getFullYear(), (dtTmp.getMonth()) + Number, dtTmp.getDate(), dtTmp.getHours(), dtTmp.getMinutes(), dtTmp.getSeconds()); 
      case 'y' :return new Date((dtTmp.getFullYear() + Number), dtTmp.getMonth(), dtTmp.getDate(), dtTmp.getHours(), dtTmp.getMinutes(), dtTmp.getSeconds()); 
  } 
} 


   function AddDate(Number){
		var ago7Day = new Date(Date.parse(new Date().toString()) - 86400000*Number);
		var day   = ago7Day.getDate();
		var month = ago7Day.getMonth() + 1;
		if((month.toString().length)==1)
		{month="0"+month;}
		if((day.toString().length)==1)
		{day="0"+day;}
		var yy = ago7Day.getFullYear();
		return yy+""+month+""+day;
   }


	function StringToDate(DateStr) {
		DateStr=DateStr.substr(0,4)+"-"+DateStr.substr(4,2)+"-"+DateStr.substr(6,2);
		var converted = Date.parse(DateStr);
		var myDate = new Date(converted);
		if (isNaN(myDate)) {
			//var delimCahar = DateStr.indexOf('/')!=-1?'/':'-';  
			var arys = DateStr.split('-');
			myDate = new Date(arys[0], --arys[1], arys[2]);
		}
		return myDate;
	}

	

	
	var iframeId = new Object();
	var DatePrePre = AddDate(2);
	var DatePre = AddDate(1);
	var DateCurr = AddDate(0);
	var preDate = new Date().DateAdd('d', -1);
	var thePreDate = preDate.Format('yyyyMMdd');
    var prePreDate = new Date().DateAdd('d', -2);
	var thePrePreDate = prePreDate.Format('yyyyMMdd');

	$.ajaxSetup({
		dataType : 'json',
		//timeout:10000,
		type : "POST"
	});

	$("#a_load").ajaxStart(function() {
		$("#a_load").dialog('open');
	});

	$("#a_load").ajaxError(function(event, request, settings) {
		//alert(request);
	});

	$("#a_load").ajaxStop(function() {
		$("#a_load").dialog('close');
	});
	$('#a_load').dialog({
		autoOpen : false,
		title : false,
		dialogClass : "my-dialog",
		closeOnEscape : false,
		bgiframe : true,
		resizable : false,
		draggable : false,
		modal : true
	});
	
	//身份证号合法性验证 
	//支持15位和18位身份证号
	//支持地址编码、出生日期、校验位验证
	function IdentityCodeValid(code) { 
        var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};
        var tip = "";
        var pass= true;
        
        if (!code || !/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[12])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(code)){
            tip = "身份证号格式错误";
            pass = false;
        }
        
       	else if (!city[code.substr(0,2)]){
            tip = "地址编码错误";
            pass = false;
        }
        
       	else{
            //18位身份证需要验证最后一位校验位
            if (code.length == 18){
                code = code.split('');
                //∑(ai×Wi)(mod 11)
                //加权因子
                var factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];
                //校验位
                var parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
                var sum = 0;
                var ai = 0;
                var wi = 0;
                for (var i = 0; i < 17; i++){
                    ai = code[i];
                    wi = factor[i];
                    sum += ai * wi;
                }
                var last = parity[sum % 11];
                if (parity[sum % 11] != code[17]){
                    tip = "校验位错误";
                    pass =false;
                }
            }
        }
        if (!pass) alert(tip);
        return pass;
    }
</script>