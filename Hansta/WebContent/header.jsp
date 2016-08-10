<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.body{
margin:0;
background:#fafafa;
padding:0;
}
nav{
width:100%;
display: block;
margin:0;
border-bottom:solid 1px #dbdbdb;
background:#fff;
}

#header{
display: block;
width:960px;
height:77px;
margin:0 auto;
}

.header{
display: table;
text-align: center;
width:100%;
padding-top:20px;
}
.header div{
display: table-cell;
vertical-align: middle;
}
.header div input{
padding:3px 10px 3px 26px;
border-radius:3px;
border:solid 1px #dbdbdb;
width:177px;
height:20px;

}
.searchMask{
width:177px;
height:20px;
border:1px solid #000;
display: inline-block;
}

#logoArea{
position:relative;
display: table-cell;
vertical-align: middle;

}
#logoArea img{
display: inline-block;
}
#iconArea{
display:inline-block;
width:132px;
height:24px;
border:1px solid #000;
}

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
	display: block;
    top: 77px;
    left: 40%;
    width: 347px;
}
.selected {
	background-color: lightblue;
}

</style>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
$(function() {
	var which;
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
<body class="body">
<nav>
	<div id="header">
		<div class="header">
		
			<a href="#" id="logoArea"><img src="/Hansta/img/headerLogo.PNG"></a>
			<div>
				<!-- <span class="searchMask"></span> --><input type="text" id="search" placeholder="검색">
			</div>
			<div id="search_div"></div>
			<div id="iconArea"></div>
		</div>
	</div>
</nav>
</body>
</html>