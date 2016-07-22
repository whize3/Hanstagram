<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/HbLib/css/mylibrary.css">
<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	function search_go() {
		document.f.action = "/HbLib/Controller";
		document.f.submit();
	}
	
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_01").css("background-color", "gray")
	});
</script>
<style type="text/css">
aside {
     padding: 0;
    margin-top: -15%;
    padding-left: 269px;
    
}
div1{
    padding-left: 100px;
}

#mainnavi {
    position: relative;
    left: 250px;
    top: 100px;
    width: 200px;
    height: 250px;
    display: block;
    text-align: left;
}
</style>
</head>
<body>

	
	<jsp:include page="../header.jsp" />
	<div>
	<div class="searchview">
		<jsp:include page="search_navi.jsp" />
	</div>
	
	<form method="post" name="f">	
	
	<aside>
	<div align="center">
		<div class="searchdetail">
		<img src="/HbLib/img/search_img.JPG">
			<li class="serchWord">
			<select  name="idx">
					<option value="0">전체</option>
					<option value="1">저자</option>
					<option value="2">출판사</option>
					<option value="3">제목</option>
					<option value="4">분류</option>
			</select> 
			<input type="text" name="keyword" /> 
			<input type="hidden" name="type" value="search" />
			<input type="button" value="검색" onclick="search_go()" />
	<br />
		</div>
		 <label> 비도서 <input  type="checkbox"     name="chk" value="1" /></label>
		 <label>인기자료<input	  type="checkbox"     name="chk" value="2" /></label> 
		 <label>신착자료<input	  type="checkbox"     name="chk" value="3" /></label>

	</div>
	<br />
	<div align="center">
					<span>정렬</span> 
					<select name="desearch">
							<option value="0">자료명</option>
							<option value="1">저자</option>
							<option value="3">출판사</option>
					</select>
				
			
			
  </div>
  </aside>
</form>

</body>
</html>