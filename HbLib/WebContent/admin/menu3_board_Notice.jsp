<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/HbLib/css/menuList.css" type="text/css" rel="stylesheet">
</head>
<body>
<jsp:include page="main.jsp"/>
	<!-- 전체 -->
	<div id="content-wrap">
		<!-- 메뉴 -->
		<div id="menu">
			<!-- menu 로고 -->
			<div class="menu-header"><img src="../img/icon_menu_book.jpg" class="img"/><h3>게시판 관리</h3><hr/></div>
			<div class="menu-wrap">
				<ul class="submenu">
					<li><span class="li-s">></span><a href="menu3_board_Notice.jsp">공지사항</a></li>
					<li><span class="li-s">></span><a href="menu3_board_QNA.jsp">Q&A</a></li>
				</ul>
			</div>
		</div>
		<!-- 내용 -->
		<div id="content">
			<div class="page-header">
				<h3>공지사항</h3>
			</div> 
			<div class="page-header-f">
				<form>
					<input type="button" value="글쓰기" style="width: 150px;" onclick="javascript:location.href='menu3_board_Notice_add.jsp'"/>
				</form>
			</div>
			<hr/>
			<div class="table-wrap">
				<table class="table">
					<thead>
						<tr style="background-color: #BCBCBC;">
							<th>순번</th>
							<th>제목</th>
							<th>작성일</th>
							<th>조회</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="k" items="${a_noticeList}">
							<tr>
								<td>${k.n_idx}</td>
								<td>${k.n_subject}</td>								
								<td>${k.n_date.substring(0,10)}</td>
								<td>${k.n_hit}</td>
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
											<li><a href="/HbLib/Controller?type=a_noticeList&cPage=${pvo.beginPage-pvo.pagePerBlock}">이전으로</a></li>
										</c:otherwise>
									</c:choose>
									
									<c:forEach var="k" begin="${pvo.beginPage}" end="${pvo.endPage}" step="1">
										<c:choose>
											<c:when test="${k==pvo.nowPage}">
												<li class="now">${k}</li>
											</c:when>
											<c:otherwise>
												<li><a href="/HbLib/Controller?type=a_noticeList&cPage=${k}">${k}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${pvo.endPage>=pvo.totalPage}">
											<li class="disable">다음으로</li>
										</c:when>
										<c:otherwise>
											<li><a href="/HbLib/Controller?type=a_noticeList&cPage=${pvo.beginPage+pvo.pagePerBlock}">다음으로</a></li>
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