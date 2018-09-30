<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>角色管理</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/consoleoper/roleMngrpageJs.js"></script>
</head>
<body>
        <div id="queryCondition">
            <form id="queryForm" name="queryForm" action="#" method="post">
            <table class="qtable" width="100%"  cellspacing="1" cellpadding="1" >
               
                <tr>
                    <td class="qlabel"> 角色ID: </td>
                    <td class="qinput"><input class="qFormInput" id="q_roleId" name="roleId" type="text" maxlength="10" qtype="string" comparison="like"/></td>
               
                   <td class="qlabel"> 角色名称: </td>
                     <td class="qinput"><input class="qFormInput" id="q_roleName" name="roleName" type="text" maxlength="64" qtype="string" comparison="like"/></td>
               
                  <td class="qlabel">机构名称:</td>
                 <td class="qinput"><input class="qFormInput" id="q_org_name" name="org_name" type="text" maxlength="15" qtype="string" comparison="like"/></td>
                </tr>
                               
                <tr>
                    <td class="qlabel">角色状态: </td>
                    <td class="qinput"><SELECT id=q_flag  comparison ="eq" name="flag">
		<OPTION value="" selected="selected">全部</OPTION>
			<OPTION value="0">启用</OPTION>
			<OPTION value="1">失效</OPTION>
		</SELECT>
                   <td class="qlabel"></td>
                   <td class="qinput"></td>
               
                  <td class="qlabel"></td>
                 <td class="qinput"></td>
                </tr>
                <tr>
                		<td class="qbutton" colspan="6" align="center">
  <input class='bt' id="queryBtn" value="查询"  type="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input value="重置" class='bt' type="reset" />
  </td>
  </tr>
                </table>
            </form>
        </div>
        <DIV id="table">
        </DIV>
        <div id="roleDetail_div" class="detailDialog" style="display:none;">
		<table >
			<tr>
            <td class="detailtd">
            <div  class="titleDiv">
                <div class="dtitle" >
                 角色信息
                </div>
            </div>
            
			<form id="form1" >
    		<table class="ftable"  cellpadding="1" cellspacing="1" bgcolor="#8392a5" width="100%">
    			<TBODY>
    			<tr>
    			<td class="flabel">角色ID</td>
    			<td class="fcontent"> <input class="qFormInput" id="role_id" name="roleId" type="text" maxlength="10" readonly="readonly"  disabled="disabled"/></td>
    			</tr>
    			<tr>
    			<td class="flabel">  角色名:</td>
    			<td class="fcontent"> <input class="qFormInput" id="roleName" name="roleName" type="text" maxlength="64" /> </td>
    			</tr>
    			<tr>
    			<td class="flabel"> 机构编号:</td>
    			<td class="fcontent">  <input class="qFormInput" id="org_code" name="org_code" type="text" maxlength="15" /></td>
    			</tr>
    		    <tr>
    			<td class="flabel">  启用标志:</td>
    			<td class="fcontent"> <select id="flag" name="flag" >
                        <option value="0" selected="selected">启用</option>
                        <option value="1" >失效</option>
                    </select>
                     <div id="flagTip">
                    </div>
                   </td>
    			</tr>
    			
    		   <tr>
    			<td class="flabel">    角色描述:</td>
    			<td class="fcontent"> <textarea id="role_desc" name="role_desc" rows="8" cols="30" style="float:left;"></textarea> </td>
    			</tr>
               </TBODY>
                </table>               
            </form>
			</td>
            <td width="10"></td>
            
            <td>
             <div  class="titleDiv">
                <div class="dtitle">
                     资源信息
                </div>
            </div>
                <div class="restree">
            <div id="resourceTree" ></div>
            
            </div>
                </td>
            </tr>		
		</table>
</div>
    	<div id="addRole" style="display: none;">
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