<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
   <h1>login</h1>
   <table border= "1">
      <form action = "loginAf.jsp">
      <tr>
         <td>아이디</td>
         <td><input type="text" id="id" name="id"></td>
      </tr>
      <tr>
         <td>password</td>
         <td><input type="text" id="pwd" name="pwd"></td>
      </tr>
      <tr>
         <td colspan = "2">
            <input type = "submit" value = "로그인">
         </td>
      </tr>
      </form>
   </table>
   <a href="regi.jsp">회원가입</a>
</body>
</html>






