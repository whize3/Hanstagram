<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
ul {
	list-style: none;
	padding: 0px;
	margin: 0px;
}

li:HOVER {
	background-color: lightblue;
	cursor: pointer;
}

#search_div {
	border: 1px solid lightgray;
	border-top: none;
	position:absolute;
	background-color: white;
	width: 100%;
}
.selected {
	background-color: lightblue;
}

</style>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
$(function() {
	var which;
/* 	$("#search").keyup(function(e) {
				if(e.which == 40){
					which++;
					if(which >= $("#search_list").children().length)
						which = 0;
					$("#search_list").children().eq(which).attr("class","selected");
					alert($("#search_list").children().eq(which).text());
					$("#search").val($("#search_list").children().eq(which).text());
				} else if(e.which == 38) {
					which--;
					if(which < 0)
						which = 0;
					$("#search_list").children().eq(which).attr("class","selected");
					$("#search").text($("search_list").children().eq(which).val());
				} else if(e.which == 13){
					$("#search_list").children().eq(which).attr("class","selected");
					$(".selected").trigger("click");
				} else {
					which = -1;
				}		
	}); */
	$("#search").keyup(function(e) {
		$.ajax({
			type: "post",
			url: "search.do",
			data: {"keyword" : $("#search").val()},
			dataType: "json",
			success: function(data){
				if(e.which != 40 && e.which!=38){
					$("#search_div").empty();
					$("<ul>").attr("css", "width:200px").attr("id","search_list").appendTo($("#search_div"));
					
					for(var i=0; i<data.length; i++)
						$("<li>").attr("class","keyword").attr("id", i).text(data[i]["keyword"]).appendTo("#search_list");
				}
				$("li.keyword").each(function(){
					$(this).on("click", function(){
						location.href="" + $(this).text();
					})
				});
				if(e.which == 40){
					which++;
					if(which >= $("#search_list").children().length)
						which = 0;
					$("#search_list").children().attr("class","");
					$("#search_list").children().eq(which).attr("class","selected");
					$("#search").val($("#search_list").children().eq(which).text());
				} else if(e.which == 38) {
					which--;
					if(which < 0)
						which = 0;
					$("#search_list").children().attr("class","");
					$("#search_list").children().eq(which).attr("class","selected");
					$("#search").val($("#search_list").children().eq(which).text());
				} else if(e.which == 13){
					$("#search_list").children().eq(which).attr("class","selected");
					$(".selected").trigger("click");
				} else {
					which = -1;
				}	
			},
			error : function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
	});
	
})

</script>
</head>
<body>
	<input type="text" id="search" aria-label="검색" placeholder="검색">
	<div id="search_div"></div>
</body>
</html>