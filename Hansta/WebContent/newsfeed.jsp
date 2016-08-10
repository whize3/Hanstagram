<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.wrap {
	background-color: #fafafa;
}
.container{
	width: 35%;
	margin: 0 auto;
}
.a1{
	margin-bottom: 60px;
}
.h1 {
	height: 26px;
	padding: 14px 20px;
	vertical-align: middle;
}

.profile {
	border: 1px solid #dbdbdb;
	border-radius: 50%;
	box-sizing: border-box;
	display: block;
	height: 30px;
	overflow: hidden;
	width: 30px;
	float: left;
	margin-right: 10px;
}

.profile_img {
	height: 100%;
	width: 100%;
}


a{
text-decoration: none;
color:#262626;


}

.image-wrap{
	width: 100%;
}
.image{
	width: 100%;
}
article{
background-color:white;
border: 1px solid #efefef;
}
.date{
float: right;
    color: #999;
}
.like{
	color: #262626;
	display: inline-block;    
}
ul{
	list-style: none;
	padding-left: 0px;
}
button{
font-size:20px;
background:transparent;
color: #999;
border: none;
padding: 0px;
}
.comment-wrap{
padding-left: 25px;
padding-right: 25px;
}
.comment_id{
font-size: 15px;
font-weight: bold;
padding-right: 10px;
}
.comment_content{
font-size: 15px;
font-weight: bold;
}
.comment_write{
width:100%;
border-top:1px solid #efefef;
display: table;
}
.heart_link{
width:25px;
    vertical-align: middle;
    display: table-cell;
}
.heart{
width:25px;

}
.comment_write_content{
padding-left: 10px;
border: none;
    display: table-cell;
    vertical-align: middle;
}

</style>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
$(function() {
	//좋아요 클릭 이벤트
	$(".heart").on("click",$(".comment_write>*"),function() {
		/* var index = $(".comment_write>a>img").index(this); */
		var src = $(this).attr("src");
		var b_idx = $(this).attr("b_idx");
		src = (src==="img/like.PNG")
		? "img/liked.PNG"
		: "img/like.PNG";		
		$(this).attr("src",src);	
		$.ajax({
			type: "post",
			url: "like.do",
			data: {"b_idx" : b_idx /* , "id" : ${user.id}  */},
			dataType: "text",
			success: function(data){
						
			},
			error : function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});	
	});	
	
	//댓글 입력(엔터) 이벤트
	$(".comment_write_content").keyup(function(e) {
	    if (e.keyCode == 13){
	    	var index = $(".comment_write_content").index(this);	    	
	    	/* var index = $(".comment_write>a>img").index(this); */
	    	var c_content = $(this).val();
	    	var b_idx = $(this).attr("b_idx");
	    	$.ajax({
				type: "post",
				url: "commentwrite.do",
				data: {"b_idx" : b_idx, "c_content" : c_content},
				dataType: "text",
				success: function(data){
								
				},
				error : function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			});	
	    };        
	});
}); 
</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="wrap">
	<div class="container">
		<c:forEach var="k" begin="0" end="5" items="${boardlist}">		
		<article class="a1"> 
			<header class="h1"> 
				<a class="profile" href="#"><img class="profile_img"
				src="https://scontent.cdninstagram.com/t51.2885-19/s150x150/12918039_230227960666719_282379501_a.jpg"></a>
				<a class="id" href="#">${k.id}</a> 
				<span class="date">${k.b_time}</span> 
			</header>
			<div class="image-wrap">
				<img class="image" src="upload/${k.img_url}.jpg" style="">				
			</div>
			<div class="comment-wrap">
				<div class="like">좋아요 ${k.like_count}개</div>
				<div class="comment">
					<ul>
						<li><button>댓글 더보기</button></li>
						<c:forEach var="c" items="${commentlist}">
						<c:if test="${c.b_idx==k.b_idx}">
							<li><a class="comment_id">${c.id}</a><span class="comment_content">${c.c_content}</span></li>
						</c:if>						
						</c:forEach>
					</ul>
				</div>
				<div class="comment_write">
					<c:choose>
						<c:when test="${k.like_state==0}">
							<a class="heart_link"><img class="heart" b_idx="${k.b_idx}" src="img/like.PNG" onclick="like_go(this)"></a>
						</c:when>
						<c:when test="${k.like_state==1}">
							<a class="heart_link"><img class="heart" b_idx="${k.b_idx}" src="img/liked.PNG" onclick="like_go(this)"></a>
						</c:when>
					</c:choose>
					
					<input type="text" class="comment_write_content" b_idx="${k.b_idx}" aria-label="댓글 달기..." placeholder="댓글 달기...">
				</div>
			</div>		
		</article>		
		</c:forEach>
	</div>
	
</div>

</body>
</html>