<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/HbLib/css/menuList.css" type="text/css" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
</head>
<style>
input[name=none]{
border:#dedede;
background:#dedede;
color:#898989;
cursor:default;
}
</style>
<script>
$(function(){
	$("input[type=button]").click(function(){
		if($(this).attr("name")=='none'){
			console.log("none");
		}else{
			var idx=$(this).attr("name");
			location.href="/HbLib/Controller?type=stateModi&sr_idx="+idx;
		}
	});
	
});
</script>
<body>
<jsp:include page="main.jsp"/>
	<!-- 전체 -->
	<div id="content-wrap">
		<!-- 메뉴 -->
		<div id="menu">
			<!-- menu 로고 -->
			<div class="menu-header"><img src="/HbLib/img/icon_menu_book.jpg" class="img"/><h3>스터디룸 관리</h3><hr/></div>
			<div class="menu-wrap">
				<ul class="submenu">
					<li><span class="li-s">></span><a href="/HbLib/controller?type=admin_sdReserve">스터디룸 신청 현황</a></li>
				</ul>
			</div>
		</div>
		<!-- 내용 -->
		<div id="content">
			<div class="page-header">
				<h3>스터디룸 신청 현황</h3>
			</div>
			<hr/>
			<div class="table-wrap">
				<table class="table">
					<thead>
						<tr style="background-color: #BCBCBC;">
							<th>예약번호</th>
							<th>스터디룸</th>
							<th>예약날짜</th>
							<th>시작시간</th>
							<th>종료시간</th>
							<th>아이디</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="k" items="${reserveList}">
						<tr>
							<td>${k.sr_idx}</td>
							<td>${k.s_num}호</td>
							<td>${k.sr_date}</td>
							<td>${k.start_time}</td>
							<td>${k.end_time}</td>
							<td>${k.id}</td>
							<td>${k.sr_state}</td>
							<td>
							<c:choose>
								<c:when test="${k.sr_state == '1'}">
									<input type="button" name="${k.sr_idx}" value="승인">
								</c:when>
								<c:otherwise>
									<input type="button" name="none" value="승인">
								</c:otherwise>
							</c:choose>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>