<%@page import="Member.MemberDto"%>
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


<%
Object ologin = session.getAttribute("login");
MemberDto mem = null;
mem = (MemberDto)ologin;
%>

</head>
<body>
<form action="writeaf.jsp" name="frm" id="frm" enctype="multipart/form-data" method="post">
<input type="hidden" name="id" id="id" value="${login.id} ">
<input type="hidden" name="auth" id="auth" value="${login.auth} ">
<input type="hidden" name="name" id="name" value="${login.name} ">
<table class="table_1" border="1">
<col width="20%"><col width="40%"><col width="40%">
<tr>
	<td colspan="3" align="right"> *는 필수 입력사항입니다</td>
</tr>
<tr>
	<td class="colum1">*등록인</td>
	<td colspan="2"> ${login.name} </td>
</tr>

<tr>
	<td colspan="3">-------------------------------------------------------------</td>
</tr>

<tr>
	<td>*제목</td>
	<td><input type="text" id="title" name="title"> </td>
	<td>*12글자까지만 글 목록에 노출됩니다</td>
</tr>

<tr>
	<td colspan="3">-------------------------------------------------------------</td>
</tr>

<tr>
	<td>*동물종류</td>
	<td colspan="2">
		<input type="radio" value="강아지" name="animalkind" id="animalkind">강아지
		<input type="radio" value="고양이" name="animalkind" id="animalkind">고양이
		<input type="radio" value="기타반려동물" name="animalkind" id="animalkind">기타 반려동물
	</td>
	
</tr>

<tr>
	<td colspan="3">-------------------------------------------------------------</td>
</tr>

<tr>
	<td>*상세설명</td>
	<td colspan="2">
	※ 게시판의 성격과 다른 글을 올리시면 이용이 정지 되 실 수 있습니다 <br>
	<textarea rows="10" cols="80" name="content" id="content" wrap="hard" style="ime-mode:active;resize: vertical;"></textarea>
	</td>
<tr>

<tr>
	<td colspan="3">-------------------------------------------------------------</td>
</tr>

<tr>
	<td>사진첨부</td>
	
	<td colspan="2">
		※ 사진첨부시 주의사항 <br>
		1. 등록 가능한 확장자는 jp(e)g, gif, png 입니다 <br>
		2. 사진 용량이 2MB가 보다 큰 경우 오류가 날 수 있습니다 <br>
		
		<table>
			<tr>
				<td>
					<input type="file" id="fileName" name="fileName" accept=".gif, .jpg, .png"  onChange="uploadImg_Change(this.value)" >
					<input type="hidden" name="imgWidth">
					<input type="hidden" name="imgHeight">
				</td>
				<td>
					<div id="sumnail"></div>
				</td>
			</tr>
		
		</table>
		
	</td>
</tr>

<tr>
	<td colspan="3">-------------------------------------------------------------</td>
</tr>

<tr>
	<td colspan="3">
		<input type="submit">
	</td>
</tr>


</table>

</form>

<script type="text/javascript">


//파일의 확장자를 가져옮
function getFileExtension( filePath )
{
    var lastIndex = -1;
    lastIndex = filePath.lastIndexOf('.');
    var extension = "";

	if ( lastIndex != -1 )
	{
	    extension = filePath.substring( lastIndex+1, filePath.len );
	} else {
	    extension = "";
	}
    return extension;
} 

//파일을 선택 후 포커스 이동시 호출
function uploadImg_Change(value)
{
    var src = getFileExtension(value);
    alert(src);
    if (src == "") {
    	// 파일이 안들어왔을때
        alert('올바른 파일을 입력하세요');
        document.getElementById('sumnail').innerHTML = '';
        document.getElementById('fileName').value = '';
        return ;
    } // 파일 확장자가 jp(e)g, gif, png외 들어 온 경우
    else if ( !( (src.toLowerCase() == "gif") || (src.toLowerCase() == "jpg") || (src.toLowerCase() == "jpeg" ) || (src.toLowerCase() == "png" ) ) ) {
    	alert("등록 가능한 확장자는 jp(e)g, gif, png 입니다. 다시 확인해 보세요");
    	document.getElementById('fileName').value = '';
    	document.getElementById('sumnail').innerHTML = '';
        return true;
 	}else{ // 이미지 파일로 성공적으로 작동하는경우
    
 	// 이미지 썸네일 생성
    var upload = document.getElementById('fileName'),
    holder = document.getElementById('sumnail');
    
    var file = upload.files[0],
    reader = new FileReader();
    
	reader.onload = function (event) {
	var img = new Image();
	img.src = event.target.result;
	
	// 올린 이미지의 크기가 560보다 큰경우 560으로 고정
	if (img.width > 560) { // holder width
	  img.width = 560;
	}
	holder.innerHTML = '';
	holder.appendChild(img);
	};
	reader.readAsDataURL(file);

 	}
 

    
}

</script>



</body>
</html>