<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function search_go() {
		document.f.action = "/HbLib/Controller";
		document.f.submit();
		
	}

</script>
</head>
<body>


	<jsp:include page="header.jsp" />
	<div class="searchview">
		<jsp:include page="my_navi.jsp" />
	</div>
	<form method="post" name="f">	
	<div align="center">
		<div class="searchdetail">
			<li class="serchWord">
			<select name="booksearch">
					<option value="0">전체</option>
					<option value="1">저자</option>
					<option value="2">출판사</option>
					<option value="3">제목</option>
					<option value="4">분류</option>
			</select> 
			<input type="text" name="keyword" /> 
	<br />
		</div>
		 <label> 비도서   <input type="checkbox"   name="chk" value="1" /></label>
		 <label>인기자료<input	type="checkbox"     name="chk" value="2" /></label> 
		 <label>신착자료<input	type="checkbox"     name="chk" value="3" /></label>

	</div>
	<br />
	<div align="center">
					<span>정렬</span> 
					<select name="desearch">
							<option value="S_TITL">자료명</option>
							<option value="S_WRI">저자</option>
							<option value="S_PUB">출판사</option>
					</select>
					
			 <span>순서</span> 
					<select name="sunser">
							<option value="asc">오름차순</option>
							<option value="desc">내림차순</option>
					</select>
			
			<input type="hidden" name="type" value="search" /> 
			<br/>
		
			<input type="button" value="검색" onclick="search_go()" />
  </div>
</form>

</body>
</html>