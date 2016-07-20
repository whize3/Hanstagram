<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>
#Container {
	height: 900px;
	display: block;
	position: relative;
	top: 180px;
	padding: 0px;
	width: 960px;
	margin-left: auto;
	margin-right: auto;
}

#section {
	height: 228px;
	position: relative;
	top: 74px;
	padding: 0px;
	display: block;
	width: 960px;
	margin-left: auto;
	margin-right: auto;
}

#section h1 {
	font-size: 20px;
	margin-bottom: 30px;
}

#section p {
	width: 660px;
	display: inline-block;
	font-size: 15px;
	margin-top: 5px;
}

#section #pageImg {
	display: inline-block;
	position: absolute;
	right: 33px;
	top: -23px;
	width: 235px;
	height: *;
}

h2 {
	font-size: 18px;
	font-weight: 500;
	color: #545454;
	margin-bottom: 40px;
}

.step {
	margin-bottom: 35px;
}

.step span {
	font-size: 14px;
}

.step p {
	margin-bottom: 10px;
	font-size: 16px;
	color: #898989;
	font-weight: 300;
}

.step p span {
	font-size: 24px;
	color: #FF7F66;
	font-weight: 500;
	margin-right: 8px;
}

.con {
	display: block;
	padding-left: 35px;
	margin-bottom: 5px;
}

.step b {
	font-weight: 500;
	color: #0c2fe3;
}

button {
	position: absolute;
	border: 0;
	background: #3d5ac0;
	width: 190px;
	height: 38px;
	color: #fff;
	cursor:pointer;
}

button#bottom {
	bottom: 250px;
	right: 50px;
}

button#top {
	bottom: -4px;
	left: 0px;
}

button:hover {
	background: #8e9be3;
}
</style>
</head>
<body>
	<div id=section>
		<h1>스터디룸 이용 안내</h1>
		<p>한빛 도서관 스터디룸 예약을 도와드립니다.</p><!-- 
		<p>친구들에게 어떻게 도움을 줘야할지 모르겠는 당신을 위해</p>
		<p>후원스타터가 기다리고 있습니다.</p> -->
		<img src="./img/cm120.png" id=pageImg> 
		<a href="/HbLib/Controller?type=getRoom">
			<button id="top">스터디룸 예약 진행하기&nbsp;&nbsp;&gt;</button>
		</a>
	</div>

	<div id=Container>
		<h2>한빛 도서관 스터디룸 이용하는 방법</h2>
		<div class=step>
			<p>
				<span>01</span>이용 날짜 선택
			</p>
			<span class=con>한빛도서관의 스터디룸을 이용할 날짜를 선택해주세요!</span>
		</div>

		<div class=step>
			<p>
				<span>02</span>예약할 스터디룸 선택
			</p>
			<span class=con>이용을 희망하는 스터디룸을 선택해주세요!</span> 
		</div>

		<div class=step>
			<p>
				<span>03</span>이용 시간 체크
			</p>
			<span class=con>스터디룸을 사용할 시간을 체크해주세요!</span>
			<span class=con>스터디룸 예약 가능시간은 <b>최대 2시간</b>입니다.</span>
			<span class=con>예약시간 20분이 경과하도록 이용하지 않으면 <b>예약이 취소</b>됩니다.
			</span>
		</div>

		<div class=step>
			<p>
				<span>04</span>예약 정보 확인
			</p>
			<span class=con>예약 정보가 올바르게 기입되었다면 버튼을 눌러 예약을 접수해주세요!</span>
		</div>

		<div class=step>
			<p>
				<span>05</span>담당자 승인 후 사용
			</p>
			<span class=con>회원님의 예약정보를 담당자가 실시간으로 승인한 후 사용 가능합니다!</span>
			<span class=con>3층 레퍼런스 데스크에서 최소인원 확인 후 이용 가능합니다!</span>
		</div>
		<a href="/HbLib/Controller?type=getRoom">
			<button id=bottom>스터디룸 예약 진행하기&nbsp;&nbsp;&gt;</button>
		</a>
	</div>
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>



<!-- <style type="text/css">
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
		<input type="button" value="예약하러가기&nbsp;&gt;" onclick="location.href='/library/Controller?type=getRoom'">
	</form>
</body>
</html> -->
