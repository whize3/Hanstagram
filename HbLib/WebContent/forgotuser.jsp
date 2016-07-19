<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
		$("#search").click(function() {
			
		});
	});
</script>
</head>
<body>
	<label>이름</label>
	<input type="text" class="name">
	<br />
	<label>주민번호</label>
	<input type="text" id="jumin_for" name="jumin_for" size="6">-
	<input type="text" id="jumin_lat" name="jumin_lat" size="1"><br/>
	<input type="button" value="찾기" class="search">
</body>
</html>