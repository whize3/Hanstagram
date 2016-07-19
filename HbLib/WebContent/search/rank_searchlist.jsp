<%@page import="com.hb.mybatis.Book_rankVO"%>
<%@page import="java.util.List"%>
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
<script type="text/javascript">
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_02").css("background-color", "gray")
	});	
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<jsp:include page="my_navi.jsp" />
	
	<form>
		<%
			List<Book_rankVO> list = (List<Book_rankVO>) request.getAttribute("list");
		%>
		<div class="rank">
			<div align="center">
				<table width="700">
					<thead>
						<tr align="center">
							<th></th>
							<th width="250">책번호</th>
							<th width="250">제목</th>
							<th width="250">작가</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="4"><hr color="black" /></td>
						</tr>
						<c:forEach var="k" items="${list}">
							<tr align="center">
								<td>${k.s_url}</td>
								<td>${k.b_num}</td>
								<td>${k.b_subject}</td>
								<td>${k.writer}</td>
							</tr>
							<td colspan="4"></td>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

</from>
</body>
</html>