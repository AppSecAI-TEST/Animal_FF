<%@page import="Member.MemberDao"%>
<%@page import="Member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
MemberDao dao = MemberDao.getInstance();
	String checkid = request.getParameter("checkid");
	boolean check = dao.check(checkid);
	System.out.println(check); 
%>
<%--
	MemberDao dao = MemberDao.getInstance();
	String checkid = request.getParameter("checkid");
	boolean check = dao.check(checkid);
	System.out.println(check);

	if(check) {
	
	 <script type="text/javascript">
			alert(<%=check%>);
			console.log("aaa");
		</script>
				
	} else {
	
		 <script type="text/javascript">
			alert("false");
			console.log("bbb");
		</script> 
	
	}
--%>
<%=check %>
