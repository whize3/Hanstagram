<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
$(function() {
	$(".heart").click(function() {
		var src = ($(this).attr("src")==="img/like.PNG")
		
		? "img/liked.PNG"
		: "img/like.PNG";
		$(this).attr("src",src);	
	});
	
});
</script>
<style type="text/css">
.wrap {
	background-color: #fafafa;
}
.container{
	width: 50%;
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
</head>
<body>
<div class="wrap">
	<div class="container">
		
		<article class="a1"> 
			<header class="h1"> 
				<a class="profile" href="#"><img class="profile_img"
				src="https://scontent.cdninstagram.com/t51.2885-19/s150x150/12918039_230227960666719_282379501_a.jpg"></a>
				<a class="id" href="#" title="beyonce">beyonce</a> 
				<span class="date">5일</span> 
			</header>
			<div class="image-wrap">
				<img class="image" src="https://scontent.cdninstagram.com/t51.2885-15/e35/13774582_1749496125311582_207598600_n.jpg?ig_cache_key=MTMwNDc2NTYyMDY0MjMyODU1NQ%3D%3D.2" style="">
			</div>
			<div class="comment-wrap">
				<div class="like">좋아요 993개</div>
				<div class="comment">
					<ul>
						<li><button>댓글 더보기</button></li>
						
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						
					</ul>
				</div>
				<div class="comment_write">
					<a class="heart_link" href="#"><img class="heart" src="img/like.PNG"></a>
					<input type="text" class="comment_write_content" aria-label="댓글 달기..." placeholder="댓글 달기...">
				</div>
			</div>		
		</article>
		
		<article class="a1"> 
			<header class="h1"> 
				<a class="profile" href="#"><img class="profile_img"
				src="https://scontent.cdninstagram.com/t51.2885-19/s150x150/12918039_230227960666719_282379501_a.jpg"></a>
				<a class="id" href="#" title="beyonce">beyonce</a> 
				<span class="date">5일</span> 
			</header>
			<div class="image-wrap">
				<img class="image" src="https://scontent.cdninstagram.com/t51.2885-15/e35/13774582_1749496125311582_207598600_n.jpg?ig_cache_key=MTMwNDc2NTYyMDY0MjMyODU1NQ%3D%3D.2" style="">
			</div>
			<div class="comment-wrap">
				<div class="like">좋아요 993개</div>
				<div class="comment">
					<ul>
						<li><button>댓글 더보기</button></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						
					</ul>
				</div>
				<div class="comment_write">
					<a class="heart_link" href="#"><img class="heart" src="img/like.PNG"></a>
					<input type="text" class="comment_write_content" aria-label="댓글 달기..." placeholder="댓글 달기...">
				</div>
			</div>		
		</article>
		
		<article class="a1"> 
			<header class="h1"> 
				<a class="profile" href="#"><img class="profile_img"
				src="https://scontent.cdninstagram.com/t51.2885-19/s150x150/12918039_230227960666719_282379501_a.jpg"></a>
				<a class="id" href="#" title="beyonce">beyonce</a> 
				<span class="date">5일</span> 
			</header>
			<div class="image-wrap">
				<img class="image" src="https://scontent.cdninstagram.com/t51.2885-15/e35/13774582_1749496125311582_207598600_n.jpg?ig_cache_key=MTMwNDc2NTYyMDY0MjMyODU1NQ%3D%3D.2" style="">
			</div>
			<div class="comment-wrap">
				<div class="like">좋아요 993개</div>
				<div class="comment">
					<ul>
						<li><button>댓글 더보기</button></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						
					</ul>
				</div>
				<div class="comment_write">
					<a class="heart_link" href="#"><img class="heart" src="img/like.PNG"></a>
					<input type="text" class="comment_write_content" aria-label="댓글 달기..." placeholder="댓글 달기...">
				</div>
			</div>		
		</article>
		
		<article class="a1"> 
			<header class="h1"> 
				<a class="profile" href="#"><img class="profile_img"
				src="https://scontent.cdninstagram.com/t51.2885-19/s150x150/12918039_230227960666719_282379501_a.jpg"></a>
				<a class="id" href="#" title="beyonce">beyonce</a> 
				<span class="date">5일</span> 
			</header>
			<div class="image-wrap">
				<img class="image" src="https://scontent.cdninstagram.com/t51.2885-15/e35/13774582_1749496125311582_207598600_n.jpg?ig_cache_key=MTMwNDc2NTYyMDY0MjMyODU1NQ%3D%3D.2" style="">
			</div>
			<div class="comment-wrap">
				<div class="like">좋아요 993개</div>
				<div class="comment">
					<ul>
						<li><button>댓글 더보기</button></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						
					</ul>
				</div>
				<div class="comment_write">
					<a class="heart_link" href="#"><img class="heart" src="img/like.PNG"></a>
					<input type="text" class="comment_write_content" aria-label="댓글 달기..." placeholder="댓글 달기...">
				</div>
			</div>		
		</article>
		
		<article class="a1"> 
			<header class="h1"> 
				<a class="profile" href="#"><img class="profile_img"
				src="https://scontent.cdninstagram.com/t51.2885-19/s150x150/12918039_230227960666719_282379501_a.jpg"></a>
				<a class="id" href="#" title="beyonce">beyonce</a> 
				<span class="date">5일</span> 
			</header>
			<div class="image-wrap">
				<img class="image" src="https://scontent.cdninstagram.com/t51.2885-15/e35/13774582_1749496125311582_207598600_n.jpg?ig_cache_key=MTMwNDc2NTYyMDY0MjMyODU1NQ%3D%3D.2" style="">
			</div>
			<div class="comment-wrap">
				<div class="like">좋아요 993개</div>
				<div class="comment">
					<ul>
						<li><button>댓글 더보기</button></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						
					</ul>
				</div>
				<div class="comment_write">
					<a class="heart_link" href="#"><img class="heart" src="img/like.PNG"></a>
					<input type="text" class="comment_write_content" aria-label="댓글 달기..." placeholder="댓글 달기...">
				</div>
			</div>		
		</article>
		
		<article class="a1"> 
			<header class="h1"> 
				<a class="profile" href="#"><img class="profile_img"
				src="https://scontent.cdninstagram.com/t51.2885-19/s150x150/12918039_230227960666719_282379501_a.jpg"></a>
				<a class="id" href="#" title="beyonce">beyonce</a> 
				<span class="date">5일</span> 
			</header>
			<div class="image-wrap">
				<img class="image" src="https://scontent.cdninstagram.com/t51.2885-15/e35/13774582_1749496125311582_207598600_n.jpg?ig_cache_key=MTMwNDc2NTYyMDY0MjMyODU1NQ%3D%3D.2" style="">
			</div>
			<div class="comment-wrap">
				<div class="like">좋아요 993개</div>
				<div class="comment">
					<ul>
						<li><button>댓글 더보기</button></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						<li><a class="comment_id">아이디</a><span class="comment_content">여기에 댓글 내용이 나옴</span></li>
						
						
					</ul>
				</div>
				<div class="comment_write">
					<a class="heart_link" href="#"><img class="heart" src="img/like.PNG"></a>
					<input type="text" class="comment_write_content" aria-label="댓글 달기..." placeholder="댓글 달기...">
				</div>
			</div>		
		</article>
		
	</div>
	
</div>



</body>
</html>