<%@page import="Member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>savewrite</title>

<style type="text/css">

table.type03 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 3px solid #369;
  margin : 20px 10px;
}
table.type03 th {
    width: 147px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #153d73;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;

}
table.type03 td {
    width: 349px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}

</style>
<%
Object ologin = session.getAttribute("login");
MemberDto mem = null;
mem = (MemberDto)ologin;
%>

</head>
<body>

<h1>유기동불 보호중입니다! 등록하기</h1>

<form action="./savewriteAf.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="user_id" value="${login.id} ">
<table class="type03">
	<tr>
		<th scope="row">등록인</th>
		<td colspan="5">${login.name}<input type="text" name="user_name" size="50" value="${login.name}" readonly></td>
	</tr>
	<tr>
		<th scope="row">글제목</th>
		<td colspan="5"><input type="text" name="title" id="title"></td>
	</tr>
	<tr>
		<th scope="row">발견하신 장소</th>
		<td colspan="5"><select name="find_pleace1">
			<option>지역선택</option>
			<option value="서울시">서울시</option>
			<option value="인천시">인천시</option>
			<option value="경기도">경기도</option>
		</select>
		<input type="text" name="find_pleace2"></td>
	</tr>
	<tr>
		<th scope="row">연락처</th>
		<td><select id="user_ph1" name="user_ph1">
			<option>선택</option>
			<option value="010">010</option>
			<option value="011">011</option>
		</select>-
		<input type="text" id="user_ph2" name="user_ph2">-
		<input type="text" id="user_ph3" name="user_ph3"></td>
		
		<th scope="row">성별</th>
		<td>
			<input type="radio" name="animal_gender" value="수컷">수컷
			<input type="radio" name="animal_gender" value="암컷">암컷
		</td>
	</tr>
	<tr>
		<th scope="row">보호중 반려동물</th>
		<td>			
			<input type="radio" name="animal_kind" value="강아지">강아지
			<input type="radio" name="animal_kind" value="고양이">고양이
			<input type="radio" name="animal_kind" value="기타">기타 반려동물
		</td>
		
		<th scope="row">발견 날짜</th>
		<td colspan="3"><input type="text" id="find_date" name="find_date"></td>
	</tr>
	<tr>
		<th scope="row">상세설명</th>
		<td><textarea rows="10" cols="80" name="content" id="content" wrap="hard" style="ime-mode:active;resize: vertical;"></textarea> </td>
	</tr>
	<!-- <tr>
		<th scope="row">사진첨부</th>
		<td><input type="text" id="img_name" name="img_name"> </td>
	</tr>
	<tr> -->
	<td>사진첨부</td>
	
	<td colspan="2">
		※ 사진첨부시 주의사항 <br>
		1. 등록 가능한 확장자는 jp(e)g, gif, png 입니다 <br>
		2. 사진 용량이 2MB가 보다 큰 경우 오류가 날 수 있습니다 <br>
		
		<table>
			<tr>
				<td>
					<input type="file" id="img_name" name="img_name" accept=".gif, .jpg, .png"  onChange="uploadImg_Change(this.value)" >
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
		<td>
			<input type="submit" value="등록하기">
		</td>
	</tr>
</table>
</form>

<script type="text/javascript">


//파일의 확장자를 가져옮
function getFileExtension( filePath )
{
	alert("111");
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
	alert(value);
    var src = getFileExtension(value);
    alert(src);
    if (src == "") {
    	// 파일이 안들어왔을때
        alert('올바른 파일을 입력하세요');
        document.getElementById('sumnail').innerHTML = '';
        document.getElementById('img_name').value = '';
        return ;
    } // 파일 확장자가 jp(e)g, gif, png외 들어 온 경우
    else if ( !( (src.toLowerCase() == "gif") || (src.toLowerCase() == "jpg") || (src.toLowerCase() == "jpeg" ) || (src.toLowerCase() == "png" ) ) ) {
    	alert("등록 가능한 확장자는 jp(e)g, gif, png 입니다. 다시 확인해 보세요");
    	alert(document.getElementById('img_name').value);
    	document.getElementById('img_name').value = '';
    	document.getElementById('sumnail').innerHTML = '';
        return true;
 	}else{ // 이미지 파일로 성공적으로 작동하는경우
    
 	// 이미지 썸네일 생성
    var upload = document.getElementById('img_name'),
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