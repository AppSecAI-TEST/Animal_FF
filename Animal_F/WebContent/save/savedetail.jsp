<%@page import="save.saveDto"%>
<%@page import="save.saveDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>savedetail</title>
</head>
<body>

<h2>보호중인 유기동물 상제정보</h2>

<% 
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq.trim());

saveDao dao = saveDao.getInstance();

// count 증가
dao.readCount(seq);
// bbs 정보
saveDto dto = dao.getBbs(seq);
%>

<table width="740" border="1" align="center">
<col width="100"><col width="270"><col width="100"><col width="270">
	<tr>
		<td>등록인</td>
		<td><%= dto.getUser_name() %></td>
		<td>발견한 날짜</td>
		<td><%= dto.getFind_date() %></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td><%= dto.getUser_ph() %></td>
		<td>성별</td>
		<td><%= dto.getAnimal_gender() %></td>
	</tr>
	<tr>
		<td>발견한 장소</td>
		<td colspan="3"><%= dto.getFind_pleace1() %></td>
	</tr>
	<tr>
		<td>글제목</td>
		<td colspan="3"><%= dto.getTitle() %></td>
	</tr>
	<tr>
		<td>내용</td>
		<td colspan="3">
			<%= dto.getContent() %>
		</td>
	</tr>
	<tr>
		<td colspan="2"><%= dto.getImg_name() %></td>
		<td colspan="2"></td>
	</tr>
</table>

</body>
</html>