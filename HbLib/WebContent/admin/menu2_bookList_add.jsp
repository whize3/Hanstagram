<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/HbLib/css/menuList.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
	function book_add(f) {
		f.action="/HbLib/Controller?type=a_bookAdd&chk=chk";
		f.submit();
	}
</script>
</head>
<body>
<jsp:include page="main.jsp"/>
	<!-- 전체 -->
	<div id="content-wrap">
		<!-- 메뉴 -->
		<div id="menu">
			<!-- menu 로고 -->
			<div class="menu-header"><img src="../img/icon_menu_book.jpg" class="img"/><h3>도서관리</h3><hr/></div>
			<div class="menu-wrap">
				<ul class="submenu">
					<li><span class="li-s">></span><a href="menu2_bookList.jsp">도서 조회/추가</a></li>
					<li><span class="li-s">></span><a href="menu2_bookList2.jsp">희망 도서 조회</a></li>
				</ul>
			</div>
		</div>
		<!-- 내용 -->
		<div id="content">
			<div class="page-header">
				<h3>도서 검색</h3>
			</div>
			<hr/>
			<div class="book-search">
				<a>dddddd</a>
			</div>
			<div class="page-header">
				<h3>도서 추가</h3>
			</div>
			<hr/>
			<div class="table-wrap2">
				<table class="table-add" style="border: 1px solid #AEAEAE; margin: auto; width: 90%; text-align: left;">
					<tbody>
						<tr>
							<th>번호</th><td><input type="text" name="b_num"/></td>
						</tr>
						<tr>
							<th>제목</th><td><input type="text" name="b_subject"/></td>
						</tr>
						<tr>
							<th>위치</th><td><input type="text" name="b_location"/></td>
						</tr>
						<tr>
							<th>출판사</th><td><input type="text" name="publisher"/></td>
						</tr>
						<tr>
							<th>저자</th><td><input type="text" name="writer"/></td>
						</tr>
						<tr>
							<th>장르</th>
							<td>
								<select name="category">
									<option value="인문">인문</option>
									<option value="과학">과학</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>ISBN</th><td><input type="text" name="isbn"/></td>
						</tr>
						<tr>
							<th>IMAGE URL</th><td><input type="text" name="img_url"/></td>
						</tr>
						
					</tbody>
				</table><br/><br/>
				
			</div>
			<div align="center">
				<form>
				<input type="button" style="text-align: center;" value="도서추가" onclick="book_add(this.form)">
				</form>
			</div>
		</div>
	</div>
</body>
</html>