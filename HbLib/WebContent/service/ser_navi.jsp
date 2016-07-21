<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<div id="mainnavi">
				<ul class="navileft">
					<li id="navi_01"><a href="">스터디룸 안내</a></li>
					<li id="navi_02"><a href="">스터디룸 예약신청</a></li>
					<li id="navi_03"><a href="/HbLib/service/ser_apply.jsp">도서구입신청</a></li>
					<li id="navi_04"><a href="/HbLib/Controller?type=applylist&id=${user.id}">도서구입신청 현황</a></li>
					<li id="navi_05"><a href="/HbLib/Controller?type=yul">열람실 현황</a></li>
				</ul>
			</div>
</body>
</html>