<%@page import="Member.MemberDto"%>
<%@page import="Member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>regiAf</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd1");
		String phone = request.getParameter("phone")+"-";
		phone = phone + request.getParameter("phone1")+"-";
		phone = phone + request.getParameter("phone2");
		String email = request.getParameter("email") + request.getParameter("email_select");
		String addrNum = request.getParameter("addrNum");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String gender = request.getParameter("gender");

		MemberDao dao = MemberDao.getInstance();
		boolean isS = dao.addMember(new MemberDto(0, name, id, pwd, phone, email, addrNum, addr1, addr2, gender, 3));

		if (isS) {
	%>
		<script type="text/javascript">
			alert("성공적으로 가입하셨습니다");
			location.href = 'index.jsp';
		</script>
	<%} else {	%>
		<script type="text/javascript">
			alert("다시 기입하십시오");
			location.href = 'regi.jsp';
		</script>
	<%}%>



</body>
</html>



