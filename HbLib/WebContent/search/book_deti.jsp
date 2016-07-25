<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/HbLib/css/mylibrary.css">
<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_01").css("background-color", "gray")
	});
</script>
<style type="text/css">
a.button {
	font-size: 12px;
	font-weight: 600;
	color: white;
	padding: 10px 10px 0px 10px;
	margin: 5px 5px 5px 5px;
	display: inline-block;
	float: left;
	text-decoration: none;
	height: 27px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	background-color: #3a57af;
	-webkit-box-shadow: 0 3px rgba(58, 87, 175, .75);
	-moz-box-shadow: 0 3px rgba(58, 87, 175, .75);
	box-shadow: 0 3px rgba(58, 87, 175, .75);
	transition: all 0.1s linear 0s;
	top: 0px;
	position: relative;
}

a.button:hover {
	top: 3px;
	background-color: #2e458b;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
}

input[type=text], input[type=password] {
	height: 29px;
	-webkit-border-radius: 0px 4px 4px 0px/5px 5px 4px 4px;
	-moz-border-radius: 0px 4px 4px 0px/0px 0px 4px 4px;
	border-radius: 0px 4px 4px 0px/5px 5px 4px 4px;
	background-color: #fff;
	-webkit-box-shadow: 1px 2px 5px rgba(0, 0, 0, .09);
	-moz-box-shadow: 1px 2px 5px rgba(0, 0, 0, .09);
	box-shadow: 1px 2px 5px rgba(0, 0, 0, .09);
	border: solid 1px #cbc9c9;
	margin-left: -5px;
	margin-top: 8px;
	padding-left: 10px;
}

h3 {
	font-size: 16px;
	font-weight: 300;
	color: #4c4c4c;
	text-align: center;
	padding-top: 10px;
	margin-bottom: 10px;
}

.wrapper {
	margin: 0 auto;
	padding: 40px;
	max-width: 800px;
}

.table {
	margin: 0 0 40px 0;
	width: 100%;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
	display: table;
}

.row {
	display: table-row;
	background: #f6f6f6;
}

.row3 {
	display: none;
	background: #f6f6f6;
	width: 700px;
}

.row:nth-of-type(odd) {
	background: #e9e9e9;
}

.row.header {
	font-weight: 900;
	color: #ffffff;
	background: #ea6153;
}

.row.green {
	background: #27ae60;
}

.row.blue {
	background: #2980b9;
}

.cell {
	padding: 6px 12px;
	display: table-cell;
}

.cell2 {
	width: 150px;
	vertical-align: top;
	padding: 6px 12px;
	display: table-cell;
	color: #ffffff;
	background: #ea6153;
}

div.colspan, div.colspan+div.cell {
	border: 0;
}

div.colspan>div {
	width: 1px;
}

div.colspan>div>div {
	position: relative;
	width: 660px;
	overflow: hidden;
}
.pre1{
 white-space:pre-wrap;
}
</style>
<style type="text/css">
#showc {
	display: none;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#xx").click(function() {
			$("#showc").css("display", "none")
		})
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="mainArea">
		<div class="mainArea2">
			<jsp:include page="search_navi.jsp" />
			<div id="mainview">
				<div>
					<div align="left">
						<div class="table">
							<div class="row">
								<div class="cell2">책정보</div>
								<div class="cell">
									<img src="${vo.l_url}">
								</div>
							</div>
							<div class="row">
								<div class="cell2">책제목</div>
								<div class="cell">${vo.b_subject }</div>
							</div>
							<div class="row">
								<div class="cell2">책위치</div>
								<div class="cell">${vo.b_location }</div>
							</div>
							<div class="row">
								<div class="cell2">출판사</div>
								<div class="cell">${vo.publisher }</div>
							</div>
							<div class="row">
								<div class="cell2">작가</div>
								<div class="cell">${vo.writer }</div>
							</div>
							<div class="row">
								<div class="cell2">분류</div>
								<div class="cell">${vo.category }</div>
							</div>
							<div class="row">
								<div class="cell2">고유번호</div>
								<div class="cell">${vo.isbn }</div>
							</div>
						</div>

						<div class="table">
							<div class="row header green">
								<div class="cell">작성자</div>
								<div class="cell">내용</div>
								<div class="cell">작성일</div>
							</div>
							<c:forEach items="${list }" var="k">
								<div class="row" id="${k.bc_idx }">
									<div class="cell">${k.id }</div>
									<div class="cell">
										<c:choose>
											<c:when test="${fn:length(k.bc_content) > 14}">
												<c:out value="${fn:substring(k.bc_content,0,13)}" />....
           									</c:when>
											<c:otherwise>
												<c:out value="${k.bc_content}" />
											</c:otherwise>
										</c:choose>
									</div>
									<div class="cell">${k.bc_date.substring(0,10) }</div>
								</div>
								<div class="row3" id="${k.bc_idx }show">
									<div class="cell colspan">
										<div>
											<div><pre class="pre1">${k.bc_content }</pre></div>
										</div>
									</div>
									<div class="cell"></div>
									<div class="cell"></div>
								</div>
								<script type="text/javascript">
									$(function() {
										$("#<c:out value='${k.bc_idx}'/>").click(function() {
											$("#<c:out value='${k.bc_idx}'/>show").css("display","table-row")
										});
										$("#<c:out value='${k.bc_idx}'/>show").click(function(){
											$("#<c:out value='${k.bc_idx}'/>show").css("display","none")	
										});
									});
								</script>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>