<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/mylibrary.css">
<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_05").css("background-color", "gray")
		$("#btn1").click(function(){
			location.href="/teampj/Controller?type=draw&id=aaa";
		});
	});
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
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
								<c:forEach var="k" items="${list }">
								<tr>

									<td>���Ŀ�¯¯��</td>
									<td>���Ŀ�</td>
									<td>599</td>
									<td	>2016-07-11</td>

									<td>${k.b_subject }</td>
									<td>${k.writer }</td>
									<td>${k.isbn }</td>
									<td>${k.bd_redate.substring(0,10) }</td>

								</tr>
								<tr>
									<td colspan="4"><hr /></td>
								</tr>
								</c:forEach>
								<!-- for끝 -->
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>