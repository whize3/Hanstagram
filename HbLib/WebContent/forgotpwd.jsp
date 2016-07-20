<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.sec{
    width: 259px;
    padding: 20px 0 18px 29px;
    border: 1px solid #d0d2d4;
    background: #f4f5f7;
    color: #899197;
}
</style>
<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		$("#jumin_for").keyup(function() {
			var chk;
			var jumin_for_length = jumin_for.value.length;
			for (var i = 0; i < jumin_for_length; i++) {
				chk = jumin_for.value.charCodeAt(i)
				if ((chk >= 48 && chk <= 57)) {

				} else {
					alert('숫자만 입력이 가능합니다');
					jumin_for.value = "";
					return;
				}
			}
		});

		$("#jumin_lat").keyup(function() {
			var chk;
			var jumin_lat_length = jumin_lat.value.length;
			for (var i = 0; i < jumin_lat_length; i++) {
				chk = jumin_lat.value.charCodeAt(i)
				if ((chk >= 48 && chk <= 57)) {

				} else {
					alert('숫자만 입력이 가능합니다');
					jumin_lat.value = "";
					return;
				}
			}
		});
		
		$("#search2").click(function() {
			var name = document.getElementsByName('name2')[0].value;
			var id = document.getElementsByName('id2')[0].value;
			var jumin_for = document.getElementsByName('jumin_for2')[0].value;
			var jumin_lat = document.getElementsByName('jumin_lat2')[0].value;
				$.ajax({
					type : "get",
					url : "/HbLib/AjaxController",
					data : "type=forgotpwd" + 
							"&name=" + name	+ 
							"&jumin=" + jumin_for + "-"+ jumin_lat+
							"&id="+id,
					dataType : "text",
					success : function(data) {
						if(data!="none"){
							$("#result2").html(data);
						}else{
							alert("일치하는 정보 없습니다.");
						}
					},
					error : function(request, status, error) {
						alert("request: " + request + " status: "
						+ status + " error: " + error);
					}
				});
			});
	});
</script>
</head>
<body>
	<div class="sec">
	<h2>비밀번호 찾기</h2>
	<label>아이디</label>
	<input type="text" id="id2" name="id2">
	<br/>
	<label>이름</label>
	<input type="text" id="name2" name="name2">
	<br />
	<label>주민번호</label>
	<input type="text" id="jumin_for2" name="jumin_for2" size="6">-
	<input type="text" id="jumin_lat2" name="jumin_lat2" size="1">
	<br />
	<input type="button" value="찾기" id="search2">
	<div id="result2"></div>
	</div>
	
</body>
</html>