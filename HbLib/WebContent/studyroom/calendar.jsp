<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%


	request.setCharacterEncoding("utf-8");
	
	/* 현재 날짜 받아오기 */
	Calendar now = Calendar.getInstance();
	int year = now.get(Calendar.YEAR);
	int month = now.get(Calendar.MONTH)+1;
	int date = now.get(Calendar.DATE);
	
	/* 달력을 넘겼을 경우 */
	String u_year = request.getParameter("year");
	String u_month = request.getParameter("month");
	System.out.println("u_month="+u_month);
	
	int i_year=0;
	int i_month=0;
	if(u_year != null){
		System.out.println("user's data is not null! "+u_month+"/"+u_year);
		i_year = Integer.parseInt(u_year);
		i_month = Integer.parseInt(u_month);
	}else{
		i_year = year;
		i_month = month;
		System.out.println(i_month);
	}
		//출력할 년도, 월로 설정
		System.out.println("출력할 년월은 : "+i_year+"/"+i_month);
		now.set(i_year, i_month-1, 1);
	
	/* year = now.get(Calendar.YEAR);//변화된 년, 월
	month = now.get(Calendar.MONTH) + 1;
	 */
	 
	int end = now.getActualMaximum(Calendar.DAY_OF_MONTH);//해당월의 마지막 날짜
	int w = now.get(Calendar.DAY_OF_WEEK);//1~7(일~토)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
	#calendar{
		margin:0 auto;
		width:350px;
		height:300px;
		text-align: center;
		/* border:2px solid #dedede; */
		border-spacing: 0;
		border-collapse:0;
	}
 	#calendar td{
		border-left:1px solid #ebebeb;
		border-bottom:1px solid #ebebeb;
	}
	#calendar tr:FIRST-CHILD td{
		height:40px;
		border-bottom:1px solid #ebebeb;
		border-top:1px solid #ebebeb;
		border-left:0;
		border-right:0;
		background:#fff;
		color:#949494;
	}
	#calendar td:LAST-CHILD{
		border-right:1px solid #ebebeb;
		}
	.enable{
		background:#f6f6f6;
		color:#cccccc;
		font-weight:bold;
		cursor:default;
	}
	.able{
		cursor:pointer;
		font-weight: 500;
	}
	#today{
		/* background:#7383BF; */
		background:#B2CCFF;
	}
	
	#calTop{
		width:161px;
		display:block;
		color:#003399;
		font-weight:bold;
		font-size:15px;
		margin:0 auto;
		margin-bottom:19px;
	}
	#calTop img{
		position:relative;
		top:6px;
	}
	#calTop #pre{
		left:-70px;
	}
	#calTop #next{
		right:-70px;
	}
</style>

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/HbLib/studyroom/calendar.js"></script>

</head>
<body>
		<span id="calTop">
			<form name="datePick">
				<input type="hidden" name="month" value="<%=i_month%>">
				<input type="hidden" name="year" value="<%=i_year%>">
				<input type="hidden" name="date">
			</form>
			<%
				if(i_month>month){
					%><img id="pre" src="img/pre.PNG"><%
				}
				out.print(i_year+"년 "+i_month+"월");
				
				if(i_month<month+3){
					%><img id="next" src="img/next.PNG"><%
				}
			%>
		</span>
	<table id="calendar">
		<tr>
			<td>일</td>
			<td>월</td>
			<td>화</td>
			<td>수</td>
			<td>목</td>
			<td>금</td>
			<td>토</td>
		</tr>
	<%
	int newLine = 0;
	//1일이 어느 요일에서 시작하느냐에 따른 빈칸 삽입
	out.println("<tr>");
	for(int i=1; i<w; i++)
	{
	out.println("<td>&nbsp;</td>");
	newLine++;
	}
	
	for(int i=1; i<=end; i++)
	{
		if(i_month == month){
			if(newLine==0||newLine==6||date>i){
				%>
				<td class="enable"><%=i %></td>
				<%
			}else if(date==i){
				%>
				<td id="today" class="able"><%=i %></td>
				<%
			}else{
				%>
				<td class="able"><%=i %></td>
				<%
			}
		}else{
			if(newLine==0||newLine==6){
				%>
				<td class="enable"><%=i %></td>
				<%
			}else{
				%>
				<td class="able"><%=i %></td>
				<%
			}
		}
		
		newLine++;
		
		if(newLine == 7 && i != end){
			out.println("</tr>");
			out.println("<tr>");
			newLine = 0;
		}
	}
	
	while(newLine>0 && newLine<7){
	out.println("<td>&nbsp;</td>");
	newLine++;
	}
	out.println("</tr>");
	%>
	</table>
</body>
</html>
