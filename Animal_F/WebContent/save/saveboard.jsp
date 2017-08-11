<%@page import="paging.PagingBean"%>
<%@page import="save.saveDto"%>
<%@page import="java.util.List"%>
<%@page import="save.saveDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>보호중입니다</title>


</head>
<body>
<a href="../main/index.jsp">HOME</a>
<button><a href="savewrite.jsp">글쓰기</a></button>


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
saveDao dao = saveDao.getInstance();
List<saveDto> list = dao.getBbsPagingList(paging);
%>

<table border="1">
<col width="70"><col width="70"><col width="280"><col width="150"><col width="70"><col width="70">

<tr>
	<th>사진</th><th>동물종류</th><th>상세설명</th><th>발견장소</th><th>발견날짜</th><th>조회</th>
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
		saveDto bbs = list.get(i);
%>
	<tr <%= i%2==0?"class='tda'":"class='tdb'" %>>
		
		<td><a href="./savedetail.jsp?seq=<%=bbs.getSeq()%>"><img src="./saveupimg/<%=bbs.getImg_name() %>" width="50" height="50"></a></td>
		<td><a href="./savedetail.jsp?seq=<%=bbs.getSeq()%>"><%= bbs.getAnimal_kind() %></a></td>
		<td><a href="./savedetail.jsp?seq=<%=bbs.getSeq()%>"><%= bbs.getTitle() %></a></td>
		<td><a href="./savedetail.jsp?seq=<%=bbs.getSeq()%>"><%= bbs.getFind_pleace1() %></a></td>
		<td><a href="./savedetail.jsp?seq=<%=bbs.getSeq()%>"><%= bbs.getFind_date() %></a></td>
		<td><a href="./savedetail.jsp?seq=<%=bbs.getSeq()%>"><%= bbs.getReadcount() %></a></td>
		
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