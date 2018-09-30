<%@ page language="java" contentType="text/html; charset=utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<% 
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1 
	response.setHeader("Pragma","no-cache"); //HTTP 1.0 
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server 
	
	%>
  
<script type="text/javascript">
$(document).ready(function(){
var menudata = <s:text name="resData"/>;
menudata = menudata[0].children;
function menusort(a,b){
				if(a.sort<b.sort)
				return -1;
				else return 1;				
				};
				
		function menutree(parend,list){
				list.sort(menusort);			
				$.each(list,function(i,n){ 
				var li=$('<li></li>').addClass('accessible').appendTo(parend);
				 if(n.leaf!=true){
				
				     li.html('<a href='+n.href+'>'+n.nodeShowName+'&raquo;</a>')
				      var ul=$('<ul></ul>').appendTo(li);
					    menutree(ul,n.children);
				}
				else {
			      	 li.html('<a href='+n.href+'>'+n.nodeShowName+'</a>')
				}				
			});			
		}
		
		var ul= $('<ul></ul>').addClass('jd_menu').appendTo('#menu');
		menutree(ul,menudata);						
		
	$('ul.jd_menu').jdMenu(); 
		
		});
</script>  

</head>
<body>
<div id='menu'></div>
</body>
</html>