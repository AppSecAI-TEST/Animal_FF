<%@page import="freeboard.freeboardDto"%>
<%@page import="paging.PagingBean"%>
<%@page import="java.util.List"%>
<%@page import="freeboard.ifreeboardDao"%>
<%@page import="freeboard.freeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

    <script src="http://code.jquery.com/jquery-1.7.2.min.js" type="text/javascript"></script>


</head>
<body>
 
 <div>
 	
<a href="../main/index.jsp"> HOME</a>
<a href="./writefreeboard.jsp">글쓰기</a>
 
 </div>
 
 
<!-- 페이징 처리 정보의 교환 -->
<%
PagingBean paging = new PagingBean();
if(request.getParameter("nowPage") == null){
	paging.setNowPage(1);
}else{
	paging.setNowPage(Integer.parseInt(request.getParameter("nowPage")));
}
%>

<%
ifreeboardDao dao = freeboardDao.getInstance();
List<freeboardDto> list = dao.getBbsPagingList(paging);
%>


<table border="1">
<col width="70"><col width="70"><col width="280"><col width="100"><col width="150"><col width="70">

<tr>
	<th>No</th><th>사진</th><th>제목</th><th>작성인</th><th>날짜</th><th>조회</th>
</tr>

<%
if(list == null || list.size() == 0){
	%>
	<tr>
		<td colspan="6">작성된 글이 없습니다.</td>
	</tr>
	<%
}else{
	for(int i=0;i<list.size();i++){
		freeboardDto dto = list.get(i);
%>
	<tr>
		<td><%=i%></td>
		<td><a href="./detailfreeboard.jsp?seq=<%=dto.getSeq()%>"> <img src="./uploadimg/<%= dto.getImageName()%>" width="50px" height="50px"></a></td>
		<td><a href="./detailfreeboard.jsp?seq=<%=dto.getSeq()%>"><%= dto.getTitle() %></a></td>
		<td><a href="./detailfreeboard.jsp?seq=<%=dto.getSeq()%>"><%= dto.getName() %></a></td>
		<% String date = dto.getWdate().substring(0, 11); %>
		<td><a href="./detailfreeboard.jsp?seq=<%=dto.getSeq()%>"><%= date %></a></td>
		<td><a href="./detailfreeboard.jsp?seq=<%=dto.getSeq()%>"><%= dto.getReadcount() %></a></td> 
		
	</tr>
<%
	}
}
%>


</table>

<!-- include : paging.jsp -->
<jsp:include page="./paging.jsp">
	<jsp:param name="actionPath" value="./saveboard.jsp" />
	<jsp:param name="totalCount" value="<%=String.valueOf(paging.getTotalCount()) %>" />
	<jsp:param name="countPerPage" value="<%=String.valueOf(paging.getCountPerPage()) %>" />
	<jsp:param name="blockCount" value="<%=String.valueOf(paging.getBlockCount()) %>" />
	<jsp:param name="nowPage" value="<%=String.valueOf(paging.getNowPage()) %>" />
</jsp:include>


</body>
</html>