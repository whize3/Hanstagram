<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/HbLib/css/mylibrary.css">
<link rel="stylesheet" href="/HbLib/css/sub2.css">
<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_02").css("background-color", "gray")
	});
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="mainArea">
		<div class="mainArea2">
			<jsp:include page="guide_navi.jsp" />
			<div id="mainview">
					<div class="subContent">
                        	<h2 class="tit"><img src="/HbLib/img/pageTitD02.gif" alt="도서관실별안내"></h2>
    <div class="libInfo0402">
        <h3 class="tit">전공자료실(1층)</h3>
        <p class="subParaType01 bBorderType01">교육·학술관련 자료들을 체계적으로 배열, 보관하여 이용자들이 효과적이고 능률적으로 이용하도록 봉사하는 곳으로 우리 대학 구성원이라면 누구든지 자유롭게 자료를 이용할 수 있습니다. 전공자료실에서는 대학생활에 필요한 학습 활동과 연구 활동을 위한 각종 도서가 소장되어 있어 우리대학 구성원의 지식의 보고로 확고히 자리매김하고 있습니다. <span class="strongType02">(전화 : 042-670-9093)</span></p>
        <h3 class="tit">사서실(2층)</h3>
        <p class="subParaType01">사서실에서는 교수 및 학생들의 다양한 정보니즈를 충족시키기 위하여 도서관 자료를 선정하고, 구입, 기증 교환 및 기타 방법에 의해 자료를 수집하고 등록하며 제적하는 등의 수서 업무와 도서관 자료를 분류, DB구축, 장비 작업을 거쳐 열람부서로 인계하기까지의 일련의 작업과정을 담당하고 있습니다. 그리고 도서관 전산화에 필요한 제반 업무를 담당하고 있으며, 전반적인 행정을 총괄하고 관리합니다. <span class="strongType02">(전화 : 042-670-9091)</span></p>
        <h3 class="tit">전자정보실(2층)</h3>
		<p class="subParaType01">비도서 자료인 DVD, CD-ROM, Video Tape, Audio Tape, Slide 교구 등을 소장하고 있는 자료실로서 전공관련자료, 어학자료, 교양자료들로 구성되어 있습니다. 자료의 특성상 관외 대출은 하고 있지 않으며, 자료실내에서 이용할 수 있도록 PC, 비디오비젼, 카세트 플레이어 등의 기자재를 설치하여 운영하고 있습니다.<span class="strongType02">(전화 : 042-670-9094)</span></p>
        <h3 class="tit">그룹스터디실(2층)</h3>
        <p class="subParaType01 bBorderType01">다수 인원이 공동으로 학습·연구할 수 있도록 빔프로젝트 등 멀티미디어 기기가 구비되어 있습니다.  최소 4인에서 15인까지 1일 2시간 이용할 수 있으며, 전자정보실에 비치된 예약 신청서를 작성 후 담당자의 승인을 받아 사용할 수 있습니다. <span class="strongType02">(전화 : 042-670-9094)</span></p>
        <h3 class="tit">교양자료실(3층)</h3>
        <p class="subParaType01 bBorderType01">문학, 예술관련 도서들을 개가식으로 운영하고 있으며 국내외 학술지 및 교양지, 일간지 등의 자료를 편안한 환경에서 열람할 수 있습니다. 교양자료실에서는 다양한 자료와 컨텐츠 및 참고서비스를 제공함으로써 우리 대학 구성원들의 문화 활동과 소통의 기반을 마련하고 있습니다. <span class="strongType02">(전화 : 042-670-9092)</span></p>
        <h3 class="tit">자유열람실(4, 5층)</h3>
        <p class="subParaType01 bBorderType01">자유롭게 자기학습을 할 수 있는 곳으로 본교의 교직원이나 학생이면 누구나 이용할 수 있는 곳으로 자리배석시스템을 설치·운영하고 있습니다.</p>
        <h3 class="tit">휴게실(2층)</h3>
        <p class="subParaType01">도서관 2층에 위치하고 있으며 자판기 및 소파 등 각종 휴게시설뿐만 아니라 노트북테이블 또한 구비되어 있어 학습과 휴게 모두 가능한 복합 멀티 공간으로서의 역할을 수행하고 있습니다. </p>
	</div>                            </div>
			</div>
		</div>

	</div>
</body>
</html>