<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<html>
  <head>
  <!-- 	<link rel="shortcut icon" href="images/favicon.ico"  type="image/x-icon" />
  	<link rel="stylesheet" href="css/login_style.css" type="text/css"/> -->
  </head>
  
  <body>
  <font style="font-family: Arials; font-weight: bold; font-size: 24px; ">提示信息: </font>
  <br />
  <hr />
  	<table>
  		<tr><td>&nbsp;</td></tr>
  		<tr>
  			<td style="font-size: 20">&nbsp;&nbsp;<s:text name="#request.exceptionMsg"/></td>
  		</tr>
  	</table>
    
  </body>
</html>
