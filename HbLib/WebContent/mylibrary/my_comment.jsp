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
		$("#navi_04").css("background-color", "gray")
	});
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="mainArea">
		<div class="mainArea2">
			<jsp:include page="my_navi.jsp" />
			<div id="mainview">
				<div class="mainviewnavi">◆My Library > 나의서평</div>
				<div>
					<div class="mainview_cnt">
						&nbsp;&nbsp;&nbsp;전체 : 1건
						<hr color="black" width="670"/>
					</div>
					<div align="center">
						<table width="680">
							<thead>
								<tr align="left">
									<th width="150">번호</th>
									<th width="350">서명</th>
									<th width="180">작성일자</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="3"><hr color="black" /></td>
								</tr>
								<!-- for시작ㄱ -->
								<tr>
									<td>122</td>
									<td>생각의 지도</td>
									<td>2016-07-08</td>
								</tr>
								<tr>
									<td colspan="3"><hr /></td>
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