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
		var option2 = "<c:out value='${option}'/>";
		var keyword2 = "<c:out value='${keyword}'/>";
		if (option2 == "main") {
			$("#main").addClass("selected");
			$("#mainsubject").addClass("none");
			$("#mainwriter").addClass("none");
			$("#mainpublisher").addClass("none");
			$("#mainisbn").addClass("none");
		} else if (option2 == "mainsubject") {
			$("#main").addClass("none");
			$("#mainsubject").addClass("selected");
			$("#mainwriter").addClass("none");
			$("#mainpublisher").addClass("none");
			$("#mainisbn").addClass("none");
		} else if (option2 == "mainwriter") {
			$("#main").addClass("none");
			$("#mainsubject").addClass("none");
			$("#mainwriter").addClass("selected");
			$("#mainpublisher").addClass("none");
			$("#mainisbn").addClass("none");
		} else if (option2 == "mainpublisher") {
			$("#main").addClass("none");
			$("#mainsubject").addClass("none");
			$("#mainwriter").addClass("none");
			$("#mainpublisher").addClass("selected");
			$("#mainisbn").addClass("none");
		} else if (option2 == "mainisbn") {
			$("#main").addClass("none");
			$("#mainsubject").addClass("none");
			$("#mainwriter").addClass("none");
			$("#mainpublisher").addClass("none");
			$("#mainisbn").addClass("selected");
		}
		$("#btn1").click(function() {
			location.href = "/HbLib/Controller?type=history&id=${user.id}";
		});
		$("#btn2").click(function() {
			location.href = "/HbLib/guide/libinfo3.jsp";
		});
		$("#main")
				.click(
						function() {
							location.href = "/HbLib/Controller?type=mainsearch&keyword="
									+ keyword2 + "&option=main";
						});
		$("#mainsubject")
				.click(
						function() {
							location.href = "/HbLib/Controller?type=mainsearch&keyword="
									+ keyword2 + "&option=mainsubject";
						});
		$("#mainwriter")
				.click(
						function() {
							location.href = "/HbLib/Controller?type=mainsearch&keyword="
									+ keyword2 + "&option=mainwriter";
						});
		$("#mainpublisher")
				.click(
						function() {
							location.href = "/HbLib/Controller?type=mainsearch&keyword="
									+ keyword2 + "&option=mainpublisher";
						});
		$("#mainisbn")
				.click(
						function() {
							location.href = "/HbLib/Controller?type=mainsearch&keyword="
									+ keyword2 + "&option=mainisbn";
						});
	});
</script>
<style type="text/css">
/*common blue tabs*/
ul.tabs {
	list-style: none;
	overflow: hidden;
	padding-left: 20px;
	font-size: 13px;
	color: #35b7e1
}

ul.tabs li {
	display: inline;
}

ul.tabs li a {
	display: inline-block;
	float: left;
	padding: 0 15px;
	height: 32px;
	line-height: 30px;
	color: #000;
	border: 1px solid #ccc;
	background: #eee;
	letter-spacing: -1px;
	margin-right: 2px;
	outline: none;
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
}

ul.tabs li a.selected {
	background: #fff;
	position: relative;
	top: 0;
	border: 2px solid #007deb;
	border-bottom: none;
	z-index: 2;
	color: #007deb;
	font-weight: bold
}

ul.tabs li a.none {
	display: inline-block;
	float: left;
	padding: 0 15px;
	height: 32px;
	line-height: 30px;
	color: #000;
	border: 1px solid #ccc;
	background: #eee;
	letter-spacing: -1px;
	margin-right: 2px;
	outline: none;
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
}

.tabline {
	border-top: 1px #007deb solid;
	position: relative;
	margin: -1px 0 0 0;
}

#pages_top {
	margin-top: 345px;
	margin-left: -150px;
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

.row {
	padding: 8px 0;
	display: block;
}

.wrapper {
	margin: 0 auto;
	padding: 40px;
	margin-left: -150px;
	max-width: 950px;
}

.cell {
font-size:12px;
	width:150px;
	padding: 6px 12px;
	display: table-cell;
}
</style>
</head>
<body>
	<jsp:useBean id="user" scope="session" class="com.hb.mybatis.UsersVO" />
	<jsp:setProperty property="*" name="user" />
	<jsp:include page="header.jsp" />
	<div class="mainArea">
		<div class="mainArea2">
			<div id="mainview">
				<div id="pages_top">
					<ul class="tabs">
						<li><a href="#" id="main">통합검색 </a></li>
						<li><a href="#" id="mainsubject">제목</a></li>
						<li><a href="#" id="mainwriter">저자</a></li>
						<li><a href="#" id="mainpublisher">출판사</a></li>
						<li><a href="#" id="mainisbn">고유번호</a></li>
					</ul>
					<div class="tabline"></div>
				</div>
				<div>
					<div class="wrapper">

						<div class="table">

							<div class="row header blue">
								<div class="cell">책제목</div>
								<div class="cell">책위치</div>
								<div class="cell">출판사</div>
								<div class="cell">작가</div>
								<div class="cell">분류</div>
								<div class="cell">고유번호</div>
							</div>
							<c:forEach items="${list }" var="k">
								<div class="row">
									<div class="cell">${k.b_subject }</div>
									<div class="cell">${k.b_location }</div>
									<div class="cell">${k.publisher }</div>
									<div class="cell">${k.writer }</div>
									<div class="cell">${k.category }</div>
									<div class="cell">${k.isbn }</div>
								</div>
								<br />
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>