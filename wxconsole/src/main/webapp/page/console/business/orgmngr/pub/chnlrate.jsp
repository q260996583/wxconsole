<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:include page="dialog_mcc.jsp"></jsp:include>
<div id="exportPageRateDiv" style="display:none;">
	<form action="exportPageRateExcel.action" method="post" id="exportPageRateForm" target="_blank">
		<input name="channelCode" />
		<input name="ratelist" />	
	</form>
</div>
<script type="text/javascript">
var GLOBAL_CNT = 0;
var compId = function() { return GLOBAL_CNT++; };
var mccGrpMap = new Object();
var mccGrpObjList = new Array();
var mccGrpSubMccMap = new Object();
var mccMap = new Object();
var mccGrpSubMccList = new Object();
var mccRateUrl = 'findCoreMccRate.action';
var mccGrpUrl = 'findCoreMccGrp.action';

var initRateConfig = function() {
	// 初始化服务类别
	$.ajax({url: mccGrpUrl, type:'POST', dataType:'json', async: false
		,success:function(data){
			if ( data && data.success ) {
				$(data.root).each(function(_i,_n){
					mccGrpMap[_n.mccGrp] = _n.mccDesc;
					mccGrpSubMccMap[_n.mccGrp] = new Array();
					mccGrpSubMccList[_n.mccGrp] = new Array();
					mccGrpObjList.push({mccGrp:_n.mccGrp, debitRate: _n.debitTtlRate, debitMaxFee: _n.unMaxFee+_n.bdMaxFee, creditRate: _n.creditTtlRate , creditMaxFee: 0});
				});
				
				// 初始化MCC
				$.ajax({url: mccRateUrl, type:'POST', dataType: 'json', async: false
					,success: function(data){
						if ( data && data.success ) {
							$(data.root).each(function(_i,_n){
								mccGrpSubMccMap[_n.mccGrp].push(_n);
								mccGrpSubMccList[_n.mccGrp].push({label:_n.mcc + ' ' + _n.mccDesc, value:_n.mcc});
								mccMap[_n.mcc] = _n;
							});
						} else {
							alert('加载MCC失败. ' + data.syserr);
						}
				}});
			} else {
				alert('加载服务类别失败. ' + data.syserr);
			}
	}});
	// if ( console ) console.log(mccGrpMap);
	
	// if ( console ) console.log(mccGrpSubMccMap);
};
//删除分润费率记录
var removeMccLine = function(_parent, _mtcid, _trid) {
	$('#'+_trid).remove();
	$('#'+_mtcid).attr({'rowspan': _parent.find('tr').size()});
};

// 构建非默认的分润费率记录
var drawMccLine = function(_parent, _mccGrp, _prefix, _vo, readonly) {
	var mtid = _prefix + '-' +_mccGrp;
	var mtdid = mtid + '-' + compId();
	var row_id = mtdid + '-tr';
	var disp_id = mtdid + '-disp';
	var qry_mcc_id = mtdid + '-btn-mcc';
	var fld_mcc_id = mtdid + '-fld-mcc';
	var fld_debit_rate_id = mtdid + '-fld-debitRate';
	var fld_debit_maxfee_id = mtdid + '-fld-debitMaxFee';
	var fld_debit_chnlratio_id = mtdid + '-fld-debitChnlRatio';
	var fld_credit_rate_id = mtdid + '-fld-creditRate';
	var fld_credit_maxfee_id = mtdid + '-fld-creditMaxFee';
	var fld_credit_chnlratio_id = mtdid + '-fld-creditChnlRatio';
	var data_id = mtdid + '-data';
	var mccgrp_id = mtid + '-cell';
	var p_row_id = mtid + '-def-tr';
	var p_ratio = $('#'+p_row_id + ' :input[name="chnlRatio"]').val()*1000;
	var vo = _vo || {mccGrp:_mccGrp,mcc:'',rate:0,maxFee:0,chnlRatio:p_ratio };
	var $tr = $('<tr></tr>').attr({id:row_id});
	if (readonly) {
		$tr
			.append($('<td></td>').addClass('text-center')
				.append($('<input type="hidden" />').addClass('rate-input').attr({name:'mccGrp',value: vo.mccGrp}))
				.append($('<input />').addClass('rate-input').attr({name:'mcc',id:fld_mcc_id, readonly:'readonly'}).val(vo.mcc)
					.autocomplete({source: mccGrpSubMccList[_mccGrp]})
					.bind('input propertychange blur change', function(){ 
						var tmpMcc = mccMap[$(this).val()];
						if ( tmpMcc ) {
							$('#'+disp_id).html(tmpMcc.mccDesc);
							//$.jyform.fillInput(fld_rate_id, tmpMcc.rate);
							//$.jyform.fillInput(fld_maxfee_id, tmpMcc.maxFee);
						}
			 	}))
			 )
			.append($('<td></td>').attr({'id':disp_id}))
			.append($('<td></td>').append($('<input />').addClass('rate-input text-right').attr({id: fld_debit_rate_id,name:'debitRate',xtype:'rate4', readonly:'readonly'})))
			.append($('<td></td>').append($('<input />').addClass('rate-input text-right').attr({id: fld_debit_maxfee_id,name:'debitMaxFee',xtype:'money', readonly:'readonly'})))
			.append($('<td></td>').append($('<input />').addClass('rate-input text-right').attr({id: fld_debit_chnlratio_id,name:'debitChnlRatio',xtype:'rate4', readonly:'readonly'})))
			.append($('<td></td>').append($('<input />').addClass('rate-input text-right').attr({id: fld_credit_rate_id,name:'creditRate',xtype:'rate4', readonly:'readonly'})))
			.append($('<td></td>').append($('<input />').addClass('rate-input text-right').attr({id: fld_credit_maxfee_id,name:'creditMaxFee',xtype:'money', readonly:'readonly'})))
			.append($('<td></td>').append($('<input />').addClass('rate-input text-right').attr({id: fld_credit_chnlratio_id,name:'creditChnlRatio',xtype:'rate4', readonly:'readonly'})))
		;
	} else {
		$tr
			.append($('<td></td>').addClass('text-center')
				.append($('<input type="hidden" />').addClass('rate-input').attr({name:'mccGrp',value: vo.mccGrp}))
				.append($('<input />').addClass('rate-input').attr({name:'mcc',id:fld_mcc_id}).val(vo.mcc)
					.autocomplete({source: mccGrpSubMccList[_mccGrp]})
					.bind('input propertychange blur change', function(){ 
						var tmpMcc = mccMap[$(this).val()];
						if ( tmpMcc ) {
							$('#'+disp_id).html(tmpMcc.mccDesc);
							//$.jyform.fillInput(fld_rate_id, tmpMcc.rate);
							//$.jyform.fillInput(fld_maxfee_id, tmpMcc.maxFee);
						}
			 }))
			  .append($('<a href="javascript:void(0)" title="mcc">Q</a>').addClass('rate-mcc-btn').attr({'id': qry_mcc_id }))
			 )
			.append($('<td></td>').attr({'id':disp_id}))
			.append($('<td></td>').append($('<input />').addClass('rate-input text-right').attr({id: fld_debit_rate_id,name:'debitRate',xtype:'rate4'})))
			.append($('<td></td>').append($('<input />').addClass('rate-input text-right').attr({id: fld_debit_maxfee_id,name:'debitMaxFee',xtype:'money'})))
			.append($('<td></td>').append($('<input />').addClass('rate-input text-right').attr({id: fld_debit_chnlratio_id,name:'debitChnlRatio',xtype:'rate4'})))
			.append($('<td></td>').append($('<input />').addClass('rate-input text-right').attr({id: fld_credit_rate_id,name:'creditRate',xtype:'rate4'})))
			.append($('<td></td>').append($('<input />').addClass('rate-input text-right').attr({id: fld_credit_maxfee_id,name:'creditMaxFee',xtype:'money'})))
			.append($('<td></td>').append($('<input />').addClass('rate-input text-right').attr({id: fld_credit_chnlratio_id,name:'creditChnlRatio',xtype:'rate4'})))
			.append($('<td></td>').append($('<a href="javascript:void(0)" title="删除"></a>').addClass('add-rate-data').attr({'id':data_id}).html('-').click(function(){ removeMccLine(_parent, mccgrp_id, row_id); })))
		;
	}
	
	_parent.append($tr);
	// set value
	if ( mccMap[vo.mcc] ) {
		$('#'+disp_id).html(mccMap[vo.mcc].mccDesc);
	}
	$.jyform.fillInput(fld_debit_rate_id, vo.debitRate);
	$.jyform.fillInput(fld_debit_maxfee_id, vo.debitMaxFee);
	$.jyform.fillInput(fld_debit_chnlratio_id, vo.debitChnlRatio);
	$.jyform.fillInput(fld_credit_rate_id, vo.creditRate);
	$.jyform.fillInput(fld_credit_maxfee_id, vo.creditMaxFee);
	$.jyform.fillInput(fld_credit_chnlratio_id, vo.creditChnlRatio);
	// set rowspan for mccgrp cell. 
	$('#'+mccgrp_id).attr({'rowspan': _parent.find('tr').size()});
	//
	mccDialogBind(qry_mcc_id
		 ,function(){
			$('#dialog_mcc_mccGrp').val(_mccGrp);
			mccDialogCallback = function(rec, id) {
				var data = rec;
				$('#' + disp_id).html(data.mccDesc);
				$('#' + fld_mcc_id).val(data.mcc);
				// $.jyform.fillInput(fld_debit_rate_id, data.rate);
				// $.jyform.fillInput(fld_debit_maxfee_id, data.maxFee);
				// $.jyform.fillInput(fld_credit_rate_id, data.maxFee);
				// $.jyform.fillInput(fld_credit_maxfee_id, data.maxFee);
				$('#dialog_mcc').dialog('close');
			};
		},function(data){
			$('#' + disp_id).html(data.mccDesc);
			$('#' + fld_mcc_id).val(data.mcc);
			// $.jyform.fillInput(fld_rate_id, data.rate);
			// $.jyform.fillInput(fld_maxfee_id, data.maxFee);
		});
	
};
// 构建表格头内容
var drawHead = function(readonly) {
	var $thead = $('<thead></thead>');
	var $thr = $('<tr></tr>');
	$thr.append($('<th></th>').html('服务类别').css({width:'80px'}).attr('rowspan',2))
		.append($('<th></th>').html('MCC').css({width:'90px'}).attr('rowspan',2))
		.append($('<th></th>').html('描述').attr('rowspan',2))
		.append($('<th></th>').html('借记交易').attr('colspan',3))
		.append($('<th></th>').html('贷记交易').attr('colspan',3))
	;
	if ( readonly ) {
		// readonly 
	} else {
		$thr.append($('<th></th>').html('操作').css({width:'50px'}).attr('rowspan',2));
	}
	var $thr2 = $('<tr></tr>');
	$thr2
		.append($('<th></th>').html('成本费率(%)').css({width:'65px'}))
		.append($('<th></th>').html('封顶费(元)').css({width:'65px'}))
		.append($('<th></th>').html('分润比例(%)').css({width:'65px'}))
		
		.append($('<th></th>').html('成本费率(%)').css({width:'65px'}))
		.append($('<th></th>').html('封顶费(元)').css({width:'65px'}))
		.append($('<th></th>').html('分润比例(%)').css({width:'65px'}))
	;
	return $thead.append($thr).append($thr2);
};
// 构建默认费率的tbody部分
var drawMccTypeTbody = function($parent, _prefix, _n, readonly) {
	var mtid = _prefix + '-'+ _n.mccGrp;
	var mccGrpDesc = mccGrpMap[_n.mccGrp];
	var mtdid = mtid + '-def';
	var data_id = mtdid + '-data';
	var row_id = mtdid + '-tr';
	
	var fld_debit_rate_id = mtdid + '-fld-debitRate';
	var fld_debit_maxfee_id = mtdid + '-fld-debitMaxFee';
	var fld_debit_chnlratio_id = mtdid + '-fld-debitChnlRatio';
	var fld_credit_rate_id = mtdid + '-fld-creditRate';
	var fld_credit_maxfee_id = mtdid + '-fld-creditMaxFee';
	var fld_credit_chnlratio_id = mtdid + '-fld-creditChnlRatio';
	
	var mccgrp_id = mtid + '-cell';
	var $tbody = $('<tbody></tbody>').attr('id', mtid);
	var $tr = $('<tr></tr>').attr({id: row_id});
	$tr
		.append($('<td></td>').html(mccGrpDesc).addClass('text-center').attr({rowspan:'1', id: mccgrp_id}).append($('<input type="hidden" />').addClass('rate-input').attr({name:'mccGrp',value:_n.mccGrp})))
		.append($('<td></td>').html('*').addClass('text-center').append($('<input type="hidden" />').addClass('rate-input').attr({name:'mcc',value:'*'})))
		.append($('<td></td>').html('默认').addClass('text-center'))
	;	
	
	if ( readonly ) {
		$tr
			.append($('<td></td>').append($('<input />').addClass('rate-input text-right').attr({id: fld_debit_rate_id,name:'debitRate', xtype:'rate4',readonly:'readonly'})))
			.append($('<td></td>').append($('<input />').addClass('rate-input text-right').attr({id: fld_debit_maxfee_id,name:'debitMaxFee', xtype:'money',readonly:'readonly'})))
			.append($('<td></td>').append($('<input />').addClass('rate-input text-right').attr({id: fld_debit_chnlratio_id,name:'debitChnlRatio', xtype:'rate4',readonly:'readonly'})))
			.append($('<td></td>').append($('<input />').addClass('rate-input text-right').attr({id: fld_credit_rate_id,name:'creditRate', xtype:'rate4',readonly:'readonly'})))
			.append($('<td></td>').append($('<input />').addClass('rate-input text-right').attr({id: fld_credit_maxfee_id,name:'creditMaxFee', xtype:'money',readonly:'readonly'})))
			.append($('<td></td>').append($('<input />').addClass('rate-input text-right').attr({id: fld_credit_chnlratio_id,name:'creditChnlRatio', xtype:'rate4',readonly:'readonly'})))
		;
	} else {
		$tr
			.append($('<td></td>').append($('<input />').addClass('rate-input text-right').attr({id: fld_debit_rate_id,name:'debitRate',xtype:'rate4'})))
			.append($('<td></td>').append($('<input />').addClass('rate-input text-right').attr({id: fld_debit_maxfee_id,name:'debitMaxFee',xtype:'money'})))
			.append($('<td></td>').append($('<input />').addClass('rate-input text-right').attr({id: fld_debit_chnlratio_id,name:'debitChnlRatio',xtype:'rate4'})))
			.append($('<td></td>').append($('<input />').addClass('rate-input text-right').attr({id: fld_credit_rate_id,name:'creditRate',xtype:'rate4'})))
			.append($('<td></td>').append($('<input />').addClass('rate-input text-right').attr({id: fld_credit_maxfee_id,name:'creditMaxFee',xtype:'money'})))
			.append($('<td></td>').append($('<input />').addClass('rate-input text-right').attr({id: fld_credit_chnlratio_id,name:'creditChnlRatio',xtype:'rate4'})))
			.append($('<td></td>').append($('<a href="javascript:void(0)" title="添加"></a>').addClass('add-rate-data').attr({'id':data_id}).html('+').click(function(){ drawMccLine($tbody,_n.mccGrp,_prefix); })))
		;
	}
	
	$tbody.append($tr);
	$parent.append($tbody);
	// setValue
	$.jyform.fillInput(fld_debit_rate_id, _n.debitRate);
	$.jyform.fillInput(fld_debit_maxfee_id, _n.debitMaxFee);
	$.jyform.fillInput(fld_debit_chnlratio_id, _n.debitChnlRatio);
	$.jyform.fillInput(fld_credit_rate_id, _n.creditRate);
	$.jyform.fillInput(fld_credit_maxfee_id, _n.creditMaxFee);
	$.jyform.fillInput(fld_credit_chnlratio_id, _n.creditChnlRatio);
};

/** 加载空白分润规则  */
var loadBlankRate = function(table_id, prefix, _ro) {
	var $rateTable = $('#' + table_id);
	$rateTable.html('');
	// draw head
	$rateTable.append(drawHead(_ro));
	// draw body
	$(mccGrpObjList).each(function(_i,_n){
		drawMccTypeTbody($rateTable, prefix, _n, _ro);
	});
};
/** 加载服务商分润规则 */
var loadChannelRate = function(table_id, prefix, ratelist, _ro) {
	var $rateTable = $('#' + table_id);
	$rateTable.html('');
	// draw head
	$rateTable.append(drawHead(_ro));
	// draw body
	var defArr = new Array();
	sortByFields(ratelist, 'mccGrp,mcc');
	$(ratelist).each(function(_i,_n){
		if (_n.mcc == '*' ) defArr.push(_n);
	});
	$(mccGrpObjList).each(function(_i,_n){
		var _skip = false;
		$(defArr).each(function(_j,_m){
			if (_n.mccGrp == _m.mccGrp){
				_skip = true;
			}
		});
		if (_skip == false){
			defArr.push(_n);
		}
    });
	sortByFields(defArr, 'mccGrp,mcc');
	
	$(defArr).each(function(_i,_n){
		drawMccTypeTbody($rateTable,prefix, _n, _ro);
	});

    $('#upd-5000-def-fld-debitMaxFee').attr("readonly","readonly");
    $('#upd-5000-def-fld-creditRate').attr("readonly","readonly");
    $('#upd-5000-def-fld-creditMaxFee').attr("readonly","readonly");
    $('#upd-5000-def-fld-creditChnlRatio').attr("readonly","readonly");
    $('#upd-6000-def-fld-debitMaxFee').attr("readonly","readonly");
    $('#upd-6000-def-fld-creditRate').attr("readonly","readonly");
    $('#upd-6000-def-fld-creditMaxFee').attr("readonly","readonly");
    $('#upd-6000-def-fld-creditChnlRatio').attr("readonly","readonly");
    $('#upd-7000-def-fld-debitMaxFee').attr("readonly","readonly");
    $('#upd-7000-def-fld-creditRate').attr("readonly","readonly");
    $('#upd-7000-def-fld-creditMaxFee').attr("readonly","readonly");
    $('#upd-7000-def-fld-creditChnlRatio').attr("readonly","readonly");
    $.jyform.fillInput('upd-5000-def-fld-debitMaxFee', '');
    $.jyform.fillInput('upd-5000-def-fld-creditRate', '');
    $.jyform.fillInput('upd-5000-def-fld-creditMaxFee', '');
    $.jyform.fillInput('upd-5000-def-fld-creditChnlRatio', '');
    $.jyform.fillInput('upd-6000-def-fld-debitMaxFee', '');
    $.jyform.fillInput('upd-6000-def-fld-creditRate', '');
    $.jyform.fillInput('upd-6000-def-fld-creditMaxFee', '');
    $.jyform.fillInput('upd-6000-def-fld-creditChnlRatio', '');
    $.jyform.fillInput('upd-7000-def-fld-debitMaxFee', '');
    $.jyform.fillInput('upd-7000-def-fld-creditRate', '');
    $.jyform.fillInput('upd-7000-def-fld-creditMaxFee', '');
    $.jyform.fillInput('upd-7000-def-fld-creditChnlRatio', '');
    document.getElementById("upd-5000-def-data").style.display = "none";
    document.getElementById("upd-6000-def-data").style.display = "none";
    document.getElementById("upd-7000-def-data").style.display = "none";
	$(ratelist).each(function(_i,_n){
		if (_n.mcc != '*' ) {
			var $tbody = $('#'+prefix+'-'+ _n.mccGrp)
			drawMccLine($tbody, _n.mccGrp, prefix, _n , _ro);
		}
	});
};

/** 从div读取分润队则数组 */
var readRateList = function( rateDivId ) {
	var ratelist = new Array();
	$('#' + rateDivId + ' tbody tr').each(function(_i,_n){
		var rate = new Object();
		$(_n).find('.rate-input').each(function(_j,_m){
			$.inputToObj(rate, _m);
		});
		rate.mccDesc = rate.mcc=='*'?'默认':mccMap[rate.mcc].mccDesc;
		ratelist.push(rate);
	});
	return ratelist;
};
/** 导出div到excel */
var exportRateList = function(channelCode, ratelist) {
	$('#exportPageRateForm :input[name="channelCode"]').val(channelCode);
	$('#exportPageRateForm :input[name="ratelist"]').val($.toJSON(ratelist));
	$('#exportPageRateForm')[0].submit();
};
/*
$('#u_export').click(function(){
	exportRateList($('#u_channelCode').val(), readRateList('updRateTable'));
});
*/
</script>