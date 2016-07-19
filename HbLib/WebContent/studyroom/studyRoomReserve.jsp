<%@page import="com.hb.mybatis.Studyroom_ReserveVO"%>
<%@page import="com.hb.mybatis.StudyroomVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
#section {
	width: 700px;
	display: block;
	border: 1px solid #000;
	margin: 0 auto;
}

/* 층 구분 탭 */
#tabArea {
	width: 500px;
	height: 40px;
	border: 1px solid #dedede;
	background: #fff;
	display: block;
	margin: 0;
	padding: 0;
	margin-bottom: 50px;
}

#tabArea a {
	display: inline-table;
	vertical-align: middle;
}

#tabArea li {
	width: 99px;
	height: 100%;
	display: inline-block;
	border-right: 1px solid #dedede;
	margin: 0;
	position: relative;
	left: 0px;
	top: 0px;
	text-align: center;
}

#tabArea li:LAST-CHILD {
	border-right: none;
}

#tabArea li:hover {
	border: 0;
	background: #3cbf80;
}
/* 스터디룸영역 */
#srArea {
	width: 100%;
	height: 300px;
	padding-left:20px;
}

.room {
	display: inline-table;
	width: 100px;
	height: 70px;
	/*  border: 1px solid #545454;  */
	border:0;
	cursor:pointer;
	background:#B2CCFF;
}
.room:HOVER{
	background:#7383BF;
}
.room p{
	display:table-cell;
	vertical-align: middle;
	text-align: center;
	color:#fff;
}

.header{
	border-bottom:2px solid #000;
	height:30px;
}
#calArea {
	width: 100%;
	display: block;
}

.tmp {
	background: #7383bf;
}

.click {
	background: #7383bf;
}

/* 정보영역 */
input{
border:0;
}

/* 시간영역 */
#timeArea{
width:100%;
height:60px;
margin-bottom:30px;
}
#timeArea ul{
display:block;
height:45px
}
#timeArea li{
border:1px solid #000;
display:inline-table;
float:left;
margin:0;
width:57px;
border-left:0;
height:100%;
vertical-align: middle;
text-align:center;
}
#timeArea li:FIRST-CHILD{
border-left:1px solid #000;
}
#timeArea li span{
display:table-cell;
vertical-align: middle;
}
</style>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script>
	$(function() {
		$(".room").click(function(){
			var rnum = $(this).find("input[type=hidden]").val();
			console.log(rnum);
			$("#info_room").show();
			$("input[name=roomNum]").val(rnum);
			var date = $("input[name=rDate]").val();
			$.ajax({
				url:'/HbLib/AjaxController?type=getRoom&date='+date,
				type:'get',
				dataType:'json',
				success:function(data){
					alert("성공");
					 var table = "<tbody>" ;
					 $.each(data,function(key,data){
						table += "<tr>";
						table +="<td>"+data.sr_idx+"</td>";
						table +="<td>"+data.s_num +"</td>";
						table +="<td>"+data.start_time +"</td>";
						table +="<td>"+data.end_time +"</td>";
						table +="<td>"+data.id +"</td>";
						table += "</tr>";
					 });
					 table +="</tbody>";
					 $("#timeArea").html(table);
					
				},error:function(request,status,error){
			        console.log("error");
				}
			})
			
		});
	});

</script>
</head>
<body>
<form action="/HbLib/Controller?type=roomReserve" method="post">
	<div id="section">
		<div class="header">
			<h3>스터디룸 예약하기</h3>
		</div>
		<div id="date">
			<h4 class="header">날짜선택</h4>
			<div id="calArea"><%@ include file="calendar.jsp"%></div>

		</div>
		<h4 class="header">스터디룸 선택</h4>
		<div id="srArea">
				<%@ include file="studyroom.jsp" %>
		</div>
		<div id="time">
			<h4 class="header">시간 선택</h4>
			<div id="timeArea">
			
			<%
			String[] times = {"9:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00"};
			List<Studyroom_ReserveVO> time = (List)request.getAttribute("time");
			if(time!=null){
				System.out.println("room size : "+time.size());

				for(int i=0;i<times.length;i++){
					String this_time = times[i];
					for(Studyroom_ReserveVO vo:time){

						vo.getStart_time();
					}
				}
			}
			%>
			
			</div>

		</div>
		<div id="reserveInfo">
			<h4 class="header">예약 정보 확인</h4>
			<p>
				<input type="text" name="id" value="soojy6126" readonly="readonly">
			</p>
			<p>
				<input type="text" name="name" value="이수현" readonly="readonly">
			</p>
			<p>
				<input type="text" name="rDate" value="" readonly="readonly">
			</p>
			<p id="info_room" style="display:none">
				<input type="text" name="roomNum" value="" readonly="readonly" size="5"> 호
			</p>
			<p>
				<input type="text" name="start" value="9:00" size="5" readonly="readonly"> - <input type="text" name="end" size="5" value="11:00" readonly="readonly">
			</p>
		</div>
		<input type="submit" value="예약하기">
	</div>
</form>
</body>
</html>