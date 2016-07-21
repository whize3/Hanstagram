<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/HbLib/css/menuList.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="/HbLib/css/mylibrary.css">
<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	function write_go() {
		var login_id = "<c:out value="${user.id}" />";
		if(login_id !== ""){
			location.href="/HbLib/board/qnawrite.jsp";
		}else{
			alert("로그인 해주세요.");
		}
		
	}
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_02").css("background-color", "gray")
	});
</script>
</head>
<jsp:useBean id="qnalist" class="java.util.ArrayList" scope="request"/>
<jsp:setProperty property="*" name="qnalist"/>
	<jsp:include page="../header.jsp" />
	<div class="mainArea">
		<div class="mainArea2">
			<jsp:include page="board_navi.jsp" />
			<div id="mainview">
				<div class="mainviewnavi">◆게시판> QNA</div>
				<div>
					<div align="center">
					<input type="hidden" class="id" value="${user.id}" >
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
						<c:forEach var="k" items="${qnalist}">
							<tr>
								<td>${pvo.totalRecord-k.r_num+1}</td>
								<td><a href="Controller?type=oneqna&q_idx=${k.q_idx}">${k.qa_subject}</a></td>								
								<td>${k.qa_date.substring(0,10)}</td>
								<td>${k.qa_hit}</td>
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
											<li><a href="/HbLib/Controller?type=qnalist&cPage=${pvo.beginPage-pvo.pagePerBlock}">이전으로</a></li>
										</c:otherwise>
									</c:choose>
									
									<c:forEach var="k" begin="${pvo.beginPage}" end="${pvo.endPage}" step="1">
										<c:choose>
											<c:when test="${k==pvo.nowPage}">
												<li class="now">${k}</li>
											</c:when>
											<c:otherwise>
												<li><a href="/HbLib/Controller?type=qnalist&cPage=${k}">${k}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${pvo.endPage>=pvo.totalPage}">
											<li class="disable">다음으로</li>
										</c:when>
										<c:otherwise>
											<li><a href="/HbLib/Controller?type=qnalist&cPage=${pvo.beginPage+pvo.pagePerBlock}">다음으로</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
								<input type="button" value="글쓰기" onclick="write_go()">
							</td>
							
							
						</tr>
							
					</tfoot>
				</table>
				</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
<body>

</body>
</html>