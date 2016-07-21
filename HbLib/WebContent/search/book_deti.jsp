<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/HbLib/css/mylibrary.css">
<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_01")

	});
</script>
<style>

header {
    padding: 1em;
     
}
 
aside {
    padding: 100px;
    
}

section{
    margin-right:100px; */
    border-right : 1px solid gray;
    padding: 1em;
    /* overflow: hidden; */

}
footer {
    padding: 1em;
    color: black;
    background-color: gray;
    clear: left;
    text-align: center;
}
</style> 

<title>Insert title here</title>
 
 
 
 
</head>

<body>
	<header> 
 	<jsp:include page="../header.jsp" />
 </header> 
	
	
			<section>
			  <jsp:include page="search_navi.jsp" />
			</section>                     
	
		 <aside>   
		 	
			<p align="center"><img src="${vo.l_url}"> ggggggg</p>
			
			  <p align="center"> 위치 : ${vo.b_location} iiiii</p> 
			
			  <P align="center">제목 : ${vo.b_subject} iiiii</P> 
			
			 <p align="center"> 저자 : ${vo.writer} iiiiii</p> 
		
			 <p align="center">출판사 : ${vo.publisher} iiiiiii</p> 
		
			  <p align="center">분류 : ${vo.category} iiiiii</p> 
		</aside>
		<footer>한빛 도서관</footer>

</body>
</html>