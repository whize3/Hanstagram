<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
	#container .wrap{
 		/* border:1px solid #000; */
		height:300px;
		margin:0 auto;
		display:inblock;
		margin-bottom:45px;
	}
	#container .wrap:FIRST-CHILD{
		margin-top:70px;
		height:250px;
	}
	#notice{
		position:relative;
		left:0px;
		top:-47px;
		width:315px;
		display:inline-block;
		/* border:1px solid #000; */
	}
	#notice p{
		border-bottom:1px solid #e3e3e3;
		padding:5px;
		margin:0px;
	}
	#notice p img{
		position:relative;
		right:-204px;
		top:5px;
		width:20px;
	}
	#notice ul{
		padding-left:25px;
		padding-right:28px;
	}
	#notice ul li{
		margin-top:12px;
		
	    overflow: hidden;
	    word-break: break-all;
	    white-space: nowrap;
	    text-overflow: ellipsis;
		
	}
	#notice ul li span {
	    display: inline-block;
	    width: 30px;
	    height: 15px;
	    margin-right: 15px;
	    color: #fff;
	    font-size: 12px;
	    text-align: center;
	    line-height: 15px;
	    background:#7383bf;
	}
	#notice ul li a{
	    color: #505050;
    	font-size: 13px;
	}
	
	
	#event{
		width:310px;
		height:100%;
		margin-left:7px;
		margin-right:7px;
		display:inline-block;
		overflow: hidden;
	}
	
	#login{
		width:290px;
		height:100%;
		margin-left:7px;
		margin-right:7px;
		display:inline-block;
		overflow: hidden;
		position:relative;
	}
	
	/* 두번째줄 */
	#books{
		width:632px;
		height:100%;
		border: 1px solid #e8e8e8;
		position:relative;
		display: inline-block;
	}
	#books ul{
		margin:0;
		padding:0;
	}
	#books li h2{
		height: 49px;
	    font-size: 18px;
	    line-height: 49px;
	    margin:0;
	    height:52px;
	}
	#books li.on h2{
	    border-top: 3px solid #7383bf;
	    border-bottom: none;
	    height:49px;
	}
	#books li.on h2 a{
	    color:#052efc;
	    font-weight:bold;
	}
	#books > ul > li {
		float: left;
		width: 50%;
		text-align: center;
    }
    #books > ul > li > h2 {
	    height: 41px;
	    border-bottom: 1px solid #e8e8e8;
	    font-size: 16px;
	    font-weight: normal;
	    line-height: 51px;
	}
	#books ul li h2 a{
		display:block;
		margin-top:10px;
	 }
    #books > ul > li:first-child h2 {
    border-right: 1px solid #e8e8e8;
    }
    #books > ul > li > div{
    	display: none;
	    position: absolute;
	    top: 84px;
	    left: 0;
	    width: 100%;
    }
    #books > ul > li.on > div {
		display: block;
		position:absolute;
    }
    #books > ul > li > div > div {
		position: relative;
		height: 192px;
		margin: 0 42px;
		overflow: hidden;
		z-index: 10;
    }
    #books ul li div div ul li span.bookCover {
		position: relative;
		display: block;
		width: 114px;
		height: 152px;
		margin-bottom: 9px;
    	background:url(./img/bookCover.png) no-repeat;
	}    
	#books > ul > li > div > div > ul > li{
		width:130px;
		float:left;
	}
	#books ul li div div ul li a{
		display:inline-block;
		width: 114px;
    	height: 189px;
    }
    #books ul li div div ul li img {
    	width:107px;
    	height:150px;
    	position: absolute;
	    top: 1px;
	    left: 1px
    }
    #books > ul > li > div > div > ul > li a span.bookTit {
	    display: block;
	    color: #424242;
	    font-size: 12px;
	    text-align: center;
	    overflow: hidden;
	    word-break: break-all;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	}
    #books > ul > li > div > div > ul > li a span.writer {
        display: block;
	    color: #acacac;
	    font-size: 12px;
	    text-align: center;
	    overflow: hidden;
	    word-break: break-all;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    }
	
	#books ul > li .bookBtn{
		position: absolute;
	    top: 150px;
	    left: 0;
	}
	#books ul > li .bookBtn .pre{
		position:absolute;
		left:22px;
	}
	#books ul > li .bookBtn .next{
		position:absolute;
		right:22px;
	}
	
	
	#current{
		position:relative;
		right:0px;
		top:-18px;
		width:310px;
		height:100%;
		display:inline-block;
		margin-left:5px;
	}
	#current p{
		border-bottom:1px solid #e3e3e3;
		padding:5px;
		margin:0px;
	}
	#current p a{
		position:absolute;
		right:5px;
		width:50px;
		font-size:12px;
		display: inline-block;
	    color: #fff;
	    text-align: center;
	    line-height: 15px;
	    background:#898989;
	    padding:2px;
	}
	#current p a:HOVER{
		background:#545454;
	}
	#current ul{
		padding-left:25px;
	}
	#current ul li{
		margin-top:12px;
	}
	#current ul li span {
	    display: inline-block;
	    width: 30px;
	    height: 15px;
	    margin-right: 15px;
	    color: #fff;
	    font-size: 12px;
	    text-align: center;
	    line-height: 15px;
	    background:#7383bf;
	}
	#current ul li a{
	    color: #505050;
    	font-size: 13px;
	}
</style>


<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
$(function(){
	$(".bookBtn a").click(function(){
		if($(this).hasClass("pre")){
			console.log("pre");
		}else{
			console.log("next");
		}
	});
});
function moveBanner(int a){
	
} 
</script>
</head>
<body>

<div id="container">
	<div class="wrap">
		<div id="notice">
			<p>공지사항 <a href="#"><img src="./img/plus.png"></a></p>
			<ul>
				<li><span class="noticeType">공지</span><a href="#">포켓몬고포켓몬고포켓몬고포켓몬고포켓몬고포켓몬고</a></li>
				<li><span class="noticeType">공지</span><a href="#">포켓몬고포켓몬고포켓몬고포켓몬고</a></li>
				<li><span class="noticeType">공지</span><a href="#">포켓몬고포켓몬고포켓몬고포켓몬고</a></li>
				<li><span class="noticeType">공지</span><a href="#">포켓몬고포켓몬고포켓몬고포켓몬고</a></li>
				<li><span class="noticeType">공지</span><a href="#">포켓몬고포켓몬고포켓몬고포켓몬고</a></li>
			</ul>
		</div>
		<div id="event">
			<!-- <img src="img/banner4.jpg"> -->
			<%@include file="banner.html" %>
		</div>
		<div id="login">
			<jsp:include page="login.jsp"/> 
		</div>
		</div>
	<div class="wrap">
		<div id="books">
			<ul>
				<li class="on">
					<h2><a href="#">신규 도서</a></h2>
					<div>
					<div>
						<ul style="width:2544px;left:0px;">
						<li>
							<a href="">
								<span class="bookCover"><img src="./img/8950965410_1.jpg"></span>
								<span class="bookTit">니시우라 사진관의 비밀 : 미카미 엔  장편소설</span>
								<span class="writer">삼상연</span>
							</a>
						</li>
						<li>
							<a href="">
								<span class="bookCover"><img src="./img/8950965410_1.jpg"></span>
								<span class="bookTit">니시우라 사진관의 비밀 : 미카미 엔  장편소설</span>
								<span class="writer">삼상연</span>
							</a>
						</li>
						<li>
							<a href="">
								<span class="bookCover"><img src="./img/8950965410_1.jpg"></span>
								<span class="bookTit">니시우라 사진관의 비밀 : 미카미 엔  장편소설</span>
								<span class="writer">삼상연</span>
							</a>
						</li>
						<li>
							<a href="">
								<span class="bookCover"><img src="./img/8950965410_1.jpg"></span>
								<span class="bookTit">니시우라 사진관의 비밀 : 미카미 엔  장편소설</span>
								<span class="writer">삼상연</span>
							</a>
						</li>
						<li>
							<a href="">
								<span class="bookCover"><img src="./img/8950965410_1.jpg"></span>
								<span class="bookTit">니시우라 사진관의 비밀 : 미카미 엔  장편소설</span>
								<span class="writer">삼상연</span>
							</a>
						</li>
						</ul>
					</div>
					</div>
					<div class="bookBtn">
					<a href="#" class="pre">
						<img src="./img/main_prev.png">
					</a>
					<a href="#" class="next">
						<img src="./img/main_next.png">
					</a>
					</div>
				</li>
				<li>
					<h2><a href="#">인기 도서</a></h2>
					<div></div>
					<div class="bookBtn">
					<a href="#" class="pre">
						<img src="./img/main_prev.png">
					</a>
					<a href="#" class="next">
						<img src="./img/main_next.png">
					</a>
					</div>
				</li>
			</ul>
		</div>
		<div id="current">
			<p>열람실 좌석 현황 <a href="#"><span class="currentType">이용안내</span></a></p>
			<ul>
				<li>제 1 열람실 : 30/45</li>
				<li>제 2 열람실 : 42/60</li>
				<li>제 3 열람실 : 47/50</li>
			</ul>
			<p>스터디룸 이용 현황 <a href="#"><span class="currentType">이용안내</span></a></p>
			<ul>
				<li>1층 : 1/3</li>
				<li>2층 : 0/4</li>
				<li>3층 : 2/4</li>
			</ul>
		</div>
	</div>

</div>
</body>
</html>