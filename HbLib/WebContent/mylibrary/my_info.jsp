<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/mylibrary.css">
<script type="text/javascript" src="../js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_03").css("background-color", "gray")
		$(".myinfoview tr:gt(0)").addClass("my_info_tr")
	});
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="mainArea">
		<div class="mainArea2">
			<jsp:include page="my_navi.jsp" />
			<div id="mainview">
				<div class="mainviewnavi">◆My Library > 개인정보</div>
				<div>
					<div align="left">
						<table class="myinfoview">
							<tr>
								<td width="100">아이디</td>
								<td width="300"><input type="text" name="id" value="정후영짱짱맨" size="30" readonly /></td>
								<td></td>
							</tr>
							<tr>
								<td width="100">이름</td>
								<td><input type="text" name="name" value="정후영" size="30" readonly /></td>
								<td></td>
							</tr>
							<tr>
								<td width="100">비밀번호</td>
								<td><input type="password" name="pwd" size="30" /></td>
								<td width="120"><input type="button" value="비밀번호변경"></td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><input type="text" name="jumin" size="30" readonly /></td>
								<td></td>
							</tr>
							<tr>
								<td width="100">이메일</td>
								<td><input type="text" name="email" size="30" /></td>
								<td><input type="button" value="이메일변경"></td>
							</tr>
							<tr>
								<td width="100">전화번호</td>
								<td><input type="text" name="tel" size="30" /></td>
								<td><input type="button" value="전화번호변경"></td>
							</tr>
							<tr>
								<td width="100">주소</td>
								<td><input type="text" name="addr" size="30" /></td>
								<td><input type="button" value="주소변경"></td>
							</tr>

						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>