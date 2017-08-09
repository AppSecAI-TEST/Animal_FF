<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 자유게시판 등록 </title>
</head>
<body>

<table>
<col width="200"> <col width="700">
<tr align="right">
	<td colspan="2"> *는 필수 입력 사항입니다	</td>
</tr>

<tr> 
	<td>
		*등록인
	</td>
	<td>
		db에서 가져올 유저 이름
	</td>
</tr>

<tr>
	<td colspan="2">---------------------------------- </td>
</tr>

<tr>
	<td>
		*제목
	</td>
	
	<td>
		<table>
			<tr>
				<td><input type="text" id="title" name="title" size="20"></td>
				<td> *12글자까지만 글 목록에 노출 됩니다 </td>
			</tr>
		</table>
	</td>
</tr>

<tr>
	<td colspan="2">---------------------------------- </td>
</tr>


</table>

</body>
</html>