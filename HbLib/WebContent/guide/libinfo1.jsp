<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/HbLib/css/mylibrary.css">
<link rel="stylesheet" href="/HbLib/css/sub2.css">
<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_01").css("background-color", "gray")
	});
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="mainArea">
		<div class="mainArea2">
			<jsp:include page="guide_navi.jsp" />
			<div id="mainview">
						<h2>
							<img src="/HbLib/img/pageTitD01.gif" alt="도서관이용안내" />
						</h2>
						<table cellpadding="0" cellspacing="0" border="0"
							class="tableType01">
							<colgroup>
								<col />
								<col />
								<col style="width: 20%;" />
								<col style="width: 30%;" />
							</colgroup>
							<tr>
								<th>실별</th>
								<th>층별</th>
								<th>학기중</th>
								<th>방학중</th>
							</tr>
							<tr>
								<td ><strong>전공자료실</strong></td>
								<td>1층</td>
								<td rowspan="3">개관시간 09:00 ~ 21:30</td>
								<td rowspan="3">개관시간 09:00 ~ 21:30</td>
							</tr>
							<tr>
								<td><strong>전자정보실 /
										그룹스터디실</strong></td>
								<td>2층</td>
							</tr>
							<tr>
								<td><strong>교양자료실 /
										연속간행물실</strong></td>
								<td>3층</td>
							</tr>
							<tr>
								<td><strong>자유열람실</strong></td>
								<td>4,5층</td>
								<td colspan="2">연중24시간 개방</td>
							</tr>
						</table>
						<ul>
							<li>휴관일 : 국정공휴일, 개교기념일, 장서점검기간, 기타 도서관장이 필요하다고 인정하는 경우<br />
								단, 도서관장이 필요하다고 인정할 때에는 개관시간을 변경할 수 있다.
							</li>
						</ul>
			</div>
		</div>

	</div>
</body>
</html>