<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/HbLib/css/mylibrary.css">
<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_03").css("background-color", "gray")
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
			<jsp:include page="search_navi.jsp" />
			<div id="mainview">
				<div class="mainviewnavi">◆자료검색 > 신규도서</div>
				<div>
					<div class="mainview_c_btn">
												
					</div>
					<div align="center">
						<table>
							<tr>
								<th><th>번호</th><th>제목</th><th>분류</th><th>상태</th>
							</tr>
							<c:forEach var="k" items="${list}">
							<tr>
								<td><img src="${k.s_url}"/></td>
								<td>${k.b_num}</td>
								<td>${k.b_subject}</td>
								<td>${k.category}</td>
								<td>
								<c:choose>
									<c:when test="${k.b_state==0}">
										대출가능									
									</c:when>
									<c:when test="${k.b_state==1}">
										대출중									
									</c:when>
									<c:when test="${k.b_state==2}">
										예약중									
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