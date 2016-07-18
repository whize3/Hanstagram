<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/mylibrary.css">
<script type="text/javascript" src="../js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_04").css("background-color", "gray")
		
	});
	
	
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="mainArea">
		<div class="mainArea2">
			<jsp:include page="ser_navi.jsp" />
			<div id="mainview">
				<div class="mainviewnavi">◆서비스이용 > 도서구입신청 현황</div>
				<div>
					<div class="mainview_c_btn">
						<input type="button" value="구입신청">						
					</div>
					<div align="center">
					<jsp:useBean id="user" class="com.hb.mybatis.UsersVO" scope="session"/>					
						<table >
							<tr>
								<td width="100">검색어</td>
								<td><input type="text" name="pwd" size="30" id="q" /></td>
								<td width="120"><input type="button" value="검색" id="go" ></td>
							</tr>
						</table>
					</div>
					<div id="result">
					
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>