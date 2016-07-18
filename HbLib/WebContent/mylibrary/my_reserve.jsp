<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/HbLib/css/mylibrary.css">
<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_02").css("background-color", "gray")
	});
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="mainArea">
		<div class="mainArea2">
			<jsp:include page="my_navi.jsp" />
			<div id="mainview">
				<div class="mainviewnavi">◆My Library > 예약확인</div>
				<div>
					<div align="center">
						<table width="680">
							<thead>
								<tr align="left">
									<th width="200">제목</th>
									<th width="100">저자</th>
									<th width="130">고유번호</th>
									<th width="150">반납예정일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="4"><hr color="black" /></td>
								</tr>
								<!-- for시작ㄱ -->
								<c:forEach var="k" items="${list }">
								<tr>
									<td>${k.b_subject }</td>
									<td>${k.writer }</td>
									<td>${k.isbn }</td>
									<td>${k.bd_date }</td>
								</tr>
								<tr>
									<td colspan="4"><hr /></td>
								</tr>
								</c:forEach>
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