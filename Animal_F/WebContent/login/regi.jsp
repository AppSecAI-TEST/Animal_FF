
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 우편주소 -->
<title>Insert title here</title>
<style type="text/css">
    *{margin:0;padding:0}
		html,body{height:100%}`
		body{display:table;width:100%}
	</style>
</head>
<body>
	<h1>회원가입</h1>
	<div align="center">
		<form action="regiAf.jsp" id="regiform" name="regiform">
			<table border="1">
				<tr>
					<td width="120">이름</td>
					<td><input type="text" name="name" id="name"
						placeholder="ex)홍길동"></td>
				</tr>
				<tr>
					<td width="120">아이디</td>
					<td><input type="text" name="id" id="id"> <input
						type="button" id="id_check" name="id_check" value="아이디 중복체크"></td>
				</tr>
				<tr>
					<td width="120">비밀번호</td>
					<td><input type="password" name="pwd1" id="pwd1">&nbsp;&nbsp;&nbsp;<font
						color="red">6자 이상 입력해 주세요</font></td>
				</tr>
				<tr>
					<td width="120">비밀번호 확인</td>
					<td><input type="password" name="pwd2" id="pwd2"
						placeholder="패스워드"></td>
				</tr>
				<tr>
					<td width="120">핸드폰 번호</td>
					<td
						onkeypress="if (event.keyCode<48|| event.keyCode>57) event.returnValue=false;"
						style="IME-MODE: disabled;">
						<select id ="phone" name="phone">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="017">017</option>
						</select> - 
						<input type="text"	name="phone1" id="phone1" size="5" maxlength="4"> - 
						<input	type="text" name="phone2" id="phone2" size="5" maxlength="4"></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="text" id="addrNum" name="addrNum"
						placeholder="우편번호"> <input type="button"
						onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><Br>
						<input type="text" size="40" id="addr1" name="addr1"
						placeholder="주소"><Br> <input type="text" size="40"
						id="addr2" name="addr2" placeholder="상세주소"></td>
				<tr>
					<td width="120">이메일</td>
					<td><input type="text" name="email" id="email" width="140"
						size="15">@ <input type="text" name="email2" id="email2"
						width="140" size="15" disabled value="naver.com"> 
						<select	id="email_select" name="email_select">
							<option value="@naver.com">naver.com</option>
							<option value="@daum.com">daum.com</option>
							<option value="@gmail.com">gmail.com</option>
							<option value="1">직접입력</option>

					</select></td>

				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type="checkbox" name="gender" id="gender"onclick="genderCheck(this);" value="남" checked="checked">남 
						<input type="checkbox" name="gender" id="gender"onclick="genderCheck(this);" value="여">여
					</td>
				</tr>

			</table>
			<input type="button" id="S_button" value="가입하기">
			<input type="reset" value="취소">


		</form>
	</div>


	<script type="text/javascript">
	
		
		$("#S_button").click(function() {
			if ($("#name").val() == "") { //이름
				alert("이름 을 입력해주세요")
				$("#name").focus();
			} else if ($("#id").val() == "") { //아이디
				alert("id를 입력해주세요")
				$("#id").focus();
			} else if ($("#pwd1").val() == "") { //패스워드
				alert("패스워드를 입력해주세요")
				$("#pwd1").focus();
			} else if ($("#pwd2").val() == "") { //패스워드 확인
				alert("패스워드 확인을 입력해주세요")
				$("#pwd2").focus();
			} else if ($("#email").val() == "") { //이메일 공란
				alert("이메일을 입력해주세요");
				$("#email").focus();
			} else if ($("#pwd1").val() != $("#pwd2").val()) { //패스워드확인 체크
				alert("패스워드 가 다릅니다 ");
				$("#pwd1").focus();
			} else {
				$('#regiform').attr("target", "_self").submit(); //로그인후 submit
			
				return;
			}

		});

		function genderCheck(chk) { //check box 한개만 표시하게 하는 javascript
			var obj = document.getElementsByName("gender");
			for (var i = 0; i < obj.length; i++) {
				if (obj[i] != chk) {
					obj[i].checked = false;
				}
			}
		};
		
		$('#email_select').change(function(){
			$('#email_select option:selected' ).each(function(){
				if($(this).val()=='1'){//직접 입력일경우
					$('#email2').val('');
					$('#email2').attr("disabled",false) // 활성화
					}else{
						$('#email2').val($(this).text());
						$('#email2').attr("disabled",true) // 활성화 
					}	
			});
		});

		function sample6_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullAddr = ''; // 최종 주소 변수
					var extraAddr = ''; // 조합형 주소 변수

					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						fullAddr = data.roadAddress;

					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						fullAddr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
					if (data.userSelectedType === 'R') {
						//법정동명이 있을 경우 추가한다.
						if (data.bname !== '') {
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if (data.buildingName !== '') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')'
								: '');
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('addrNum').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('addr1').value = fullAddr;

					// 커서를 상세주소 필드로 이동한다.
					document.getElementById('addr2').focus();
				}
			}).open();
		}

		$("#id_check").click(function(){
				var idcheck =false;
			$.ajax({
				type:"post",
				url:"../login/idcheck.jsp",
				data:{
					checkid:$('#id').val(),
				},
				success:function(data){
					if(data.trim() == "true"){
						alert("중복된 ID");
					}else{
						alert("사용가능 ID");
					}
					
				}
			});
		});
			
	</script>


</body>
</html>







