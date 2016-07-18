<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.mainArea {
	width: 100%;
	display: block;
	text-align: left;
}

.mainArea2 {
	width: 960px;
	display: block;
	height: 100%;
	margin: 0 auto;
}

.mainviewnavi {
	height: 60px;
	padding-top: 100px;
	padding-left: 150px;
}
</style>
<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
<script type="text/javascript">
$(function() {
	var toDay = new Date();
	var year  = toDay.getFullYear();
	var month = (toDay.getMonth()+1);
	var day   = toDay.getDate();
	var str = "";
	// 년도 설정
	var birthday = (""+toDay.getFullYear() + (toDay.getMonth() + 1) + toDay.getDate());
	for (var i=year; i>=1900; i--) {
		if (year == i) {
			str += "<option value='" + i + "' selected='selected'>" + i + "</option>";
		} else {
			str += "<option value='" + i + "' >" + i + "</option>";
		}
	}
	$("#birthdayYear").html(str);
	str = "";
	
	for (var i=12; i>=1; i--) {
		if (month == i) {
			str += "<option value='" + i + "' selected='selected'>" + i + "</option>";
		} else {
			str += "<option value='" + i + "' >" + i + "</option>";
		}
	}
	$("#birthdayMonth").html(str);
	str = "";
	
	if(month <8 && month%2==1){
		for (var i=31; i>=1; i--) {
			if (day == i) {
				str += "<option value='" + i + "' selected='selected'>" + i + "</option>";
			} else {
				str += "<option value='" + i + "' >" + i + "</option>";
			}
		}
		
	}else if(month <8 && month%2==0){
		if(month == 2){
			if(year%4==0){
				for (var i=29; i>=1; i--) {
					if (day == i) {
						str += "<option value='" + i + "' selected='selected'>" + i + "</option>";
					} else {
						str += "<option value='" + i + "' >" + i + "</option>";
					}
				}
			}else{
				for (var i=28; i>=1; i--) {
					if (day == i) {
						str += "<option value='" + i + "' selected='selected'>" + i + "</option>";
					} else {
						str += "<option value='" + i + "' >" + i + "</option>";
					}
				}
			}
		}else{
			for (var i=30; i>=1; i--) {
				if (day == i) {
					str += "<option value='" + i + "' selected='selected'>" + i + "</option>";
				} else {
					str += "<option value='" + i + "' >" + i + "</option>";
				}
			}
		}
		
	}else if(month >=8 && month%2==0){
		for (var i=31; i>=1; i--) {
			if (day == i) {
				str += "<option value='" + i + "' selected='selected'>" + i + "</option>";
			} else {
				str += "<option value='" + i + "' >" + i + "</option>";
			}
		}
	}else if(month >=8 && month%2==1){
		for (var i=30; i>=1; i--) {
			if (day == i) {
				str += "<option value='" + i + "' selected='selected'>" + i + "</option>";
			} else {
				str += "<option value='" + i + "' >" + i + "</option>";
			}
		}
	}
	$("#birthdayDay").html(str);
	str="";
	
	$("#birthdayMonth").on('change', function(){
		year=$('#birthdayYear').val()
		month=$('#birthdayMonth').val()
		day=1;
		if(month <8 && month%2==1){
			for (var i=31; i>=1; i--) {
				if (day == i) {
					str += "<option value='" + i + "' selected='selected'>" + i + "</option>";
				} else {
					str += "<option value='" + i + "' >" + i + "</option>";
				}
			}
			
		}else if(month <8 && month%2==0){
			if(month == 2){
				if(year%4==0){
					for (var i=29; i>=1; i--) {
						if (day == i) {
							str += "<option value='" + i + "' selected='selected'>" + i + "</option>";
						} else {
							str += "<option value='" + i + "' >" + i + "</option>";
						}
					}
				}else{
					for (var i=28; i>=1; i--) {
						if (day == i) {
							str += "<option value='" + i + "' selected='selected'>" + i + "</option>";
						} else {
							str += "<option value='" + i + "' >" + i + "</option>";
						}
					}
				}
			}else{
				for (var i=30; i>=1; i--) {
					if (day == i) {
						str += "<option value='" + i + "' selected='selected'>" + i + "</option>";
					} else {
						str += "<option value='" + i + "' >" + i + "</option>";
					}
				}
			}
			
		}else if(month >=8 && month%2==0){
			for (var i=31; i>=1; i--) {
				if (day == i) {
					str += "<option value='" + i + "' selected='selected'>" + i + "</option>";
				} else {
					str += "<option value='" + i + "' >" + i + "</option>";
				}
			}
		}else if(month >=8 && month%2==1){
			for (var i=30; i>=1; i--) {
				if (day == i) {
					str += "<option value='" + i + "' selected='selected'>" + i + "</option>";
				} else {
					str += "<option value='" + i + "' >" + i + "</option>";
				}
			}
		}
		$("#birthdayDay").html(str);
		str="";
	});
	
});
	$(function() {
		$("#id").keyup(function() {
			var chk;
			var id_length = id.value.length;
			for(var i = 0 ; i < id_length ; i++){
				chk = id.value.charCodeAt(i)
				if((chk >= 65 && chk <=90) || (chk>=97 && chk<=122) || (chk>=48 && chk<=57)){
					
					}else{
						alert('아이디는 영문과 숫자만 입력이 가능합니다');
						id.value="";
						return;
					}
				}
			
			$.ajax({
				type : "post",
				url : "/HbLib/Controller?type=chkid",
				dataType : "text", // 넘어오는 데이터 형식
				data : "id=" + $("#id").val(), // 서블릿으로 넘어가는 파라미터 값
				success : function(data) {
					if(data.substring(0,4)=="사용가능"){
						$(".id_chk").html(data.substring(0,4));
					}else{
						$(".id_chk").html(data);
					}
				},
				error : function() {
					alert("오류발생2");
				}
			});
		});
		$("#tel1").blur(function() {
			var chk;
			var tel1_length = tel1.value.length;
			for(var i = 0 ; i < tel1_length ; i++){
				chk = tel1.value.charCodeAt(i)
				if(chk < 48 || chk > 57){
					alert('전화번호는 숫자만 입력이 가능합니다');
					 tel1.value="";
					return;
					}
				}
		});
		$("#tel2").blur(function() {
				var chk;
				var tel2_length = tel2.value.length;
				for(var i = 0 ; i < tel2_length ; i++){
					chk = tel2.value.charCodeAt(i)
					if(chk < 48 || chk > 57){
						alert('전화번호는 숫자만 입력이 가능합니다');
						 tel2.value="";
						return;
						}
					}
		});
		$("#tel3").blur(function() {
			var chk;
			var tel3_length = tel3.value.length;
			for(var i = 0 ; i < tel3_length ; i++){
				chk = tel3.value.charCodeAt(i)
				if(chk < 48 || chk > 57){
					alert('전화번호는 숫자만 입력이 가능합니다');
					 tel3.value="";
					return;
					}
				}
		});
			  $('#email_select').change(function(){
			   if($('#email_select').val() == "1"){
			    $("#email_2").val(""); //값 초기화
			    $("#email_2").prop("readonly",false); //활성화
			   } else if($('#email_select').val() == ""){
			    $("#email_2").val(""); //값 초기화
			    $("#email_2").prop("readonly",true); //textBox 비활성화
			   } else {
			    $("#email_2").val($('#email_select').val()); //선택값 입력
			    $("#email_2").prop("readonly",true); //비활성화
			   }
			  });
			  $("#pwd_chk").keyup(function(){
				  if($("#pwd").val() == $("#pwd_chk").val()){
					  $(".pwd_chk").html("비밀번호가 동일합니다!");
				  }else{
					  $(".pwd_chk").html("비밀번호를 확인하세요");
				  }
				  
			  })
			  $("#join_ok").click(function(){
				  if($("#id").val()==""){
					  alert("아이디를 입력하세요");
				  }else if($(".id_chk").text() != "사용가능"){
					  alert("아이디를 확인하세요");
				  }else if($("#name").val()==""){
					  alert("이름을 입력하세요");
				  }else if($("#pwd").val()==""){
					  alert("비밀번호를 입력하세요");
				  }else if($("#pwd").val() != $("#pwd_chk").val()){
					  alert("비밀번호를 확인하세요");
				  }else if($("input[name=gender]:radio:checked").length == 0){
					  alert("성별을 선택하세요");
				  }else if($("#email_1").val()=="" || $("#email_2").val()==""){
					  alert("이메일을 입력하세요");
				  }else if($("#tel1").val()=="" || $("#tel2").val()=="" || $("#tel3").val()==""){
					  alert("전화번호를 입력하세요");
				  }else if($("#addr").val()==""){
					  alert("주소를 입력하세요");
				  }else{
						$("#inForm").attr("action","/HbLib/Controller?type=join").attr("method", "post").submit();
				  }
			});	
	});
</script>

</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="mainArea">
		<div class="mainArea2">
			<div class="mainviewnavi">
				<form name="inForm" method="post" id="inForm">
					<table>
						<tr>
							<td width="150">아이디</td>
							<td><input type="text" name="id" id="id" /><span class="id_chk">중복검사여부</span>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" id="name" /></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pwd" id="pwd" /></td>
						</tr>
						<tr>
							<td>비밀번호확인</td>
							<td>
								<input type="password" name="pwd_chk" id="pwd_chk" />
								<span class="pwd_chk"></span>
							</td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td>
								<select name="birthdayYear" id="birthdayYear"></select>
								<select name="birthdayMonth" id="birthdayMonth"></select>
								<select name="birthdayDay" id="birthdayDay"></select>
							</td>
						</tr>
						<tr>
							<td>성별</td>
							<td>
								<input type="radio" name="gender" id="man" value="1" /> 남 
								<input type="radio" name="gender" id="woman" value="2" /> 여
							</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td>
								<input type="text" name="email_1" id="email_1" size="10" />@
								<input type="text" name="email_2" id="email_2" size="10" readonly />
								<select id="email_select">
									<option value="" selected>선택하세요</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="nate.com">nate.com</option>
									<option value="hb.kr">hb.kr</option>
									<option value="1">::직접입력::</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>tel</td>
							<td>
								<input type="text" name="tel1" id="tel1" size="3" maxlength="3" />
								<input type="text" name="tel2" id="tel2" size="4" maxlength="4" />
								<input type="text" name="tel3" id="tel3" size="4" maxlength="4" />
							</td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input type="text" name="addr" id="addr" /></td>
						</tr>
						<tr>
							<td colspane="2"><input type="button" value="회원가입" id="join_ok" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>