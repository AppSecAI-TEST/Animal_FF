<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String actionPath = request.getParameter("actionPath");

String sNowPage = request.getParameter("nowPage");				// 현재 페이지

String sTotalCount = request.getParameter("totalCount");		// 올린 총 글수

String sCountPerPage = request.getParameter("countPerPage");	// 페이지의 최대 갯수 == 10

String sBlockCount = request.getParameter("blockCount");		// 페이지당 글의 갯수 == 10

int nowPage = (sNowPage == null || sNowPage.trim().equals(""))?1:Integer.parseInt(sNowPage);
int totalCount = (sTotalCount == null || sTotalCount.trim().equals(""))?0:Integer.parseInt(sTotalCount);
int countPerPage = (sCountPerPage == null || sCountPerPage.trim().equals(""))?1:Integer.parseInt(sCountPerPage);
int countPerBlock = (sBlockCount == null || sBlockCount.trim().equals(""))?1:Integer.parseInt(sBlockCount);

int totalPage = (int)((totalCount-1)/countPerPage) + 1;

if(totalPage == 0) totalPage = 1;
System.out.println("totalPage : " + totalPage);

int totalBlock = (int)((totalPage-1)/countPerBlock);
int nowBlock = (int)((nowPage-1)/countPerBlock);

int firstPage = 0;
int prevPage = 0;
int nextPage = 0;
int lastPage = 0;

if(nowBlock > 0){
	firstPage = 1;
}
if(nowPage > 1){
	prevPage = nowPage - 1;
}

int startPage = nowBlock * countPerBlock + 1;
//11		  =	0		 * 10			 + 1
int endPage = countPerBlock * (nowBlock + 1);
//	10		  10			*	0 		+ 1

// 최대 페이지보다 끝 페이지가 큰 경우
if(endPage > totalPage) endPage = totalPage;

// 현재 페이지가 총 페이지 보다 작은 경우 현재 페이지에 +1한 값이 다음 페이지
if(nowPage < totalPage){
	nextPage = nowPage + 1;
}

// 현재 페이지가 총 블록보다 작은 경우 마지막 페이지에 총 페이지를 대입
if(nowBlock < totalBlock){
	lastPage = totalPage;
}
%>

<script>
function gotoPage(pageNum){
	var objForm = document.frmPaging;
	objForm.nowPage.value = pageNum;
	objForm.submit();
}
</script>

<form name="frmPaging" method="get" action="<%=actionPath %>">
	<input type="hidden" name="nowPage" value="">
	
	<div align="center">
		<% if(firstPage > 0){ %>
		<a href="#" onclick="gotoPage('<%=firstPage%>')">처음으로</a>
		<% } %>
		
		<% if(prevPage > 0){ %>
		<a href="#" onclick="gotoPage('<%=prevPage%>')">이전</a>
		<% } %>
		
		<!-- [1][2][3] -->
		<% 
		for(int i = startPage; i <= endPage; i++){
			if(i == nowPage){ %>
				<%=i %>
			<%	
			}else{
			%>
				<a href = "#" onclick="gotoPage('<%=i %>')">[<%=i %>]</a>							
		<% 
			}
		} 
		%>
		
		<%
		if(nextPage > 0){
		%>
			<a href="#" onclick="gotoPage('<%=nextPage %>')">다음</a>
		<%
		}
		%>
		<%
		if(lastPage > 0){
		%>
			<a href="#" onclick="gotoPage('<%=lastPage %>')">마지막페이지</a>
		<%
		}
		%>
	</div>

</form>






