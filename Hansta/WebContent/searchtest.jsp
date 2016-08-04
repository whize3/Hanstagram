<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
$(function() {
	$("#search").keyup(function(e) {
		$.ajax({
			type: "post",
			url: "search.do",
			data: {"keyword" : $("#search").val()},
			dataType: "text",
			success: function(data){
				$("#search_div").empty();
				$("#search_div").append(data);
			},
			error : function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
	})
	
})

</script>
</head>
<body>
	<input type="text" id="search" aria-label="검색" placeholder="검색">
	<div id="search_div"></div>
</body>
</html>