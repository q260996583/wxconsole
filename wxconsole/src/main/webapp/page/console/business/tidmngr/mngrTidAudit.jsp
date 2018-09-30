<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>终端信息维护</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/tidmngr/mngrTidAudit.js"></script>
</head>
<body>

<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	<tr>
		<td class="qlabel">终端编号</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name=tid size=20 /></td>
		<td class="qlabel">终端品牌</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name=tidBrand  maxlength="15" /></td>	
		<td class="qlabel">终端型号</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name=tidModel  maxlength="15" /></td>	
	</tr>
	
	<tr>
		<td class="qlabel">商户名称</td>
		<td class="qinput"><INPUT style="display: none;" id="qmid"
						name="mid" comparison="eq"> <INPUT id="qmerName"
						name="qmerName" ></td>
		<td class="qlabel">终端类型</td>
		<td class="qinput"><select id="tidType" comparison="eq"
						name="tidType"></select></td>	
		<td class="qlabel">服务商名称</td>
		<td class="qinput"><INPUT style="display: none;" id="qChanCode"
						name="channelCode" comparison="eq"> <INPUT id="qChanName"
						name="ChannelName" ></td>				
	</tr>
	<tr>
		<td class="qlabel">SIM卡号</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name=reserved1  maxlength="11" /></td>	
		<td class="qlabel">流量费收取方式</td>
		<td class="qinput"><select id="chargeType" comparison="eq"
			name="chargeType"></td>
		<td class="qlabel">审批状态</td>
		<td class="qinput"><select comparison="eq" qtype="string"
						name="confStat">
							<OPTION value="" selected="selected">不限</OPTION>
							<OPTION value="01">待审核</OPTION>
							<OPTION value="02">审核通过</OPTION>
							<OPTION value="03">驳回</OPTION>
					</select></td>
	</tr>
	<tr>
	  <td bgcolor="#ffffff"  colspan="6" align="center">
	  <input id="querybutton" class="bt" value="查询"  type="button">
	  <input class="bt" value="重置" type="reset" />
	  </td>
	</tr>
</table>
</form>
</div>
<DIV id="table"></DIV>
	<!-- 上级机构选择弹出窗口 -->
	<div id="merchantSelect" style="display: none;">
		<form>
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">

				<tr>
					<td class="qlabel">商户名称</td>
					<td class="qinput"><input type="text" name="merName"
						comparison="like" qtype="string" /></td>
					<td class="qlabel">商户代码</td>
					<td class="qinput"><input type="text" name="orgCode"
						comparison="like" qtype="string" /></td>
				</tr>
				<tr>
					<td colspan="4" align="center" bgcolor="#ffffff"><input
						type="button" class="bt qbutton" id="querysup" value="查询" /> <input
						type="reset" class="bt" value="重置" /></td>
				</tr>
			</table>
		</form>
	</div>


	<!-- 服务商选择弹出窗口 -->
	<div id="channelSelect" style="display: none;">
		<form>
			<table class="qtable" width="100%" cellspacing="1" cellpadding="1">

				<tr>
					<td class="qlabel">服务商名称</td>
					<td class="qinput">
						<input type="text" name="channelName" comparison="like" qtype="string" />
					</td>
					<td class="qlabel">服务商代码</td>
					<td class="qinput">
						<input type="text" name="channelCode" comparison="like" qtype="string" />
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center" bgcolor="#ffffff"><input
						type="button" class="bt qbutton" id="querysup" value="查询" /> <input
						type="reset" class="bt" value="重置" /></td>
				</tr>
			</table>
		</form>
	</div>


<div id="addtid" style="display: none;">
<form id="form1" >
<INPUT style="display: none;" id="confStat"	name="confStat" >
<INPUT style="display: none;" id="preserve2" name="preserve2" >
<table id="tidAddAudit" class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<TBODY>
		<TR >
			<TD class="flabel">终端号：</TD>
			<TD class="finput"><INPUT id=tid maxLength=8 name=tid readonly="readonly">
			</TD>
		</TR>
		<TR >
			<TD class="flabel">终端品牌：</TD>
			<TD class="finput"><INPUT id=tidBrand maxLength=50 name=tidBrand readonly="readonly">
			</TD>
		</TR>
		<TR >
			<TD class="flabel">终端型号：</TD>
			<TD class="finput"><INPUT id=tidModel maxLength=50 name=tidModel readonly="readonly">
			</TD>
		</TR>
		<TR >
			<TD class="flabel">终端类型：</TD>
			<TD class="finput"><input id="tidType" name="tidType" style="display: none;">
			<INPUT id=tidTypeZh maxLength=50 name=tidTypeZh readonly="readonly">
			</TD>
		</TR>
		<TR >
			<TD class="flabel">商户：</TD>
			<TD class="finput"><INPUT maxLength=15 id="mid"	name="mid" readonly="readonly" disabled>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">月流量费(元)：</TD>
			<TD class="finput"><INPUT id=monthFlowFee maxLength=50 name=monthFlowFee readonly="readonly">
			</TD>
		</TR>
		<TR >
			<TD class="flabel">联系人：</TD>
			<TD class="finput"><INPUT maxLength=20 id="person" name=person readonly="readonly">
			</TD>
		</TR>
		<TR >
			<TD class="flabel">联系人电话：</TD>
			<TD class="finput"><INPUT maxLength=20 id="phone" name=phone readonly="readonly">
			</TD>
		</TR>
		<TR >
			<TD class="flabel">SIM卡号：</TD>
			<TD class="finput"><INPUT id="reserved1" name=reserved1 readonly="readonly">
			<div id="reserved1Tip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">流量费收取方式：</TD>
			<TD class="finput"><INPUT id="chargeTypeZh" name=chargeTypeZh readonly="readonly">
			</TD>
		</TR>
		<TR >
			<TD class="flabel">工作时间：</TD>
			<TD class="finput"><INPUT maxLength=60 id="workTime" name=workTime readonly="readonly">
			<div id="workTimeTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">安装地址：</TD>
			<TD class="finput"><textarea  maxLength=200 id="address" name=address readonly="readonly"></textarea>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">版本号：</TD>
			<TD class="finput"><INPUT maxLength=10 id="tidVer" name="tidVer" readonly="readonly">
			</TD>
		</TR>
		<TR >
			<TD class="flabel">非借记卡单笔交易限额(万元)：</TD>
			<TD class="finput"><INPUT maxLength=9 id="tranLimit" name=tranLimit readonly="readonly">
			</TD>
		</TR>
	</TBODY>

</table>

<table id="tidUpdateAudit" class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<tr>
<td></td>
<td>原始信息</td>
<td>修改后信息</td>
</tr>
		<TR >
			<TD class="flabel">终端号：</TD>
			<td class="fcontent"><input class="qFormInput" id="tid1" type="text" maxlength="100" readonly="readonly"/></td>
			<TD class="finput"><INPUT class="qFormInput" id=tid maxLength=8 name=tid readonly="readonly"></TD>
		</TR>
		<TR >
			<TD class="flabel">终端品牌：</TD>
			<td class="fcontent"><input class="qFormInput" id="tidBrand1"  type="text" maxlength="100" readonly="readonly"/></td>
			<TD class="finput"><INPUT class="qFormInput" id=tidBrand maxLength=50 name=tidBrand readonly="readonly"></TD>
		</TR>
		<TR >
			<TD class="flabel">终端型号：</TD>
			<td class="fcontent"><input class="qFormInput" id="tidModel1"  type="text" maxlength="100" readonly="readonly"/></td>
			<TD class="finput"><INPUT class="qFormInput" id=tidModel maxLength=50 name=tidModel readonly="readonly"></TD>
		</TR>
		<TR >
			<TD class="flabel">终端类型：</TD>
			<td class="fcontent"><input class="qFormInput" id="tidTypeZh1"  type="text" maxlength="100" readonly="readonly"/></td>
			<TD class="finput"><INPUT class="qFormInput" id="tidTypeZh" maxLength=50 name=tidTypeZh readonly="readonly"></TD>
		</TR>
		<TR >
			<TD class="flabel">商户：</TD>
			<td class="fcontent"><input class="qFormInput" id="mid1"  type="text" maxlength="100" readonly="readonly"/></td>
			<TD class="finput"><INPUT class="qFormInput" maxLength=15 id="mid"	name="mid" readonly="readonly"></TD>
		</TR>
		<TR >
			<TD class="flabel">月流量费(元)：</TD>
			<td class="fcontent"><input class="qFormInput" id="monthFlowFee1" type="text" maxlength="100" readonly="readonly"/></td>
			<TD class="finput"><INPUT class="qFormInput" id=monthFlowFee maxLength=50 name=monthFlowFee readonly="readonly"></TD>
		</TR>
		<TR >
			<TD class="flabel">联系人：</TD>
			<td class="fcontent"><input class="qFormInput" id="person1" type="text" maxlength="100" readonly="readonly"/></td>
			<TD class="finput"><INPUT class="qFormInput" maxLength=20 id="person" name=person id="person" readonly="readonly"></TD>
		</TR>
		<TR >
			<TD class="flabel">联系人电话：</TD>
			<td class="fcontent"><input class="qFormInput" id="phone1"  type="text" maxlength="100" readonly="readonly"/></td>
			<TD class="finput"><INPUT  class="qFormInput" maxLength=20 id="phone" name=phone readonly="readonly"></TD>
		</TR>
		<TR >
			<TD class="flabel">流量费收取方式：</TD>
			<TD class="fcontent"><INPUT class="qFormInput" id="chargeTypeZh1"  type="text" maxlength="100" readonly="readonly"></TD>
			<TD class="finput"><INPUT  class="qFormInput" maxLength=20 id="chargeTypeZh" name=chargeTypeZh readonly="readonly">
			<INPUT style="display: none;" id="chargeType" 	name="chargeType" readonly="readonly"> </TD>
		</TR>
		<TR >
			<TD class="flabel">工作时间：</TD>
			<td class="fcontent"><input class="qFormInput" id="workTime1"  type="text" maxlength="100" readonly="readonly"/></td>
			<TD class="finput"><INPUT class="qFormInput" maxLength=60 id="workTime" name=workTime readonly="readonly"></TD>
		</TR>
		<TR >
			<TD class="flabel">安装地址：</TD>
			<td class="fcontent"><textarea class="qFormInput" id="address1"  type="text" readonly="readonly"></textarea></td>
			<TD class="finput"><textarea  class="qFormInput"  id="address" name=address readonly="readonly"></textarea></TD>
		</TR>
		<TR >
			<TD class="flabel">版本号：</TD>
			<td class="fcontent"><input class="qFormInput" id="version1" type="text" maxlength="100" readonly="readonly"/></td>
			<TD class="finput"><INPUT class="qFormInput" maxLength=10 id="version" name="version" readonly="readonly"></TD>
		</TR>
		<TR >
			<TD class="flabel">非借记卡单笔交易限额(万元)：</TD>
			<td class="fcontent"><input class="qFormInput" id="tranLimit1"  type="text" maxlength="100" readonly="readonly"/></td>
			<TD class="finput"><INPUT class="qFormInput" maxLength=9 id="tranLimit" name=tranLimit readonly="readonly"></TD>
		</TR>
		
	</table>

		<table>
				<tr><td class="flabel">审核描述:</td> 
				<td  class="fcontent"><input class="qFormInput" id="confRmk" name="confRmk" type="text" maxlength="50" /></td></tr>
		</table>
			
</form>
</div>

</body>
</html>