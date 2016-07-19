<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
.info{
	border:1px solid #dedede;
	display:block;
	width:500px;
	height:700px;
}
</style>
</head>
<body>
	<h2>스터디룸 이용 안내</h2>
	<div class="info">
		<p>4일전부터 예약가능</p>
		<p>예약시간으로부터 30분까지 스터디 참여인원 모두 3층 레퍼런스 데스크에서 최소 인원 이상 확인 후 승인을 받아야 합니다.<br>
		(단, 토요일은 승인절차 없음)</p>
		<p>문의: 02-760-1193</p>
		<p>예약시간으로부터 30분이 경과하도록 이용하지 않으면 예약부도처리가 되어 사용이 불가합니다.</p>
		<p>보드마커, 지우개 등은 사용자가 미리 준비해야 하며, 모든 스터디룸에 PC가 설치되어 있으니 참고바랍니다.</p>
		<p>사용 후 다음 이용자를 위해 자리를 정리해 주시기 바랍니다.(전원 및 냉방 소등, 화이트보드, 책상 정리)</p>
		<p>스터디룸에는 생수이외의 음식물은 반입이 안됩니다.</p>
		<p>스터디룸	이용시에도 꼭 지켜주시기 바랍니다.</p>
		<p>RF 신분증으로 출입게이트를 통해 입실하여야 하고 RF 신분증으로 스터디룸이 개실되니 반드시 RF 신분증을 꼭 지참하기 바랍니다.</p>
		<p>스터디룸 사용중에는 다른 좌석 배정이 불가하며, 사용 도중 반납은 이용자 전원을 대표예약자가 3층 레퍼런스데스크에서 반납처리하여야 합니다.</p>
		<p>기타 문의사항은 각 층별 데스크에서 문의 바랍니다.</p>
	</div>
	<form>
		<input type="button" value="예약하러가기&nbsp;&gt;" onclick="location.href='/HbLib/Controller?type=getRoom'">
	</form>
</body>
</html>