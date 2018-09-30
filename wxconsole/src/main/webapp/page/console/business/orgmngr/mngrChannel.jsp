<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>服务商信息维护</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/orgmngr/mngrChannel.js"></script>

</head>
<body>

<div id="queryCondition"
	style="background-color: #FBFEFF;padding: 5px;">
<form id="queryForm" name="queryForm" action="#" method="post"
	style="padding: 0px; margin: 0px;">
<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	<tr>
		<td class="qlabel">服务商名称</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name=channelName size=20 /></td>
		<td class="qlabel">服务商编号</td>
		<td class="qinput"><input type="text" value="" comparison="like"
			qtype="string" name=channelCode  maxlength="15" /></td>			
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
<div id="supBrhIdSelect" style="display: none;">
	<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	
		<tr>
		<td class="qlabel">机构名称</td>
		<td class="qinput">
		<input type='hidden' id="pbrhId"  name="brhId" class="param"/>
		<input type="text" name="brhNm" comparison="like" qtype="string"/></td>
			<td class="qlabel">机构代码</td>
		<td class="qinput"><input  type="text" name="brhId" comparison="like" qtype="string"/></td>
			<td class="qlabel">机构类型</td>
		<td class="qinput"><select name="brhTypeCd" comparison="like"><option value="_1__">销账机构</option><option value="__1_">收单机构</option>  </select></td>
		</tr>
		<tr>
		  <td colspan="6" align="center" bgcolor="#ffffff"><input type="button" class="bt qbutton" id="querysup"  value="查询"/></td>
		</tr>
</table>
</div>


<div id="addchannel" style="display: none;">
<form id="form1" >
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<TBODY>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>机构号：</TD>
			<TD class="finput"><INPUT id=brhId maxLength=15 name=brhId>
			<div id="brhIdTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">机构级别：</TD>
			<TD class="finput">
			<SELECT id="brhLevel" name="brhLevel">				
			</SELECT></TD>
		</TR>

		<TR >
			<TD class="flabel">机构所属省份</TD>
			<TD class="finput"><SELECT id="brhArea" name="brhArea">
			</SELECT></TD>

		</TR>
		<TR onclick ="change();">
			<TD class="flabel">机构类型：</TD>
			<TD class="finput"><INPUT type=checkbox  class="ignore"
				name=brh_type_zhifu>支付&nbsp; <INPUT type=checkbox class="ignore"
				name=brh_type_chuzhang>销账方&nbsp; <INPUT type=checkbox class="ignore"
				name=brh_type_qudao>收单方&nbsp; <INPUT type=checkbox class="ignore"
				name=brh_type_shanghu>商户&nbsp;
			<div id="brhTypeCdTip"></div>

			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>上级机构编号：</TD>
			<TD class="finput"><INPUT maxLength=15 id="supBrhId"
				name="supBrhId" readonly="readonly">
			<div id="supBrhIdTip"></div>
			</TD>
		</TR>
		<!--<TR >
			<TD class="flabel">状态标志：</TD>
			<TD class="finput">
			<SELECT id="brhDenyIn" name="brhDenyIn" >
				<OPTION value=0>禁止</OPTION>
					<OPTION selected value=1>开放</OPTION>
			</SELECT>
			<div id="brhDenyInTip"></div>
			</TD>
		</TR>
		--><TR >
			<TD class="flabel">机构签到状态：</TD>
			<TD class="finput"><SELECT name="brhStatus" id="brhStatus">
				<OPTION value=0>签退</OPTION>
				<OPTION selected value=1>签到</OPTION>
			</SELECT>
			<div id="brhStatusTip"></div>
			</TD>
		</TR>
		
				<TR >
			<TD class="flabel">机构销前/销后：</TD>
			<TD class="finput"><SELECT name="reservedIn" id="reservedIn">
				<OPTION value=0>销前</OPTION>
				<OPTION selected value=1>销后</OPTION>
			</SELECT>
			<div id="reservedInTip"></div>
			</TD>
		</TR>
		
		<TR >
			<TD class="flabel"><font color=red>&nbsp;*</font>机构统计表：</TD>
			<TD class="finput"><SELECT name="reportFlag" id="reportFlag">
				<OPTION value=0 id="reportFlag2">不出表</OPTION>
				<OPTION selected value=1 id="reportFlag1">出表</OPTION>
			</SELECT>
			<div id="reportFlagTip"></div>
			</TD>
		</TR>
		
		<TR >
			<TD class="flabel">是否出对账文件：</TD>
			<TD class="finput"><SELECT name="reconFlag" id="reconFlag">
				<OPTION selected value=1>是</OPTION>
				<OPTION value=0>否</OPTION>
			</SELECT>
			<div id="reconFlagTip"></div>
			</TD>
		</TR>
		
		<TR id="merConfig">
			<TD class="flabel">商户配置：</TD>
			<TD class="finput">商户类型：
			<SELECT name="merKind" id="merKind">
				<OPTION selected value="">不限</OPTION>
				<OPTION value=00>信息公司</OPTION>
				<OPTION value=01>企业公司</OPTION>
			</SELECT>
			商户证书上传：
			<input id="upLoadfile" type="file"
				name="upLoadfile" />
			<div id="merKindTip"></div>
			</TD>
		</TR>
		
		<TR id="bankInfo">
			<TD class="flabel" >支付机构配置：</TD>
			<TD class="finput">支付机构类型
			<SELECT name="bankType" id="bankType">
				<OPTION selected value=1>网银</OPTION>
				<OPTION value=2>直连</OPTION>
			</SELECT>         
			支付机构类别
			<SELECT name="bankCategory" id="bankCategory">
				<OPTION selected value=1>网银</OPTION>
				<OPTION value=2>银行直连</OPTION>
				<OPTION value=3>申付卡</OPTION>
				<OPTION value=4>第三方机构</OPTION>
			</SELECT><br/>
			卡号是否加密
			<SELECT name="cardnoEncrypt" id="cardnoEncrypt">
				<OPTION selected value=1>加密</OPTION>
				<OPTION value=0>不加密</OPTION>
			</SELECT>         
			卡密码是否加密
			<SELECT name="cardpsdEncrypt" id="cardpsdEncrypt">
				<OPTION selected value=1>加密</OPTION>
				<OPTION value=0>不加密</OPTION>
			</SELECT>         
			排序编号
			<INPUT maxLength=10 id="bankDir"
				name="bankDir">
			<div id=""></div>
			</TD>
		</TR>
		
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>机构全称：</TD>
			<TD class="finput"><textarea id="brhNm"  name="brhNm" ></textarea>
			<div id="brhNmTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>机构简称：</TD>
			<TD class="finput"><INPUT maxLength=6 id="reserved1"
				name=reserved1>
			<div id="reserved1Tip"></div>
			</TD>
		</TR>
     <TR >
			<TD class="flabel">机构英文名称：</TD>
			<TD class="finput"><textarea id="brhNmEn"  name="brhNmEn"></textarea>
			<div id="brhNmEnTip"></div>
			</TD>
		</TR>

		<TR >
			<TD class="flabel">机构地址：</TD>
			<TD class="finput"><textarea id="brhAddr" name=brhAddr></textarea>
			<div id="brhAddrTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">联系电话：</TD>
			<TD class="finput"><INPUT maxLength=15 id="brhTel"
				name=brhTel>
			<div id="brhTelTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">传真：</TD>
			<TD class="finput"><INPUT maxLength=15 id="brhFax"
				name=brhFax>
			<div id="brhFaxTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">url地址：</TD>
			<TD class="finput"><textarea id="brhUrl" name=brhUrl></textarea>
			<div id="brhUrlTip"></div>
			</TD>
		</TR>
		<!-- 
		<TR >
			<TD class="flabel">机构银行帐号：</TD>
			<TD class="finput"><INPUT maxLength=40 style="width: 350px;"
				id="brhAcctId" name=brhAcctId>
			<div id="brhAcctIdTip"></div>
			</TD>
		</TR>
 		-->
		<TR >
			<TD class="flabel">机构索引号：</TD>
			<TD class="finput"><INPUT maxLength=3 id="brhKey" style="width: 300px;"
				name=brhKey>
			<div id="brhKeyTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">数据密钥：</TD>
			<TD class="finput"><INPUT maxLength=32 id="dataKey" style="width: 300px;"
				 name=dataKey>
			<div id="dataKeyTip"></div>
			</TD>
		</TR>
		
		<TR >
			<TD class="flabel">mac密钥：</TD>
			<TD class="finput"><INPUT maxLength=32 id="macKey" style="width: 300px;"
				name=macKey>
			<div id="macKeyTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel" style="vertical-align: top;padding-right: 5px;">校验位 :  </TD>
			<TD class="finput"><INPUT maxLength=16 id="reserved2" style="width: 300px;" value="0000000000000000"
				 name=reserved2>
			<div id="reserved2Tip" style=""></div><p style="font-size:12px;color:#5a5a5a;margin-top: 0px;margin-bottom: 0px;">第1位1表示需验mac，第2位1表示需解密账号，第3位1表示需解密密码，
				第4位1表示需加mac，第5位1表示需加密<br/>账号，第6位1表示需加密密码，
				第7位数值表示验mac方式，第8位数值表示解密账号方式，第9位数值表示解密密码<br/>方式，
				第10位数值表示生成mac方式，第11位数值表示加密账号方式，第12位数值表示加密密码方式</p>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">杂类项：</TD>
			<TD class="finput">
			
			<textarea id="misc" name=misc></textarea>
			<div id="miscTip"></div>
			</TD>
		</TR>

	</TBODY>

</table>
<input id="formreset" style="display: none;" type="reset" /></form>
</div>

<div id="stopchannel" style="display: none;">
<form id="form3" >
<table class="ftable" cellpadding="1" cellspacing="1"  width="100%">
	<TBODY>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>机构号：</TD>
			<TD class="finput"><INPUT id=qbrhId maxLength=15 name=brhId disabled="disabled">
			<div id="brhIdTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel"><FONT color=red>&nbsp;*</FONT>停机描述：</TD>
			<TD class="finput"><INPUT id=bussBrhRemark maxLength=200 name=bussBrhRemark size="50">
			<div id="bussBrhRemarkTip"></div>
			</TD>
		</TR>
		<TR >
			<TD class="flabel">机构状态：</TD>
			<TD class="finput">
			<input type="radio" id="result10"  name="bussBrhStatus" value="01" />停机维护
	         <input type="radio" id="result20" name="bussBrhStatus" value="00"/>正常启用
			<div id="bussBrhStatusTip"></div>
			</TD>
		</TR>
	</TBODY>
</table>
<input id="formreset" style="display: none;" type="reset" /></form>
</div>

</body>
</html>