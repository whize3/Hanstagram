<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/HbLib/css/mylibrary.css">
<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_03").css("background-color", "gray")
		$("#go").click(function() {
			var url = "https://apis.daum.net/search/book?apikey=01c892cc876f5b1fd263a78eac5212d0&q="+$("#q").val()+"&output=json&callback=?";
			$.getJSON(url, function(data) {
				var result = "<h2>검색결과</h2><br/>";
				result +="<table><tr><th></th><th>제목</th><th>저자</th><th>분류</th>"+
					"<th>출판사</th><th>고유번호</th></tr>";
				
				for (var i in data.channel.item)
				{
					var url = data.channel.item[i].cover_s_url;
					var title = data.channel.item[i].title;
					var author = data.channel.item[i].author_t;
					var category = data.channel.item[i].category;
					var publisher = data.channel.item[i].pub_nm;
					var isbn = data.channel.item[i].isbn;
					result += "<tr>";
					result += "<td>";
					result += "<img src='"+url+"'/></td>";
					result += "<td>"+title+"</td>";
					result += "<td>" +author+ "</td>";			
					result += "<td>" + category + "</td>";				
					result += "<td>" + publisher + "</td>";				
					result += "<td>" + isbn + "</td>";
					result += "<td id='tdadd'>";
					result += "<input type='button' value='신청' url='";
					result += url+"' title='"+title
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
					"url="+$(this).attr("url")+
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
					}
				},
				error:function(){
					alert("실패ㅋ");	
				}				
			});
		});
	});
	
	
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="mainArea">
		<div class="mainArea2">
			<jsp:include page="ser_navi.jsp" />
			<div id="mainview">
				<div class="mainviewnavi">◆서비스이용 > 도서구입신청</div>
				<div>
					<div class="mainview_c_btn">
						<input type="button" value="신청현황">						
					</div>
					<div align="center">
						<table >
							<tr>
								<td width="100">검색어</td>
								<td><input type="text" name="pwd" size="30" id="q" /></td>
								<td width="120"><input type="button" value="검색" id="go" ></td>
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