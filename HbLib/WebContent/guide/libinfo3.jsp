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
		$("#navi_03").css("background-color", "gray")
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
                                <h2 class="tit"><img src="/HbLib/img/pageTitD03.gif" alt="대출/반납안내"></h2>
        <h3 class="tit">대출책수 및 기간</h3>
        <table cellpadding="0" cellspacing="0" border="0" class="tableType01">
            <colgroup>
                <col>
                <col>
                <col style="width:20%;">
                <col style="width:30%;">
            </colgroup>
            <tbody><tr>
            	<th class="first-child focusCell">신분</th>
                <th>대출책수</th>
                <th>대출기간</th>
                <th class="last-child">대출기간연장</th>
            </tr>
            <tr>
            	<td class="first-child focusCell"><strong>학생</strong></td>
                <td>5책</td>
                <td>7일</td>
                <td class="last-child">2회 7일</td>
            </tr>
           <tr>
            	<td class="first-child focusCell"><strong>교직원</strong></td>
                <td>6책</td>
                <td>30일</td>
                <td class="last-child">2회 30일</td>
            </tr>
            <tr>
                <td class="first-child focusCell lastLine"><strong>외강</strong></td>
                <td class="lastLine">5책</td>
                <td class="lastLine">10일</td>
                <td class="last-child lastLine">2회 10일</td>
            </tr>
        </tbody></table>
        <ul class="listSubType01 mgt15">
            <li>단, 대출기간 만료일이 공휴일인 때는 그 기일을 다음날까지로 한다.</li>
        </ul>
        <h3 class="tit">대출</h3>
        <p class="subParaType01">모든 자료는 개가제로 운영되므로 이용자가 원하는 자료를 직접 찾아 학생증과 같이 대출대에 신청하면 대출이 가능합니다. 단 도서대출은 본인이 직접 신청하여야 합니다.</p>
        <h3 class="tit">대출기간 연장</h3>
        <p class="subParaType01">대출기간을 연장하고자 할 때에는 학생증을 대출창구에 제시하면, 예약이 없을 경우 2회에 한하여 기간을 연장 받을 수 있습니다. 단, 연장기간은 연장 신청한 날로부터 대출 기간 동안입니다. <span class="strongType01">(홈페이지에서 연장가능)</span></p>
        <h3 class="tit">대출예약</h3>
        <p class="subParaType01">원하는 도서가 이미 대출되었을 경우 대출창구에 예약신청을 하거나 이용자 검색시스템을 통해 직접 예약 하실 수 있습니다. 목록검색시스템에서 검색한 자료가 대출중인 경우 책 등록번호 옆의 예약 아이콘을 클릭하여 예약합니다. 예약신청이 되면 그 책이 반납되는 즉시 다른 이용자에 우선하여 대출할 수 있습니다. 단, 예치기간은 2일간입니다.</p>
        <h3 class="tit">반납</h3>
        <p class="subParaType01">대출한 책은 정한 기간내에 반납창구에 반납하여야 합니다. 대출자료의 반납 기한이 지나도록 자료를 반납하지 않은 경우 성적증명서, 졸업예정증명서 등 제증명서 발급이 중단되며, 연체한 기간×권수만큼 대출이 중지됩니다. 또한, 자유열람실(4층,5층)를 이용할 수 없습니다.</p>
        <h3 class="tit">도서분실</h3>
        <p class="subParaType01">책을 분실하였을 경우 반드시 사서에게 알려야 하며 분실신고를 한 후 책을 찾지 못했을 경우는 동일도서로 변상을 해야 합니다. 만일 동일도서를 구할 수 없을 때에는 금액 변상하거나 도서관장의 허가를 얻은 유사도서로 변상할 수 있습니다.</p>
        <h3 class="tit">도서 무단반출 및 절취</h3>
        <p class="subParaType01">전공자료실 및 교양자료실의 자료를 무단 반출하거나 절취하는 자는 6개월간 대출이 중지되며 그 명단이 게시판에 공개됩니다. 자료를 훼손한 경우는 동일도서로 변상하여야 합니다.</p>
        <h3 class="tit">기타 궁금하신 점은 담당사서에게 문의해주세요.</h3>
        <p class="subParaType01">전공자료실(Tel) : <strong> 042-670-9093</strong></p>                    </div>
			</div>
		</div>

	</div>
</body>
</html>