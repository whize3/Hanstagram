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
			<div class="menu-header"><img src="/HbLib/img/icon_menu_book.jpg" class="img"/><h3>게시판 관리</h3><hr/></div>
			<div class="menu-wrap">
				<ul class="submenu">
					<li><span class="li-s">></span><a href="/HbLib/Controller?type=a_noticeList">공지사항</a></li>
					<li><span class="li-s">></span><a href="/HbLib/Controller?type=a_qnaList">Q&A</a></li>
				</ul>
			</div>
		</div>
		<!-- 내용 -->
		<div id="content">
			<div class="page-header">
				<h3>공지사항</h3>
			</div> 
			
			<hr/>
			<div class="table-wrap">
				<form method="post">
							<table width="300">
								<tbody>
									<tr>
										<th bgcolor="#B2EBF4">번호</th>
										<td>${notice.n_idx}</td>
									</tr>

									<tr>
										<th bgcolor="#B2EBF4">제목</th>
										<td>${notice.n_subject}</td>
									</tr>
									<tr>
										<th bgcolor="#B2EBF4">첨부파일</th>
									</tr>

									<tr>
										<th bgcolor="#B2EBF4">날짜</th>
										<td>${notice.n_date}</td>
									</tr>
									<tr>
										<th bgcolor="#B2EBF4">내용</th>
									</tr>
									<tr>
										<td colspan="2"><pre>${notice.n_content}</pre></td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="2"><input type="button" value="목록"
											onclick="javascript:location.href='/HbLib/Controller?type=a_noticeList&cPage=${cPage}'" /> 

									</tr>

								</tfoot>
							</table>
						</form>
			</div>
		</div>
	</div>
</body>
</html>