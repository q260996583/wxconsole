<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>操作员管理</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>

<script type="text/javascript" src="js/validator/formValidatorRegex.js"></script>
<script type="text/javascript" src="pagejs/console/business/consoleoper/consoleoper.js"></script>

</head>
<body>
        <div id="queryCondition">
            <form id="queryForm" name="queryForm" action="#" method="post">
            <table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	<tr>
		<td class="qlabel"> 操作员登录名:</td>
		<td class="qinput"><input  id="q_login_nm" name="login_nm"
			type="text" maxlength="40" qtype="string" comparison="like" /></td>
		<td class="qlabel">操作员姓名:</td>
		<td class="qinput"><input  id="q_op_name" name="op_name"
			type="text" maxlength="10" qtype="string" comparison="like" /></td>
		<td class="qlabel"> 操作员号: </td>
		<td class="qinput"><input id="q_opr_id" name="opr_id" type="text"
			maxlength="15" qtype="string" comparison="like" /></td>
	</tr>
	<tr>
	    <td class="qlabel"> 备注:</td>
		<td class="qinput"><input  id="q_misc" name="misc"
			type="text" maxlength="40" qtype="string" comparison="like" /></td>
	    <td class="qlabel"> 隶属机构:</td>
		<td class="qinput"><input  id="q_org_code" name="org_code"
			type="text"   maxlength="15" qtype="string" comparison="eq" /></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td class="qbutton" colspan="10" align="center">
		<button class='bt' id="queryBtn" type="button">查 询</button>
		<button class='bt' id="change" type="reset">重置</button>
		</td>
	</tr>
</table>
            </form>
        </div>
        <DIV id="table">
        </DIV>




<div id="addOper" style="display: none;">
<form id="form1" action="doInsertOper.action">
<table class="ftable" cellpadding="1" cellspacing="1" width="100%">
	<tr>
		<td class="flabel"><font color="red">*</font>操作员登录名:</td>
		<td class="fcontent"><input class="cdnInput" id="login_nm"
			name="login_nm" maxLength="40" /><div id="login_nmTip"></div></td>
	</tr>
	<tr>
		<td class="flabel">隶属机构:</td>
		<td class="fcontent"><input class="cdnInput" id="org_code"
			name="org_code" maxLength="15" readonly="readonly"/><div id="org_codeTip"></div></td>
	</tr>
	<tr>
		<td class="flabel"><font color="red">*</font>操作员姓名:</td>
		<td class="fcontent"><input class="cdnInput" id="op_name"
			name="op_name" maxLength="10" /><div id="op_nameTip"></div></td>
	</tr>
	<tr>
		<td class="flabel"><font color="red">*</font>登录密码:</td>
		<td class="fcontent"><input class="cdnInput" id="password"
			name="password" maxLength="12" type="password" /><div id="passwordTip"></div></td>
	</tr>

	<tr>
		<td class="flabel"><font color="red">*</font>确认密码:</td>
		<td class="fcontent"><input class="cdnInput" id="pwdchk"
			name="pwdchk" maxLength="12" type="password" /><div id="pwdchkTip"></div></td>
	</tr>


	<tr>
		<td class="flabel"><font color="red">*</font>证件类型:</td>
		<td class="fcontent"><select id="cert_type_no"
			name="cert_type_no">
			<option value="01" selected="selected">身份证</option>
			<!--  <option value="00" >其他证件</option>-->
		</select><div id="cert_type_noTip"></div></td>
	</tr>

	<tr>
		<td class="flabel"><font color="red">*</font>证件号:</td>
		<td class="fcontent"><input class="cdnInput" id="cert_no"
			name="cert_no" maxLength="18" /><div id="cert_noTip"></div></td>
	</tr>
	<tr>
		<td class="flabel"><font color="red">*</font>操作员部门:</td>
		<td class="fcontent"><select id="groupNo" name="groupNo">
			<option value=""></option>
		</select><div id="groupNoTip"></div></td>
	</tr>
	<tr>
		<td class="flabel">操作员状态:</td>
		<td class="fcontent"><select id="status" name="status">
			<option value="1">失效</option>
			<option value="0" selected="selected">启用</option>
		</select><div id="statusTip"></div></td>
	</tr>

	<tr>
		<td class="flabel">电话:</td>
		<td class="fcontent"><input class="cdnInput" id="phone"
			name="phone" maxLength="40" /><div id="phoneTip"></div></td>
	</tr>
	<tr>
		<td class="flabel">E-MAIL:</td>
		<td class="fcontent"><input class="cdnInput" id="email"
			name="email" maxLength="40" /><div id="emailTip"></div></td>
	</tr>
	<tr>
		<td class="flabel">操作员描述:</td>
		<td class="fcontent"><textarea id='description'
			name="description" cols="60" rows="8" maxLength="200"></textarea><div id="descriptionTip"></div></td>
	</tr>
	<tr>
		<td class="flabel">备注:</td>
		<td class="fcontent"><textarea id='misc' name="misc" cols="60" rows="8"></textarea><div id="miscTip"></div></td>
	</tr>
	<tr>
		<td class="flabel">预留信息:</td>
		<td class="fcontent"><input class="cdnInput" id="reserved2" name="reserved2" maxLength="60" /><div id="reserved2Tip"></div></td>
	</tr>
</table>
<input id="formreset" style="display: none;" type="reset" /></form>
</div>







 <div id="tpermission" class="detailDialog" style="display:none;">
		<table >
			<tr>
            <td class="detailtd">
            <div  class="titleDiv">
                <div class="dtitle" >
                                          个人信息
                </div>
            </div>
            
			<form id="form2" >
    		<table class="ftable"  cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
    			<TBODY>    			
     			<tr>
    			<td class="flabel">  操作员登录名: </td>
    			<td class="fcontent">   <input class="qFormInput" id="p_login_nm" name="login_nm" type="text" maxlength="40" disabled="disabled"/></td>
    			</tr>
    			<tr>
    			<td class="flabel">   操作员姓名:</td>
    			<td class="fcontent">  <input class="qFormInput" id="p_op_name" name="op_name" type="text" maxlength="40" disabled="disabled"/> </td>
    			</tr>
    			<tr>
    			<td class="flabel"> 操作员号:</td>
    			<td class="fcontent"><input class="qFormInput" id="p_opr_id" name="opr_id" type="text" maxlength="15" disabled="disabled"/></td>
    			</tr>
               </TBODY>
                </table>               
            </form>
			</td>
            
            <td width="10"></td>
            
            <td>
             <div  class="titleDiv">
                <div class="dtitle">
                                       可分配角色:
                </div>
            </div>
                <div class="restree">
            <div id="roleGrid" ></div>
            </div>
                </td>
            </tr>		
		</table>
</div>
        









<div id="changepwd" style="display:none">
	<table class="ftable"  >
	<tr>
				<td class="flabel">
				原始密码
				</td>
				<td class="fcontent">
				<input name="passwdOrg" type="password"/>
				</td>
		</tr>
	
		<tr>
				<td class="flabel">
				新密码
				</td>
				<td class="fcontent">
				<input name="passwd" type="password"/>
				</td>
		</tr>
		<tr>
				<td class="flabel">
				 重复新密码
				</td>
				<td class="fcontent">
				<input name="passwdrep" type="password"/>
				</td>
		</tr>
	</table>
</div>





    	
    		<!-- 上级机构选择弹出窗口 -->
<div id="supOrgCodeSelect" style="display: none;">
<form>
	<table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
	
		<tr>
		<td class="qlabel">机构名称</td>
		<td class="qinput">
		<input type='hidden' id="porgCode"  name="orgCode" class="param"/>
		<input type="text" name="orgName" comparison="like" qtype="string"/></td>
			<td class="qlabel">机构代码</td>
		<td class="qinput"><input  type="text" name="orgCode" comparison="like" qtype="string"/></td>
			
		</tr>
		<tr>
		  <td colspan="4" align="center" bgcolor="#ffffff"><input type="button" class="bt qbutton" id="querysup"  value="查询"/>
           <input type="reset" class="bt"   value="重置"/></td>
		</tr>
</table>
</form>
</div>
    </body>
</html>