<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<title>Insert title here</title>
<style type="text/css">
#result{
display:block;
margin:0 auto;
}
table{
width:490px;
height:350px;
border-collapse: 0;
border-spacing: 0;
border-top:3px solid #052efc;
margin:0 auto;
}
th{
border-bottom:1px solid #dedede;
color:#545454;
font-weight:normal;
}
td{
border-bottom:1px solid #dedede;
font-weight:500;
}

input[type=button]{
background:#052efc;
color:#fff;
width:200px;
height:50px;
border:0;
margin:0 auto;
position:absolute;
right:300px;
bottom:50px;
}

input[type=button]:hover{
cursor:pointer;
background:#8b9eff;
}
</style>
</head>
<body>
<div class="wrap">
<h2>스터디룸 예약 결과</h2>
<div id="result">
<input type="hidden" value="${result.start_time}" id="start">
<input type="hidden" value="${result.end_time}" id="end">
<script>
	$(function(){
		var start = $("#start").val().split(":")[0];
		var end = $("#end").val().split(":")[0];
		if(start-end==0){
			$("#time").text("1");
		}else{
			$("#time").text("2");
		}
		console.log(start+"/"+end)
		
		
	});
</script>
 <table>
  <tr>
   <th>예약번호</th><td>${result.sr_idx}</td>
  </tr>
  <tr>
   <th>아이디</th><td>${result.id}</td>
  </tr>
  <tr>
   <th>날짜</th><td>${result.sr_date}</td>
  </tr>
  <tr>
  
   <th>이용시간</th><td>${result.start_time}~${result.end_time}, <span id="time"></span>시간</td>
  </tr>
  <tr>
   <th>스터디룸</th><td>${result.s_num}호</td>
  </tr>
  <tr>
   <th>위치</th><td>3층</td>
  </tr>
 </table>
</div> 
 <a href="#"><input type="button" value="메인으로 이동&nbsp;&gt;"></a>
</div>
</body>
</html> 
