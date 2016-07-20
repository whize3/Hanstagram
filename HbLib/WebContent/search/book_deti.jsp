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

	});
</script>
<style>
header{
    padding: 1em;
    color: white;
    
}
footer {
    padding: 1em;
    align : center;
    text-align: right;
}
</style> 

<title>Insert title here</title>
</head>
<body>

	 <header> 
	 <jsp:include page="../header.jsp" /> 
	 <jsp:include page="my_navi.jsp" />
	 </header> 
	
		 <footer>       
			 <p align="center"><img src="${vo.l_url}"> ggggggg</p>
			  위치 : ${vo.b_location} iiiii 
			 <br/> 
			  제목 : ${vo.b_subject} iiiii 
			 <br/> 
			  저자 : ${vo.writer} iiiiii 
			 <br/> 
			 출판사 : ${vo.publisher} iiiiiii 
			 <br/>
			  분류 : ${vo.category} iiiiii 
		 </footer> 

</body>
</html>