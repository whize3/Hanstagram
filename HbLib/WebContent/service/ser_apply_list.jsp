<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
	table {border-top:solid 2px #838383;width:100%;border-spacing:0;}
	table th {border-left:solid 1px #dfdfdf; border-bottom: solid 1px #dfdfdf;text-align:center;background-color:#f9f9f9;font-weight: bold;}
	table th:first-child{border-left:none;}
	table td {border-left:solid 1px #dfdfdf; border-bottom: solid 1px #dfdfdf;text-align:center;background-color:#fff;  font-size: 15px;}
	table td:first-child{border-left:none;}
	input[type=text]{height: 25px;}
	.apply{color:white; background-color: #7189d0; border: 0; height: 30px; margin-top: 10px;}
	.mainview_c_btn{margin-bottom: 10px;}	
</style>
<link rel="stylesheet" href="/HbLib/css/mylibrary.css">
<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_04").css("background-color", "gray")
	});	
</script>
<style type="text/css">
	th{
		padding-right: 100px;
	}
</style>
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
						<input type="button" value="구입신청" class="apply">						
					</div>
					<div align="center">
					
					<input type="hidden" class="id" value="${user.id}" >
						<table>
							<tr>
								<th>번호</th><th>제목</th><th>신청일자</th><th>처리상태</th>
							</tr>
							<c:forEach var="k" items="${list}">
							<tr>
								<td>${k.ba_idx}</td>
								<td>${k.b_subject}</td>
								<td>${k.ba_date.substring(0,10)}</td>
								<td>
								<c:choose>
									<c:when test="${k.ba_state==0}">
										신청중
									</c:when>
									<c:when test="${k.ba_state==1}">
										구입완료
									</c:when>
									<c:when test="${k.ba_state==2}">
										구입거절
									</c:when>
								</c:choose>
								</td>
							</tr>
								
							</c:forEach>
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