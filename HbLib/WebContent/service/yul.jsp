<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/HbLib/css/mylibrary.css">
<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<style type="text/css">
ul.yul {
	list-style: none;
}

ul.yul li {
	float: left;
	margin-top:8px;
	margin-right: 8px;
	width: 30px;
}
ul.yul2 li {
	margin-top:8px;
	margin-right: 28px;
	width: 30px;
}
ul.yul li a {
	display: block;
	padding: 3px 7px;
	border: 1px solid #00B3DC;
	color: #2f313e;
	font-weight: bold;
}

.ok {
	padding: 3px 7px;
	border: 1px solid silver;
	color: black;
}

.no {
	padding: 3px 7px;
	border: 1px solid black;
	background: gray;
	color: silver;
	font-weight: bold;
}
#location1_1{
	position: relative;
	left: 5px;
	top: 50px;
	width: 50px;
	height: 500px;
	display: block;
	text-align: left;
}
#location1_2{
	position: relative;
	left: 60px;
	top: -133px;
	width: 600px;
	height: 50px;
	display: block;
	text-align: left;
}
#location1_3{
	position: relative;
	left: 90px;
	top: -480px;
	width: 200px;
	height: 50px;
	display: block;
	text-align: left;
}
#location1_4{
	position: relative;
	left: 180px;
	top: -545px;
	width: 250px;
	height: 50px;
	display: block;
	text-align: left;
}
#location1_5{
	position: relative;
	left: 450px;
	top: -735px;
	width: 250px;
	height: 50px;
	display: block;
	text-align: left;
}
#location2_5{
	position: relative;
	left: 450px;
	top: -820px;
	width: 250px;
	height: 50px;
	display: block;
	text-align: left;
}
#location1{
	display:block;
}
#location2{
	display:none;
}
#location3{
	display:none;
}
#location{
	height: 500px;
	overflow: hidden;
}
#floor{
	text-align: right;
	margin-right: 70px;
}
</style>
<script type="text/javascript">
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_05").css("background-color", "gray")
		$("#floor1").click(function(){
			$("#location1").css("display","block")
			$("#location2").css("display","none")
			$("#location3").css("display","none")
		});
		$("#floor2").click(function(){
			$("#location1").css("display","none")
			$("#location2").css("display","block")
			$("#location3").css("display","none")
		});
		$("#floor3").click(function(){
			$("#location1").css("display","none")
			$("#location2").css("display","none")
			$("#location3").css("display","block")
		});
	});
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="mainArea2">
		<jsp:include page="ser_navi.jsp" />
		<div id="mainview">
		<div id="floor"><span id="floor1">1열람실</span>&nbsp;&nbsp;&nbsp;<span id="floor2">2열람실</span>&nbsp;&nbsp;&nbsp;<span id="floor3">3열람실</span></div>
		<div id="location">
		<div id="location1">
		<div id="location1_1">
		<ul class="yul">
				<c:forEach var="k" items="${yulvo }" begin="0" end="9">
						<c:if test="${k.y_state=='1' }">
							<li class="no">${k.y_num }</li>
						</c:if>
						<c:if test="${k.y_state=='0' }">
							<li class="ok">${k.y_num }</li>
						</c:if>
				</c:forEach>
			</ul>
			</div>
			<div id="location1_2">
				<ul class="yul">
				<c:forEach var="k" items="${yulvo }" begin="10" end="19">
						<c:if test="${k.y_state=='1' }">
							<li class="no">${k.y_num }</li>
						</c:if>
						<c:if test="${k.y_state=='0' }">
							<li class="ok">${k.y_num }</li>
						</c:if>
				</c:forEach>
			</ul>
			</div>
				<div id="location1_3">
				<ul class="yul">
				<li style="width: 45px"><ul class="yul2">
				<c:forEach var="k" items="${yulvo }" begin="20" end="24">
						<c:if test="${k.y_state=='1' }">
							<li class="no">${k.y_num }</li>
						</c:if>
						<c:if test="${k.y_state=='0' }">
							<li class="ok">${k.y_num }</li>
						</c:if>
				</c:forEach>
				</ul></li>
				<li><ul class="yul2">
				<c:forEach var="k" items="${yulvo }" begin="25" end="29">
						<c:if test="${k.y_state=='1' }">
							<li class="no">${k.y_num }</li>
						</c:if>
						<c:if test="${k.y_state=='0' }">
							<li class="ok">${k.y_num }</li>
						</c:if>
				</c:forEach>
				</ul></li>
			</ul>
			</div>
				<div id="location1_4">
				<ul class="yul">
				<li style="width: 45px"><ul class="yul2">
				<c:forEach var="k" items="${yulvo }" begin="30" end="34">
						<c:if test="${k.y_state=='1' }">
							<li class="no">${k.y_num }</li>
						</c:if>
						<c:if test="${k.y_state=='0' }">
							<li class="ok">${k.y_num }</li>
						</c:if>
				</c:forEach>
				</ul></li>
				<li><ul class="yul2">
				<c:forEach var="k" items="${yulvo }" begin="35" end="39">
						<c:if test="${k.y_state=='1' }">
							<li class="no">${k.y_num }</li>
						</c:if>
						<c:if test="${k.y_state=='0' }">
							<li class="ok">${k.y_num }</li>
						</c:if>
				</c:forEach>
				</ul></li>
			</ul>
			</div>
				<div id="location1_5">
				<ul class="yul">
				<li style="width: 45px"><ul class="yul2">
				<c:forEach var="k" items="${yulvo }" begin="40" end="44">
						<c:if test="${k.y_state=='1' }">
							<li class="no">${k.y_num }</li>
						</c:if>
						<c:if test="${k.y_state=='0' }">
							<li class="ok">${k.y_num }</li>
						</c:if>
				</c:forEach>
				</ul></li>
				
			</ul>
			</div>
		</div>
		<div id="location2">
		<div id="location1_1">
		<ul class="yul">
				<c:forEach var="k" items="${yulvo }" begin="45" end="54">
						<c:if test="${k.y_state=='1' }">
							<li class="no">${k.y_num }</li>
						</c:if>
						<c:if test="${k.y_state=='0' }">
							<li class="ok">${k.y_num }</li>
						</c:if>
				</c:forEach>
			</ul>
			</div>
			<div id="location1_2">
				<ul class="yul">
				<c:forEach var="k" items="${yulvo }" begin="55" end="64">
						<c:if test="${k.y_state=='1' }">
							<li class="no">${k.y_num }</li>
						</c:if>
						<c:if test="${k.y_state=='0' }">
							<li class="ok">${k.y_num }</li>
						</c:if>
				</c:forEach>
			</ul>
			</div>
				<div id="location1_3">
				<ul class="yul">
				<li style="width: 45px"><ul class="yul2">
				<c:forEach var="k" items="${yulvo }" begin="65" end="70">
						<c:if test="${k.y_state=='1' }">
							<li class="no">${k.y_num }</li>
						</c:if>
						<c:if test="${k.y_state=='0' }">
							<li class="ok">${k.y_num }</li>
						</c:if>
				</c:forEach>
				</ul></li>
				<li><ul class="yul2">
				<c:forEach var="k" items="${yulvo }" begin="71" end="76">
						<c:if test="${k.y_state=='1' }">
							<li class="no">${k.y_num }</li>
						</c:if>
						<c:if test="${k.y_state=='0' }">
							<li class="ok">${k.y_num }</li>
						</c:if>
				</c:forEach>
				</ul></li>
			</ul>
			</div>
				<div id="location1_4">
				<ul class="yul">
				<li style="width: 45px"><ul class="yul2">
				<c:forEach var="k" items="${yulvo }" begin="77" end="82">
						<c:if test="${k.y_state=='1' }">
							<li class="no">${k.y_num }</li>
						</c:if>
						<c:if test="${k.y_state=='0' }">
							<li class="ok">${k.y_num }</li>
						</c:if>
				</c:forEach>
				</ul></li>
				<li><ul class="yul2">
				<c:forEach var="k" items="${yulvo }" begin="83" end="88">
						<c:if test="${k.y_state=='1' }">
							<li class="no">${k.y_num }</li>
						</c:if>
						<c:if test="${k.y_state=='0' }">
							<li class="ok">${k.y_num }</li>
						</c:if>
				</c:forEach>
				</ul></li>
			</ul>
			</div>
				<div id="location2_5">
				<ul class="yul">
				<li style="width: 45px"><ul class="yul2">
				<c:forEach var="k" items="${yulvo }" begin="89" end="96">
						<c:if test="${k.y_state=='1' }">
							<li class="no">${k.y_num }</li>
						</c:if>
						<c:if test="${k.y_state=='0' }">
							<li class="ok">${k.y_num }</li>
						</c:if>
				</c:forEach>
				</ul></li>
				<li><ul class="yul2">
				<c:forEach var="k" items="${yulvo }" begin="97" end="104">
						<c:if test="${k.y_state=='1' }">
							<li class="no">${k.y_num }</li>
						</c:if>
						<c:if test="${k.y_state=='0' }">
							<li class="ok">${k.y_num }</li>
						</c:if>
				</c:forEach>
				</ul></li>
			</ul>
			</div>
		</div>
		<div id="location3">
		<div id="location1_1">
		<ul class="yul">
				<c:forEach var="k" items="${yulvo }" begin="105" end="114">
						<c:if test="${k.y_state=='1' }">
							<li class="no">${k.y_num }</li>
						</c:if>
						<c:if test="${k.y_state=='0' }">
							<li class="ok">${k.y_num }</li>
						</c:if>
				</c:forEach>
			</ul>
			</div>
			<div id="location1_2">
				<ul class="yul">
				<c:forEach var="k" items="${yulvo }" begin="115" end="124">
						<c:if test="${k.y_state=='1' }">
							<li class="no">${k.y_num }</li>
						</c:if>
						<c:if test="${k.y_state=='0' }">
							<li class="ok">${k.y_num }</li>
						</c:if>
				</c:forEach>
			</ul>
			</div>
				<div id="location1_3">
				<ul class="yul">
				<li style="width: 45px"><ul class="yul2">
				<c:forEach var="k" items="${yulvo }" begin="125" end="129">
						<c:if test="${k.y_state=='1' }">
							<li class="no">${k.y_num }</li>
						</c:if>
						<c:if test="${k.y_state=='0' }">
							<li class="ok">${k.y_num }</li>
						</c:if>
				</c:forEach>
				</ul></li>
				<li><ul class="yul2">
				<c:forEach var="k" items="${yulvo }" begin="130" end="134">
						<c:if test="${k.y_state=='1' }">
							<li class="no">${k.y_num }</li>
						</c:if>
						<c:if test="${k.y_state=='0' }">
							<li class="ok">${k.y_num }</li>
						</c:if>
				</c:forEach>
				</ul></li>
			</ul>
			</div>
				<div id="location1_4">
				<ul class="yul">
				<li style="width: 45px"><ul class="yul2">
				<c:forEach var="k" items="${yulvo }" begin="135" end="139">
						<c:if test="${k.y_state=='1' }">
							<li class="no">${k.y_num }</li>
						</c:if>
						<c:if test="${k.y_state=='0' }">
							<li class="ok">${k.y_num }</li>
						</c:if>
				</c:forEach>
				</ul></li>
				<li><ul class="yul2">
				<c:forEach var="k" items="${yulvo }" begin="140" end="144">
						<c:if test="${k.y_state=='1' }">
							<li class="no">${k.y_num }</li>
						</c:if>
						<c:if test="${k.y_state=='0' }">
							<li class="ok">${k.y_num }</li>
						</c:if>
				</c:forEach>
				</ul></li>
			</ul>
			</div>
				<div id="location1_5">
				<ul class="yul">
				<li style="width: 45px"><ul class="yul2">
				<c:forEach var="k" items="${yulvo }" begin="145" end="149">
						<c:if test="${k.y_state=='1' }">
							<li class="no">${k.y_num }</li>
						</c:if>
						<c:if test="${k.y_state=='0' }">
							<li class="ok">${k.y_num }</li>
						</c:if>
				</c:forEach>
				</ul></li>
				<li><ul class="yul2">
				<c:forEach var="k" items="${yulvo }" begin="150" end="154">
						<c:if test="${k.y_state=='1' }">
							<li class="no">${k.y_num }</li>
						</c:if>
						<c:if test="${k.y_state=='0' }">
							<li class="ok">${k.y_num }</li>
						</c:if>
				</c:forEach>
				</ul></li>
			</ul>
			</div>
		</div>
		</div>
	</div>
	</div>
</body>
</html>