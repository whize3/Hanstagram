<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/HbLib/css/mylibrary.css">
<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<style type="text/css">
ul.yul {
	list-style: none;
}

ul.yul li {
	float: left;
	margin-right: 8px;
	width: 50px;
}

ul.yul li a {
	display: block;
	padding: 3px 7px;
	border: 1px solid #00B3DC;
	color: #2f313e;
	font-weight: bold;
}

.ok {
	padding: 3px 7px;
	border: 1px solid silver;
	color: black;
}

.no {
	padding: 3px 7px;
	border: 1px solid black;
	background: gray;
	color: silver;
	font-weight: bold;
}
</style>
<script type="text/javascript">
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_05").css("background-color", "gray")
	});
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="mainArea2">
		<jsp:include page="ser_navi.jsp" />
		<div id="mainview">

			<ul class="yul">
				<c:forEach var="k" items="${yulvo }">
					<c:if test="${k.y_location=='1' }">
						<c:if test="${k.y_state=='1' }">
							<li class="no">${k.y_num }</li>
						</c:if>
						<c:if test="${k.y_state=='0' }">
							<li class="ok">${k.y_num }</li>
						</c:if>
					</c:if>
				</c:forEach>
				<li>1층</li>
			</ul>
			<br />
			<ul class="yul">
				<c:forEach var="k" items="${yulvo }">
					<c:if test="${k.y_location=='2' }">
						<c:if test="${k.y_state=='1' }">
							<li class="no">${k.y_num }</li>
						</c:if>
						<c:if test="${k.y_state=='0' }">
							<li class="ok">${k.y_num }</li>
						</c:if>
					</c:if>
				</c:forEach>
<li>2층</li>
			</ul>
		</div>
	</div>
</body>
</html>