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
   /*  padding: -300px; */
    padding: 25px 50px;
    top: -250px;
    padding-top: 0px;
    padding-right: 0px;
    padding-left:  150px
}

/* section{
    margin-right:100px; 
    padding: 1em;
    display: inline-block;
    top: -50px;

} */



mainnavi {
    position: relative;
    left: 5px;
    top: -115px;
    width: 200px;
    height: 1px;
    display: block;
    text-align: left;
}
</style> 

<title>Insert title here</title>
 
 
 
 
</head>

<body>
	<header> 
 	<jsp:include page="../header.jsp" />
 </header> 
	
	
			<mainnavi>
			  <jsp:include page="search_navi.jsp" />
			</mainnavi>                     
	
		 <aside>   
		 	
			<p align="center"><img src="${vo.l_url}"> ggggggg</p>
			
			  <p align="center"> 위치 : ${vo.b_location} iiiii</p> 
			
			  <P align="center">제목 : ${vo.b_subject} iiiii</P> 
			
			 <p align="center"> 저자 : ${vo.writer} iiiiii</p> 
		
			 <p align="center">출판사 : ${vo.publisher} iiiiiii</p> 
		
			  <p align="center">분류 : ${vo.category} iiiiii</p> 
		</aside>
	

</body>
</html>