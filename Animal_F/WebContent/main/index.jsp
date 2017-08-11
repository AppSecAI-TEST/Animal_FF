<%@page import="save.saveDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
Class.forName("oracle.jdbc.driver.OracleDriver");
saveDao.getInstance();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>
      Animal_F 입니다!!!!!
    </title>
    
    <script src="http://code.jquery.com/jquery-1.7.2.min.js" type="text/javascript"></script>
	<script src="js/jquery.cookie.js" type="text/javascript"></script>
    
    <style type="text/css">
		*{margin:0;padding:0}
		html,body{height:100%}
		body{display:table;width:100%}
		#header,#footer{display:table-row;width:100%;height:1px}
		#container{display:table-row;width:100%;height:100%}
		
		#header,#footer{background-color:#F00}
		#container{background-color:#0F0}
	</style>
	
	
  </head>
  <body >  
  
		<script type="text/javascript">
			$(document).ready(function () {
				$("#container").load("./main.jsp");
				
				$("#fbmenu").click(function () {
					$("#container").load("../board/freeboard.jsp");
				});				
			});	         
		</script>
		  
	<div id="header">
		<table border='1' bgcolor='#F0F0F0' align='center' style="border-collapse: collapse; width: 100%">
			<tr height="10%">
				<td colspan="4">
					<table style="width: 100%">
					<col width="33%">  <col width="34%"> <col width="33%">
						<tr>
							<td >1 </td>
							<td align="center"><img src="./image/mainlogo.PNG"> </td>
							<td align="right" valign="top"> <a href="./index.jsp">Home</a>
								<a href="../login/login.jsp">로그인</a>
								<a href="../login/regi.jsp">회원가입</a>
							 </td>
						</tr>
					</table>
				 </td>
			</tr>
	      <tr bgcolor='#BDDD7D' height="10%">
	        <td width='200' align='center'>
	          <a href='doc1.html' target='view'>찾습니다</a>
	        </td>
	        <td width='200' align='center'>
	          <a href='../save/saveboard.jsp' target='view'>보호중입니다</a>
	        </td>
	        <td width='200' align='center'>
	          <a href='#' target='view'>알바</a>
	        </td>
	        <td width='200' align='center'>
	        <a href='../board/freeboard.jsp' target='view'>자유게시판</a>
	         

	        </td>
	      </tr>
	      </table>
	      
	      </div>

	
		<div id="container">
			
				
		</div>
		
		<div id="footer">
			<table width="100%" border="1">
   				<col width="20%"><col width="20%"><col width="40%"><col width="20%">
   				<tr>
   					<td colspan="4">
   						<img src="../board/image/line.PNG" width="100%">
   					</td>
   				</tr>
   				<tr> 
   					<td> 1</td>
   					<td><img src="./image/mainlogo.PNG" width="200px" height="50px"></td>
   					<td>왜안되니?</td>
   					<td>2 </td>
   				</tr>
   			</table>
		</div>		
  </body>	
</html>