<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>

<script type="text/javascript">
$(function(){
	/* $.ajax({
		url:'/HbLib/Controller?type=getRoom',
		type:'post',
		success:function(data){
			$("#").load("studyroom.jsp");
		},error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	}) */
});
</script>
</head>
<body>
		<form>
			<input type="text" name="room">
		</form>
		<c:forEach items="${room}" var="room">
		<%
			
		%>
			<div class="room">
				<input type="hidden" value="${room.s_num}">
				<p>${room.s_num}호</p>
			</div>
		</c:forEach>
</body>
</html>