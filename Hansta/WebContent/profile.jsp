<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/Hansta/css/sue.css">
<script src="/Hansta/js/jquery.min.js"></script>
<script src="/Hanstajs/jquery.Jcrop.min.js"></script>
<link rel="stylesheet" href="/Hansta/css/jquery.Jcrop.css" type="text/css" />

<script language="javascript">
	jQuery(function($){
		$('#target').Jcrop();
	});
</script>
</head>
<body class="body">
<main><article><header class="profile">
	<h3>프로필 변경하기</h3>
</header></article></main>
<article>
	<img src="/Hansta/img/0002.jpg" id="target"/>
</article>
</body>
</html>