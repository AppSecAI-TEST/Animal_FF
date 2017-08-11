<%@page import="freeboard.freeboardDto"%>
<%@page import="freeboard.ifreeboardDao"%>
<%@page import="freeboard.freeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.colum1 {
	text-align: right;
	}
.table_1 {
	border-collapse: collapse; 
	width: 100%;
}
</style>
</head>
<body>

<% 
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq.trim());

ifreeboardDao dao = freeboardDao.getInstance();

// count 증가
dao.readCount(seq);
// bbs 정보
freeboardDto dto = dao.getBbs(seq);
%>

<table class="table_1" border="1">
<col width="20%"><col width="80%">
<tr>
	<td colspan="2" align="right"> *는 필수 입력사항입니다</td>
</tr>
<tr>
	<td class="colum1">*등록인</td>
	<td><%=dto.getName() %> </td>
</tr>

<tr>
	<td colspan="2">-------------------------------------------------------------</td>
</tr>

<tr>
	<td>*제목</td>
	<td><%=dto.getTitle() %> </td>

</tr>

<tr>
	<td colspan="2">-------------------------------------------------------------</td>
</tr>

<tr>
	<td>*동물종류</td>
	<td>
		<%=dto.getAnimal_kind() %>
	</td>
	
</tr>

<tr>
	<td colspan="2">-------------------------------------------------------------</td>
</tr>

<tr>
	<td>*상세설명</td>
	<td>
		<%=dto.getContent() %> <br>
		
		<img src="./uploadimg/<%=dto.getImageName()%>">
	</td>
<tr>

<tr>
	<td colspan="2">-------------------------------------------------------------</td>
</tr>




</table>


</body>
</html>