<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="/Hansta/js/jquery-latest.js"></script>

<script type="text/javascript">
var count =0;




function idCheck(){
	var text = $("#member_id").val();
    var regexp = /[0-9a-zA-Z]/; // 숫자,영문,특수문자
    for(var i=0; i<text.length; i++){

        if(text.charAt(i) != " " && regexp.test(text.charAt(i)) == false ){
			alert("한글이나 특수문자는 입력불가능 ");
			return false;
		}
    }
    overlapCheck();
}
function overlapCheck(){
	var param = "member_id" + "=" + $("#member_id").val();

	if($("#member_id").val() == '' || $("#member_id").val()==null)
	{
		alert("아이디를 입력하세요");
		return false;
	}
	$.ajax({

		url : "/overlaptest.do",

		type : "GET",

		data : param,

		cache : false,

		async : false,

		dataType : "text",

		success : function(response) {				
			if(response=='0')
			{
				count = 1;
				alert("아이디가 중복이 되지 않습니다. 쓰셔도 됩니다.")
			}
			else
			{
				alert("아이디가 중복이 됩니다. 다시 입력 해주세요");
				return false;
			}	
		},
		error : function(request, status, error) {
			if (request.status != '0') {
				alert("code : " + request.status + "\r\nmessage : "
						+ request.reponseText + "\r\nerror : " + error);
			}
		}
	});
}
function formCheck() {

	var member_id = document.getElementById('member_id');

	var password = document.getElementById('password');

	var password_check = document.getElementById('password_check');

	if (member_id.value == '' || member_id.value == null) {

		alert('ID를 입력하세요');

		focus.member_id;

		return false;

	}

	if (password.value == '' || password.value == null) {

		alert('비밀번호를 입력하세요');

		focus.password;

		return false;

	}
	if (password_check.value == '' || password_check.value == null) {

		alert('비밀번호확인란을 입력하세요');

		focus.password_hint;

		return false;

	}

	

	/*비밀번호와 비밀번호확인란 같은지 확인*/

	if (password.value != password_check.value){

		alert("비밀번호와 비밀번호 확인란이 다릅니다.");

		focus.passowrd;

		return false;

	}

	if (password_hint.value == '' || password_hint.value == null) {

		alert('비밀번호힌트를 입력하세요');

		focus.password_hint;

		return false;

	}
	if(count == 0)

	{
		alert("중복확인을 눌러주세요");
		return false;

	}
	else{
		save();
	}
}

function init(){
	count=0;
}



function save() {
	var str3 = document.getElementById('join');

	str3.submit();

	alert("가입이 완료되었습니다.")

}
function countCheck(){

	if(count==1){
		count=0;
	}
}

</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>한스타 회원가입</title>
</head>
<body>
<form action="/members.do" method="post" id="join">
					
	<!-- 아이디   -->
	<div>
	<label>ID(10글자이내,한글이나 특수문자)</label>
	<input type="text" size="10" id="member_id" name="member_id" maxlength="10" 
	onkeydown="countCheck();" onkeypress="countCheck();">
    <input type="button" name="chk" class="login" value="중복검사" onclick="idCheck()">
	</div>
		<br/>
	<!-- 비밀번호  -->
	<div>
	<label>비밀번호(12자이내)</label>
	<input type="password" id="password" name="member_password" size=12 maxlength="12">
	</div>
		<br/>
	<!--비밀번호 확인  -->
	
	<div>
	<label>비밀번호확인</label>
	<input type="password" id="password_check" name="password_check" size=12 maxlength="12">
	</div>
		<br/>
	
	<!-- 이름  -->
	<div>
	<label>이름</label>
	<input type="text" id="member_name" name="member_name">
	</div>
	<br/>
	
	<!-- 나이  -->
	<div>
	<label>나이</label>
	<input type="text" id="member_age" name="member_age">
	</div>
	<br/>
	
	<!-- Email  -->
	<div>
	<label>이메일</label>
	<input type="text" id="member_email" name="member_email">
	</div>
	<br/>
	 
	 <p>
	 <input type="reset" value="다시작성" onclick="back()">
	 <input type="button" id="join" name="join" value="가입하기" onclick="javascript:formCheck();"> 
	 </p>
	
	
				   
</form>
</body>
</html>