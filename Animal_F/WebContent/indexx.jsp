<%@page import="Member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<a href="login/login.jsp">로그인</a>

<%
MemberDto dto = (MemberDto)session.getAttribute("login");
String name = "게스트";
System.out.println(name);
if(dto != null){
	name = dto.getName();
	System.out.println(name);
}else{
	
}
%>
AAAAAAAA
<%=name %>님안녕하세요
</body>
</html>