<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/HbLib/css/menuList.css" type="text/css" rel="stylesheet">

<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		$("input[name=applyBtn]").click(function(){
			/* $(".locationInput").show(); */
			var btnId = $(this).attr("id");
			$("."+btnId+"1").show();
			$("."+btnId+"btns").hide();
		});
		$("#cancle").click(function() {
			var btnId = $(this).attr("class");
			$("."+btnId+"btns").show();
			$("."+btnId+"1").hide();
		});
		
		$("input[name=refuseBtn]").click(function(){
			var btnId = $(this).attr("id");
			$("."+btnId+"2").show();
			$("."+btnId+"btns").hide();
		});
		$("#cancle2").click(function() {
			var btnId = $(this).attr("class");
			$("."+btnId+"btns").show();
			$("."+btnId+"2").hide();
		});	
		
		$("#applyOk").click(function() {
			var ba_idx = $(this).closest("tr").find(".ba_idx").text();
			var locatio = $("input[name=location]").val();
			var b_num = $("input[name=b_num]").val();
			location.href="/HbLib/Controller?type=a_applyOk&ba_idx="+ba_idx+"&location="+locatio+"&b_num="+b_num;		
		});
		$("#refuse_go").click(function() {
			var ba_idx = $(this).closest("tr").find(".ba_idx").text();
			var refuse = $("input[name=refuse]").val();
			alert("구입거절 되었습니다.");
			location.href="/HbLib/Controller?type=a_applyRefuse&refuse="+refuse+"&ba_idx="+ba_idx;			
		});
				
	});

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
					<li><span class="li-s">></span><a href="/HbLib/Controller?type=a_booklist">도서 조회/추가</a></li>
					<li><span class="li-s">></span><a href="/HbLib/Controller?type=a_applyBookList">희망 도서 조회</a></li>
				</ul>
			</div>
		</div>
		<!-- 내용 -->
		<div id="content">
			<div class="page-header">
				<h3>희망 도서 조회</h3>
			</div>
			<hr/>
			<div class="table-wrap">
				<table class="table">
					<thead>
						<tr style="background-color: #BCBCBC;">
							<th>번호</th>
							<th>ID</th>
							<th>제목</th>
							<th>장르</th>
							<th>신청일</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
					
						<c:forEach items="${a_applyBookList}" var="k">
							<tr>
								<td class="ba_idx">${k.ba_idx}</td>
								<td>${k.id}</td>
								<td class="b_subject">${k.b_subject}</td>
								<td>${k.category}</td>
								<td>${k.ba_date.substring(0,10)}</td>
								<td class="ba_state">${k.ba_state}</td>								
								<td>
								<c:if test="${k.ba_state eq '신청중'}">
									<div class="applyForm">
									<form>
										<p class="${k.ba_idx}1" style="display:none;">
											위치 : <input type="text" name="location" />
											<input type="button" value="등록" id="applyOk" />
											<input type="button" value="취소" class="${k.ba_idx}" id="cancle"/>
											
										</p>
										<p class="${k.ba_idx}2" style="display:none;">
											거절사유 : <input type="text" name="refuse" />
											<input type="button" value="등록" id="refuse_go" />
											<input type="button" value="취소" class="${k.ba_idx}" id="cancle2"/>
											<input type="hidden" name="type" value="a_applyRefuse"/>
										</p>
										<p class="${k.ba_idx }btns">
											<input type="button" value="거절" name="refuseBtn" id="${k.ba_idx}"/>
											<input type="button" value="수락" name="applyBtn" id="${k.ba_idx}" />
										</p>
									</form>
									
									</div>
								</c:if>
								</td>
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
											<li><a href="/HbLib/Controller?type=a_applyBookList&cPage=${pvo.beginPage-pvo.pagePerBlock}">이전으로</a></li>
										</c:otherwise>
									</c:choose>
									
									<c:forEach var="k" begin="${pvo.beginPage}" end="${pvo.endPage}" step="1">
										<c:choose>
											<c:when test="${k==pvo.nowPage}">
												<li class="now">${k}</li>
											</c:when>
											<c:otherwise>
												<li><a href="/HbLib/Controller?type=a_applyBookList&cPage=${k}">${k}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${pvo.endPage>=pvo.totalPage}">
											<li class="disable">다음으로</li>
										</c:when>
										<c:otherwise>
											<li><a href="/HbLib/Controller?type=a_applyBookList&cPage=${pvo.beginPage+pvo.pagePerBlock}">다음으로</a></li>
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