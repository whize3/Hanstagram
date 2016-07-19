<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/HbLib/css/mylibrary.css">
<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_05").css("background-color", "gray")
		$("#btn1").click(function(){
			location.href="/HbLib/Controller?type=draw&id=aaa";
		});
	});
</script>
</head>
<body>
<jsp:useBean id="user" scope="session" class="com.hb.mybatis.UsersVO" />
<jsp:setProperty property="*" name="user" />
<c:if test="${user.id==null }">
<script type="text/javascript">
alert("로그인해주세요")
history.go(-1)
</script>
</c:if>
	<jsp:include page="../header.jsp" />
	<div class="mainArea">
		<div class="mainArea2">
			<jsp:include page="my_navi.jsp" />
			<div id="mainview">
				<div class="mainviewnavi">◆My Library > 대출반납이력</div>
				<div>
					<div class="mainview_c_btn">
						<input type="button" value="대출현황" id="btn1">
					</div>
					<div align="center">
						<table width="680">
							<thead>
								<tr align="left">
									<th width="250">제목</th>
									<th width="150">저자</th>
									<th width="130">고유번호</th>
									<th width="150">반납일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="4"><hr color="black" /></td>
								</tr>
								<!-- for시작ㄱ -->
								<c:if test="${empty list}">
				  				<tr><td colspan="4"> 현재 등록된 자료가 없음 </td></tr>
								</c:if>
								<c:if test="${!empty list}">
								<c:forEach var="k" items="${list }"  varStatus="index">
								<tr>
									<td>${pvo.totalRecord - k.r_num +1} ${k.b_subject }</td>
									<td>${k.writer }</td>
									<td>${k.isbn }</td>
									<td>${k.bd_redate.substring(0,10) }</td>
								</tr>
								<tr>
									<td colspan="4"><hr /></td>
								</tr>
								</c:forEach>
								</c:if>
								<!-- for끝 -->
							</tbody>
										<tfoot>
				<tr>
					<td colspan="4">
						<ol class="paging">
						<!--  이전버튼 은 beginPage가 pagePerBlock보다 작으면 비활성화 -->
						<c:choose>
							<c:when test="${pvo.beginPage < pvo.pagePerBlock}">
								  <li class="disable">이전으로</li>
							</c:when>
							<c:otherwise>
							 <li><a href="/HbLib/Controller?type=history&cPage=${pvo.beginPage-pvo.pagePerBlock }&id=${user.id}">이전으로</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach var="k" begin="${pvo.beginPage}" end="${pvo.endPage}" step="1">
							<c:choose>
								<c:when test="${k==pvo.nowPage}">
									<li class="now">${k}</li>
								</c:when>
								<c:otherwise>
									<li><a href="/HbLib/Controller?type=history&cPage=${k}&id=${user.id}">${k}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${pvo.endPage>=pvo.totalPage}">
								  <li class="disable">다음으로</li>
							</c:when>
							<c:otherwise>
								 <li><a href="/HbLib/Controller?type=history&cPage=${pvo.beginPage+pvo.pagePerBlock }&id=${user.id}">다음으로</a></li>
							</c:otherwise>
						</c:choose>
						</ol>
					</td>
					<td>
						<input type="button" value="글쓰기" onclick="javascript:location.href='/0625_jsp_MVC_BBS/MyController?type=write'"/>
					</td>
				</tr>
			</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>