<%@page import="Member.MemberDto"%>
<%@page import="Member.MemberDao"%>
<%@page import="Member.iMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
</head>
<body>
<%
   String id = request.getParameter("id");
   String pwd = request.getParameter("pwd");
   
   iMemberDao dao = MemberDao.getInstance();
   MemberDto mem = dao.login(new MemberDto(null,pwd,id,null,null,3));
   
   if(mem != null && !mem.getId().equals("")){
      session.setAttribute("login", mem);
      session.setMaxInactiveInterval(30 * 60 );
      %>
      <script type="text/javascript">
         alert("안녕하세요 <%=mem.getId()%>님");
        location.href = '../indexx.jsp';
      </script>
   
   <%
   }else{
%>
   <script type="text/javascript">
   alert("아이디나 패스워드를 확인하십시오");
   location.href ='login.jsp';
   </script>
<%
} 
%>
<%-- <table border= "1">
      <form action = "login.jsp">
      <tr>
         <td><label><%=mem.getId()%>님</label></td>
      </tr>
      <tr>
         <td colspan = "2">
            <input type = "submit" value = "로그아웃">
         </td>
      </tr>
      </form>
   </table> --%>

</body>
</html>