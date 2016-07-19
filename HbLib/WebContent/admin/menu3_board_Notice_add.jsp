<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/HbLib/css/menuList.css" type="text/css" rel="stylesheet">

<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>

<script>
   window.onload=function(){
       CKEDITOR.replace('n_content',{
       });
       CKEDITOR.instances.content.getData();
   }
</script>
<script type="text/javascript">
	function notice_add(f) {
		f.action="/HbLib/Controller";
		f.submit();
		
	}
</script>


</head>
<body>
<jsp:include page="main.jsp"/>
	<!-- 전체 -->
	<div id="content-wrap">
		<!-- 메뉴 -->
		<div id="menu">
			<!-- menu 로고 -->
			<div class="menu-header"><img src="../img/icon_menu_book.jpg" class="img"/><h3>게시판 관리</h3><hr/></div>
			<div class="menu-wrap">
				<ul class="submenu">
					<li><span class="li-s">></span><a href="menu3_board_Notice.jsp">공지사항</a></li>
					<li><span class="li-s">></span><a href="menu3_board_QNA.jsp">Q&A</a></li>
				</ul>
			</div>
		</div>
		<!-- 내용 -->
		<div id="content">
			<div class="page-header">
				<h3>공지사항 글쓰기</h3>
			</div> 
			<hr/>
			<form>
				<div class="subject">
					<input type="text" name="n_subject" style="width: 300px"/>
				</div>
				<div class="n_textarea">
					<textarea name="n_content" id="n_content" rows="10" cols="100" style="height: 400px;"></textarea>
					<br/><br/>				
				</div>
				<div align="center">			
					<input type="button" value="글쓰기" onclick="notice_add(this.form)">
					<input type="hidden" name="type" value="NoticeAdd"/>				
				</div>
			</form>
		</div>
	</div>
</body>
</html>