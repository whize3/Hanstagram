<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/mylibrary.css">
<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_01").css("background-color", "gray")
	});
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="mainArea">
		<div class="mainArea2">
			<jsp:include page="my_navi.jsp" />
			<div id="mainview">
				<div class="mainviewnavi">◆My Library > 대출현황</div>
				<div>
					<div class="mainview_c_btn">
						<input type="button" value="대출현황">&nbsp;&nbsp;
						<input type="button" value="대출안내">
					</div>
					<div align="center">
						<table width="680">
							<thead>
								<tr align="left">
									<th width="250">제목</th>
									<th width="150">저자</th>
									<th width="130">고유번호</th>
									<th width="150">반납예정일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="4"><hr color="black" /></td>
								</tr>
								<!-- for시작ㄱ -->
								<tr>
									<td>정후영짱짱맨</td>
									<td>정후영</td>
									<td>599</td>
									<td>2016-07-20</td>
								</tr>
								<tr>
									<td colspan="4"><hr /></td>
								</tr>
								<!-- for끝 -->
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>