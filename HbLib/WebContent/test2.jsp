<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%@ include file="header.jsp" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/HbLib/css/main2.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/HbLib/main.js"></script>
<script type="text/javascript">
$(function(){
	$("#notice li").click(function(){
		$("#notice .on").removeClass("on");
		$(this).addClass("on");
	})
	
});
function moveBanner(a){
	
} 
</script>
</head>
<body>


	<div><jsp:include page="banner.html"></jsp:include></div>
	
</body>
</html>