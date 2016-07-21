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
	width: 535px;
	display: block;
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
.room:HOVER,
.selectedRoom,
.selectedTime
{
	background:#7383BF;
	color:#fff;
}
.room p{
	display:table-cell;
	vertical-align: middle;
	text-align: center;
	color:#fff;
}

.header{
	border-bottom:1px solid #898989;
	height:30px;
	margin-bottom: 10px;
    font-size: 16px;
    color: #898989;
    font-weight: 300;
    margin-top:29px;
}

.header span{
	font-size: 24px;
    color: #FF7F66;
    font-weight: 500;
    margin-right: 8px;
}

#section > .header{
	border:0;
	color:#000;
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
padding-left: 0;
display:block;
height:45px;
}
#timeArea li{
border:1px solid #898989;
display:inline-table;
float:left;
margin:0;
width:47px;
border-left:0;
height:100%;
vertical-align: middle;
text-align:center;
}
#timeArea li:FIRST-CHILD{
border-left:1px solid #898989;
}
#timeArea li span{
display:table-cell;
vertical-align: middle;
}
#timeArea .can{
cursor:pointer;
}
#timeArea .can:HOVER{
font-weight:bold;
}
#timeArea .cant{
cursor:default;
background:#dedede;
color:#545454;
}
#btnArea{
width:960px;
height:100px;
display: block;
position: absolute;
margin:50px 0;
}
#btnArea #subBtn{
background:#FF7F66;
border:0;
width: 164px;
height: 42px;
color:#fff;
display: block;
position:relative;
left:373px;

}
#btnArea #subBtn:HOVER {
	background:#ffbeb0;
	cursor:pointer;
}

</style>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script>
$(function() {
	if($("input[name=rDate]").val()==""){
		console.log("rDate is empty");
		var str = $('input[name=year]').val()+"/"+$('input[name=month]').val()+"/"+$("#today").text();
		console.log(str);
		$("input[name=rDate]").val(str);
	}
	

	$(document).on('click',".cant",function(){
			alert("해당 시간대는 예약 할 수 없습니다.");
	});
	$(document).on('click',".can",function(){
		
		var t = $(this).text();

		var a =$(this).text().split(":")[0];
		
		if($(this).attr("class")=="selectedTime"){
			$(this).removeClass();
		}else {
			
			switch($(".selectedTime").length){
				case 0: 
					$(this).addClass("selectedTime");
						$("input[name=start]").val(t);
						$("input[name=end]").val(a+":59");
						$("#info_time").show();
						$("input[name=tot]").val("1");
						break;
				case 1:
					var b =$(".selectedTime").text().split(":")[0];
					console.log(a+"/"+b);
					if((a-1)==b){
						$(this).addClass("selectedTime");
						$("input[name=end]").val(a+":59");
						$("input[name=tot]").val("2");
					}else{
						$(".selectedTime").removeClass("selectedTime");
						$(this).addClass("selectedTime");
						$("input[name=start]").val($(this).text());
						$("input[name=end]").val(a+":59");
					}
					break;
				default:
					$(".selectedTime").removeClass("selectedTime");
					$("#info_time").hide();
			}
		}
	});
	$(".room").click(function(){
		$(".selectedRoom").removeClass("selectedRoom");
		$(this).addClass("selectedRoom");
		var rnum = $(this).find("input[type=hidden]").val();
		console.log(rnum);
		$("#info_room").show();
		$("#time").show();
		$("input[name=roomNum]").val(rnum);
		$("input[name=start]").val(null);
		$("input[name=end]").val(null);
		$("#info_time").hide();
		var date = $("input[name=rDate]").val();
		$.ajax({
			url:'/HbLib/AjaxController?type=getRoom&date='+date+'&r_num='+rnum,
			type:'get',
			dataType:'json',
			success:function(data){
				 var table = "<tbody>" ;
				 $.each(data,function(key,data){
					table += "<tr>";
					table +="<td>"+data.sr_idx+"</td>";
					table +="<td>"+data.s_num +"</td>";
					table +="<td class='startTime'>"+data.start_time +"</td>";
					table +="<td class='endTime'>"+data.end_time +"</td>";
					table +="<td>"+data.id +"</td>";
					table += "</tr>";
				 });
				 table +="</tbody>";
				 $("#tmp").html(table); 
				$("#tmp tbody").hide();
				time();
			},error:function(request,status,error){
		        console.log("error");
			}
		})
		
	});
	
});
function time(){
console.log("time is started");
var times = ["9:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00"];
var result="<ul>";
for(var i=0;i<times.length;i++){
	var cls="can";
	$("#timeArea").empty();
	$("#tmp").find("tbody .startTime").each(function(){
			if($(this).text()==times[i]){
				cls = "cant";
			}else{
				if(cls!="cant"){
					cls="can";
				}
			}
		});
	
	$("#tmp").find("tbody .endTime").each(function(){
		console.log("endTime");
			var h = $(this).text().split(":");
			var str = h[0]+":00";
			
			if(str==times[i]){
				cls = "cant";
			}else{
				if(cls!="cant"){
					cls="can";
				}
			}
		});
	
	console.log(times[i]+"/"+cls);
	result+="<li class='"+cls+"'><span>"+times[i]+"</span></li>";
}
result+="</ul>";
$("#timeArea").html(result);
}

</script>
</head>
<body>
<form action="/HbLib/Controller?type=roomReserve" method="post">
	<div id="section">
		<div class="header">
			<h3>스터디룸 예약하기</h3>
		</div>
		<div id="date">
			<h4 class="header"><span>01</span>날짜선택</h4>
			<div id="calArea"><%@ include file="calendar.jsp"%></div>

		</div>
		<div id="studyR">
			<h4 class="header"><span>02</span>스터디룸 선택</h4>
			<div id="srArea">
					<%@ include file="studyroom.jsp" %>
			</div>
		</div>
		<div id="time" style="display:none;">
			<h4 class="header"><span>03</span>시간 선택</h4>
			
			<div id="tmp">
			</div>
			<div id="timeArea">
			</div>

		</div>
		<div id="reserveInfo">
			<h4 class="header"><span>04</span>예약 정보 확인</h4>
			<p>
				<span>ID : </span><input type="text" name="id" value="<%=id %>" readonly="readonly">
			</p>
			<p>
				<span>이름 : </span><input type="text" name="name" value="" readonly="readonly">
			</p>
			<p>
				<span>날짜 : </span><input type="text" name="rDate" value="" readonly="readonly">
			</p>
			<p id="info_room" style="display:none">
				<span>스터디룸 : </span><input type="text" name="roomNum" value="" readonly="readonly" size="5"> 호
			</p>
			<p id="info_time" style="display:none">
				<span>이용시간 : </span>
				<input type="text" name="start" size="5" readonly="readonly">부터 <input type="text" name="end" size="5" readonly="readonly">까지
				총 <input type="text" name="tot" size="2" readonly="readonly"> 시간
			</p>
		</div>
		<div id="btnArea">
			<input type="submit" value="예약하기&nbsp;&nbsp;&gt;" id="subBtn">
		</div>
	</div>
</form>
</body>
</html>