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
	function addBook_go(f) {
		f.action="/HbLib/admin/menu2_bookList_add.jsp";
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
			<div class="menu-header"><img src="/HbLib/img/icon_menu_book.jpg" class="img"/><h3>도서관리</h3><hr/></div>
			<div class="menu-wrap">
				<ul class="submenu">
					<li><span class="li-s">></span><a href="/HbLib/Controller?type=a_booklist">도서 조회/추가</a>
					<li><span class="li-s">></span><a href="/HbLib/Controller?type=a_applyBookList">희망 도서 조회</a></li>
				</ul>
			</div>
		</div>
		<!-- 내용 -->
		<div id="content">
			<div class="page-header">
				<h3>도서 조회/추가</h3>
			</div>
			<div class="page-header-f">
				<form>
					<input type="button" value="도서 추가" style="width: 150px;" onclick="addBook_go(this.form)"/>
				</form>
			</div>
			<hr/>
			<div class="table-wrap">
				<table class="table">
					<thead>
						<tr style="background-color: #BCBCBC;">
							<th>번호</th>
							<th></th>
							<th>제목</th>
							<th>위치</th>
							<th>출판사</th>
							<th>저자</th>
							<th>장르</th>
							<th>ISBN</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${a_booklist}" var="k">
							<tr>
								<td>${k.b_num}</td>
								<td><img src="${k.s_url}"/></td>
								<td>${k.b_subject}</td>
								<td>${k.b_location}</td>
								<td>${k.publisher}</td>
								<td>${k.writer}</td>
								<td>${k.category}</td>
								<td>${k.ISBN}</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr style="text-align: center;">
							<td colspan="5">
								<ul class="paging">
									<c:choose>
										<c:when test="${pvo.beginPage<pvo.pagePerBlock}">
											<li class="disable">이전으로</li>
										</c:when>
										<c:otherwise>
											<li><a href="/HbLib/Controller?type=a_booklist&cPage=${pvo.beginPage-pvo.pagePerBlock}">이전으로</a></li>
										</c:otherwise>
									</c:choose>
									
									<c:forEach var="k" begin="${pvo.beginPage}" end="${pvo.endPage}" step="1">
										<c:choose>
											<c:when test="${k==pvo.nowPage}">
												<li class="now">${k}</li>
											</c:when>
											<c:otherwise>
												<li><a href="/HbLib/Controller?type=a_booklist&cPage=${k}">${k}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${pvo.endPage>=pvo.totalPage}">
											<li class="disable">다음으로</li>
										</c:when>
										<c:otherwise>
											<li><a href="/HbLib/Controller?type=a_booklist&cPage=${pvo.beginPage+pvo.pagePerBlock}">다음으로</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</td>
						</tr>
						</tfoot>
				</table>
			</div>
		</div>
	</div>
</body>
</html>