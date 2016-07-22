<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/HbLib/css/main2.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/HbLib/main.js"></script>
<script type="text/javascript">
$(function(){
	$("#notice li").click(function(){
		$("#notice .on").removeClass("on");
		$(this).addClass("on");
	})
	
});
function moveBanner(a){
	
} 
</script>
</head>
<body>
<div id="container">
	<div class="wrap">
		<div id="notice">
			<ul>
				<li class="on"><h2><a href="#">공지사항</a></h2>
				<!-- <a href="Controller?type=noticelist"></a> -->
				<div>
					<ul>
						<c:forEach items="${notice}" var="k" begin="0" end="4">
							<li><span class="noticeType">공지</span><a href="Controller?type=onenotice&n_idx=${k.n_idx}">${k.n_subject}</a></li>
						</c:forEach>
					</ul>
				</div>
				</li>
				
				<li><h2><a href="#">Q&A</a></h2>
				<div>
					<ul>
						<c:forEach items="${qna}" var="k" begin="0" end="4">
							<li><span class="noticeType">Q&A</span><a href="Controller?type=oneqna&q_idx=${k.q_idx}">${k.qa_subject}</a></li>
						</c:forEach>
					</ul>
				</div>
				</li>
			</ul>
		</div>
		<div id="event">
			<!-- <img src="img/banner4.jpg"> -->
			<%@include file="banner.html" %>
		</div>
		<div id="login">
			<jsp:include page="login.jsp"/> 
		</div>
		</div>
	<div class="wrap">
		<div id="books">
			<ul>
				<li class="on">
					<h2><a href="#">신규 도서</a></h2>
					<div>
					<div>
						<ul style="width:2544px;left:0px;" id="newbookbanner">
						<c:forEach var="k" items="${newbook}" begin="0" end="10">
							<li class="newbookli">
							<a href="">
								<span class="bookCover"><img src="${k.l_url}"></span>
								<span class="bookTit">${k.b_subject}</span>
								<span class="writer">${k.writer}</span>
							</a>
						</li>
						</c:forEach>
						</ul>
					</div>
					</div>
					<div class="bookBtn">
					<a href="#" class="newbookpre">
						<img src="./img/main_prev.png">
					</a>
					<a href="#" class="newbooknext">
						<img src="./img/main_next.png">
					</a>
					</div>
				</li>
				<li>
					<h2><a href="#">인기  도서</a></h2>
					<div>
					<div>
						<ul style="width:2544px;left:0px;" id="hotbookbanner">
						<c:forEach var="k" items="${hotbook}" begin="0" end="10">
							<li class="hotbookli">
							<a href="">
								<span class="bookCover"><img src="${k.s_url}"></span>
								<span class="bookTit">${k.b_subject}</span>
								<span class="writer">${k.writer}</span>
							</a>
						</li>
						</c:forEach>
						</ul>
					</div>
					</div>
					<div class="bookBtn">
					<a href="#" class="hotbookpre">
						<img src="./img/main_prev.png">
					</a>
					<a href="#" class="hotbooknext">
						<img src="./img/main_next.png">
					</a>
					</div>
				</li>
			</ul>
		</div>
		<div id="current">
			<p>열람실 좌석 현황 <a href="/HbLib/guide/libinfo1.jsp"><span class="currentType">이용안내</span></a></p>
			<ul>
				<li>제 1 열람실 : 
				<c:forEach items="${map }" var="k">
				<c:if test="${k.key=='cnt2' }">
				${k.value }
				</c:if>
				</c:forEach>/
				<c:forEach items="${map }" var="k">
				<c:if test="${k.key=='cnt1' }">
				${k.value }
				</c:if>
				</c:forEach>
				</li>
				<li>제 2 열람실 : 
				<c:forEach items="${map }" var="k">
				<c:if test="${k.key=='cnt4' }">
				${k.value }
				</c:if>
				</c:forEach>/
				<c:forEach items="${map }" var="k">
				<c:if test="${k.key=='cnt3' }">
				${k.value }
				</c:if>
				</c:forEach>
				</li>
				<li>제 3 열람실 : 
				<c:forEach items="${map }" var="k">
				<c:if test="${k.key=='cnt6' }">
				${k.value }
				</c:if>
				</c:forEach>/
				<c:forEach items="${map }" var="k">
				<c:if test="${k.key=='cnt5' }">
				${k.value }
				</c:if>
				</c:forEach>
				</li>
			</ul>
			<p>스터디룸 이용 현황 <a href="/HbLib/guide/libinfo1.jsp"><span class="currentType">이용안내</span></a></p>
			<ul>
				<li>1층 : ${studyroom1}/3</li>
				<li>2층 : ${studyroom2}/4</li>
				<li>3층 : ${studyroom3}/4</li>
			</ul>
		</div>
	</div>

</div>
</body>
</html>