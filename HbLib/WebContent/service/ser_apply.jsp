<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/HbLib/css/mylibrary.css">
<style type="text/css">
table {border-top:solid 2px #838383;width:100%;border-spacing:0;}
table th {border-left:solid 1px #dfdfdf; border-bottom: solid 1px #dfdfdf;text-align:center;background-color:#f9f9f9;font-weight: bold;}
table th:first-child{border-left:none;}
table td {border-left:solid 1px #dfdfdf; border-bottom: solid 1px #dfdfdf;text-align:center;background-color:#fff;  font-size: 15px;}
table td:first-child{border-left:none;}
input[type=text]{height: 25px;}
.apply{color:white; background-color: #7189d0; border: 0; height: 30px; margin-top: 10px;}
.mainview_c_btn{margin-bottom: 10px;}
</style>
<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_03").css("background-color", "gray")
		$("#go").click(function() {
			var id = "<c:out value='${user.id}'/>";
			var url = "https://apis.daum.net/search/book?apikey=01c892cc876f5b1fd263a78eac5212d0&q="+$("#q").val()+"&output=json&callback=?";
			$.getJSON(url, function(data) {
				var result = "<h2>검색결과</h2><br/>";
				result +="<table><tr><th></th><th>제목</th><th>저자</th><th>분류</th>"+
					"<th>출판사</th><th>고유번호</th><th></th></tr>";
				
				for (var i in data.channel.item)
				{
					var s_url = data.channel.item[i].cover_s_url;
					var l_url = data.channel.item[i].cover_l_url;
					var title = data.channel.item[i].title;
					var author = data.channel.item[i].author_t;
					var category = data.channel.item[i].category;
					var publisher = data.channel.item[i].pub_nm;
					var isbn = data.channel.item[i].isbn;
					
					result += "<tr>";
					result += "<td>";
					result += "<img src='"+s_url+"'/></td>";
					result += "<td>"+title+"</td>";
					result += "<td>" +author+ "</td>";			
					result += "<td>" + category + "</td>";				
					result += "<td>" + publisher + "</td>";				
					result += "<td>" + isbn + "</td>";
					result += "<td id='tdadd'>";
					result += "<input type='button' value='신청' s_url='";
					result += s_url+"' title='"+title+"' id='"+id+"' l_url='"+l_url
					  +"' author='"+author+"' category='"+category+"' publisher='"+publisher+"' isbn='"+isbn+"'"
					   + " class='app'/></td>";
					result += "</tr>";
				}
				result +="</table>";
				result = result.replace(/&lt;/gi,'<');
				result = result.replace(/&gt;/gi,'>');
				$("#result").html(result);
			}).error(function(XMLHttpRequest, textStatus, errorThrown) {
				result = textStatus;			
			}).complete(function(){
					                                   
			});
			
		});		
		$(document).on("click", ".app", function() {
			$.ajax({
				type : "get",
				url : "/HbLib/AjaxController",
				data : 
					"s_url="+$(this).attr("s_url")+
					"&l_url="+$(this).attr("l_url")+
					"&id="+$(this).attr("id")+
					"&title="+$(this).attr("title")+
					"&author="+$(this).attr("author")+
					"&url="+$(this).attr("url")+
					"&category="+$(this).attr("category")+
					"&publisher="+$(this).attr("publisher")+
					"&isbn="+$(this).attr("isbn")+
					"&type=applybook",
				success: function (data) {
					if(data!=null){
						alert("신청되셨습니다.");
					}else{
						alert("데이터가안옴ㅋ");
					}
				},
				error:function(){
					alert("실패ㅋ");	
				}				
			});
		});
		$("#move").click(function() {
			location.href="/HbLib/Controller?type=applylist&id=${user.id}";
		});
	});
	
	
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<c:if test="${user.id==null }">
<script type="text/javascript">
alert("로그인해주세요")
history.go(-1)
</script>
</c:if>
	<div class="mainArea">
		<div class="mainArea2">
			<jsp:include page="ser_navi.jsp" />
			<div id="mainview">
				<div class="mainviewnavi">◆서비스이용 > 도서구입신청</div>
				<div>
					<div class="mainview_c_btn">
						<input type="button" value="신청현황" class="apply" id="move">						
					</div>
					<div align="center">
						<table >
							<tr>
								<td><input type="text" name="pwd" size="60" id="q" height="150" />
								<input type="button" value="검색" class="apply" ></td>
							</tr>
						</table>
					</div>
					<div id="result">
					
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>