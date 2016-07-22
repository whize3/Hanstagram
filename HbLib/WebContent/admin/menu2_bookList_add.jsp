<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sub = request.getParameter("subject");
	pageContext.setAttribute("subject", sub);
	System.out.println(sub);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/HbLib/css/menuList.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		/* if(subject=!null){
			var subject = "<c:out value="${subject}"/>";
			alert(subject);
			$("#search_text").val(subject);
		} */
		$("#search_go").click(function() {
			
			var url = "https://apis.daum.net/search/book?apikey=01c892cc876f5b1fd263a78eac5212d0&q="+$("#search_text").val()+"&output=json&callback=?";
			$.getJSON(url, function(data) {
				var result = "<h2>검색결과</h2><br/>";
				result +="<table><tr><th></th><th>제목</th><th>저자</th><th>분류</th>"+
					"<th>출판사</th><th>고유번호</th></tr>";
				
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
					result += "<td><p class='"+isbn+"' style='display:none;'>위치 : <input type='text' name='b_location' class='b_location'/></p></td>";
					result += "<td id='tdadd'>";
					result += "<input type='button' value='선택' class='btn' id='"+isbn+"'>";
					result += "<input type='button' style='display:none;' value='취소' class='"+isbn+"' id='cancel' name='cancel'/>";
					result += "<input type='button' style='display:none;' value='추가' s_url='";
					result += s_url+"' l_url='"+l_url
					  +"' title='"+title+"'"+"' author='"+author+"' category='"+category+"' publisher='"+publisher+"' isbn='"+isbn+"'"
					   + " class='bookAdd'/></td>";
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

		$(document).on("click",".btn",function(){
			var isbn = $(this).attr("id");
			console.log(isbn);
			$("."+isbn).show();
			$(this).hide();
			$(".bookAdd").show();
			
		});
		
		$(document).on("click","#cancel",function(){
			console.log("취소");
			var isbn = $(this).attr("class");
			console.log(isbn);
			$("."+isbn).hide();
			$(".btn").show();
			$(".bookAdd").hide();
		});
		$(document).on("click",".bookAdd",function(){
			var isbn = $(this).attr("isbn");
			var b_location = $("."+isbn+" .b_location").val();
			console.log(b_location);
				$.ajax({
					type : "get",
					url : "/HbLib/AjaxController",
					data :
						"s_url="+$(this).attr("s_url")+
						"&l_url="+$(this).attr("l_url")+
						"&title="+$(this).attr("title")+
						"&author="+$(this).attr("author")+
						"&url="+$(this).attr("url")+
						"&category="+$(this).attr("category")+
						"&publisher="+$(this).attr("publisher")+
						"&isbn="+$(this).attr("isbn")+
						"&b_location="+b_location+
						"&type=a_bookAdd",
					success: function (data) {
						if(data!=null){
							alert("추가.");
							location.href=data;
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

<jsp:include page="main.jsp"/>
	<!-- 전체 -->
	<div id="content-wrap">
		<!-- 메뉴 -->
		<div id="menu">
			<!-- menu 로고 -->
			<div class="menu-header"><img src="/HbLib/img/icon_menu_book.jpg" class="img"/><h3>도서관리</h3><hr/></div>
			<div class="menu-wrap">
				<ul class="submenu">
					<li><span class="li-s">></span><a href="/HbLib/Controller?type=a_booklist">도서 조회/추가</a></li>
					<li><span class="li-s">></span><a href="/HbLib/Controller?type=a_applyBookList">희망 도서 조회</a></li>
				</ul>
			</div>
		</div>
		<!-- 내용 -->
		<div id="content">
			<div class="page-header">
				<h3>도서 검색</h3>
			</div>
			<hr/>
			<div class="book-search">
				<table >
					<tr>
						<td width="100">검색어</td>
						<td><input type="text" name="search_text" size="30" id="search_text" /></td>
						<td width="120"><input type="button" value="검색" id="search_go" ></td>
					</tr>
				</table>
			</div>
			<div id="result">
					
			</div>
			<!-- <div id="bookAdd">
			
			</div> -->
			<!-- <div class="page-header">
				<h3>도서 추가</h3>
			</div>
			<hr/>
			<div class="table-wrap2">
				<table class="table-add" style="border: 1px solid #AEAEAE; margin: auto; width: 90%; text-align: left;">
					<tbody>
						<tr>
							<th>번호</th><td><input type="text" name="b_num"/></td>
						</tr>
						<tr>
							<th>제목</th><td><input type="text" name="b_subject"/></td>
						</tr>
						<tr>
							<th>위치</th><td><input type="text" name="b_location"/></td>
						</tr>
						<tr>
							<th>출판사</th><td><input type="text" name="publisher"/></td>
						</tr>
						<tr>
							<th>저자</th><td><input type="text" name="writer"/></td>
						</tr>
						<tr>
							<th>장르</th>
							<td>
								<select name="category">
									<option value="인문">인문</option>
									<option value="과학">과학</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>ISBN</th><td><input type="text" name="isbn"/></td>
						</tr>
						<tr>
							<th>IMAGE URL</th><td><input type="text" name="img_url"/></td>
						</tr>
						
					</tbody>
				</table><br/><br/>
				
			</div>
			<div align="center">
				<form>
				<input type="button" style="text-align: center;" value="도서추가" onclick="book_add(this.form)">
				</form>
			</div> -->
		</div>
	</div>
</body>
</html>