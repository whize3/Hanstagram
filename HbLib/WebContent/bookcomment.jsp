<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	#showc{
		display: none;
	}
</style>
	<script type="text/javascript">
	$(function(){
		$("#xx").click(function(){
			$("#showc").css("display","none")
		})
	});
</script>
</head>
<body>
<c:forEach items="${list }" var="k">
	<span id="${k.bc_idx }">${k.bc_idx }</span>
	<script type="text/javascript">
	$(function(){
		$("#<c:out value='${k.bc_idx}'/>").click(function(){
			$("#content").text("<c:out value='${k.bc_content}'/>")
			$("#id").text("<c:out value='${k.id}'/>")
			$("#showc").css("display","block")
		})
	});
</script>
	${k.b_num }
	<span id="${k.bc_idx}1">${k.id }</span>
	<span id="${k.bc_idx}2">${k.bc_content }</span>
	<br />
</c:forEach>
<div id="showc">
<hr/>
	<span id="content">내용 :</span> 
	<span id="id">아이디 :</span> 
	<span id="xx">x</span>
</div>
</body>
</html>