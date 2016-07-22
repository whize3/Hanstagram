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
	function comment_go(f) {
	
		f.action = "/HbLib/Controller?type=a_writeqcomment";
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
				<h3>Q&A</h3>
			</div>
			<hr/>
			<div class="table-wrap">
				<form method="post">
					<table width="300">
						<tbody>
							<input type="hidden" name="q_idx" value="${qna.q_idx}">			

							<tr>
								<th bgcolor="#B2EBF4">제목</th>
								<td ><input type="hidden" name="qa_subject" value="${qna.qa_subject}">${qna.qa_subject}</td>
							</tr>

							<tr>
								<th bgcolor="#B2EBF4">날짜</th>
								<td><input type="hidden" name="qa_date" value="${qna.qa_date}">${qna.qa_date}</td>
							</tr>
							<tr>
								<th bgcolor="#B2EBF4">조회수</th>
								<td ><input type="hidden" name="qa_hit" value="${qna.qa_hit}">${qna.qa_hit}</td>
							</tr>
							<tr>
								<th bgcolor="#B2EBF4">내용</th>
							</tr>
							<tr>
								<td colspan="2"><input type="hidden" name="qa_content" value="${qna.qa_content}"><pre>${qna.qa_content}</pre></td>
							</tr>
							
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2"><input type="button" value="목록"
									onclick="javascript:location.href='/HbLib/Controller?type=a_qnaList&cPage=${cPage}'" /> 
								</td>
							</tr>
						</tfoot>
					</table>
				</form>
				<div class="q_comment">
					<c:forEach var="k" items="${qclist}">
						<p>ID: ${k.id}</p>
						<p>날짜: ${k.qc_date.substring(0,10)}</p>
						<p>내용: <pre>${k.qc_content}</pre></p>
					</c:forEach>		
				
				</div>
				<div class="q_comment_write">
					<form method="post" >
						<textarea rows="4" cols="55" name="qc_content"></textarea><br/>
						<input type="hidden" name="id" value="${admin.id}"/>
						<input type="hidden" name="q_idx" value="${qna.q_idx}"/>
						<input type="button" value="댓글쓰기" onclick="comment_go(this.form)"/> 
					</form>
					<br/>
				</div>
			</div>
		</div>
	</div>
</body>
</html>