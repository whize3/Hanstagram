<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/Hansta/css/sue.css">
<script type="text/javascript" src="/Hansta/js/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	$(".wrap").hover(function(){
		$(this).find(".box").css("z-index","100");
		$(this).find("span").css("z-index","105");
	},function(){
		$(this).find(".box").css("z-index","-100");
		$(this).find("span").css("z-index","-100");
	}
	);
	
	$("#cancel").click(function(){
		$(this).css("display","none");
		$("#pop").css("display","none");
		$(".popArea").css("display","none");
	});
	$("#pop").click(function(){
		console.log("bye");
		$("#cancel").css("display","none");
		$("#pop").css("display","none");
		$(".popArea").css("display","none");
	});
	
	$("#follower").click(function(){
		$("#cancel").css("display","inline-block");
		$("#pop").css("display","block");
		$(".popArea").css("display","block");
	});
});
</script>
</head>

<body class="body">

<main>

   <article>

      <header class="profile">
         <div class="profileImg">
            <img src="/Hansta/img/a.jpg"/>
         </div>
         <div class="profileInfo">
         <!-- 다른 유저의 타임라인인 경우 -->
            <div>
               <h1>UserIDUserIDUserID</h1>
               <!-- 팔로우 여부에 따라 다른 버튼 공개 -->
<!--                <span class="fBtn" id="ableFollow"><button>팔로우</button></span> -->
               <span class="fBtn" id="enableFollow"><button onclick="location.href('follow.do')">팔로잉</button></span>
            </div>
            
            <!-- 내 타임라인인 경우 -->
<!--

            <div>
               <h1>UserIDUserIDUserID</h1>
               <span class="fBtn"><button>프로필 편집</button></span>
               <span class="fBtn" id="write"><button>게시글 작성</button></span>
            </div>
-->
            <div class="name info">UserName</div>
            <ul class="info">
               <li><span>게시물 <span class="number">0</span> 개</span></li>
               <li><a href="#" id="follower"><span>팔로워 <span class="number">0</span> 명</span></a></li>
               <li><a href="#" id="follow"><span>팔로우 <span class="number">0</span> 명</span></a></li>
            </ul>
         </div>
      </header>
      <div class="Container">
      <!-- 게시글이 있는 경우, 한 라인당 3개씩 -->
      	<!-- <div class="line">
      		<a href="#">
      			<div class="wrap">	
	      			<div class="contents"><img src="/Hansta/img/0001.jpg"></div>
	      			<div class="box"></div>
	      			<span>
		      			<img src="/Hansta/img/bubble.png">
		      			<span>0</span>
		      			<img src="/Hansta/img/likeWhite.png">
		      			<span>0</span>
		      		</span>
      			</div>
      		</a>
      		<a href="#">
      			<div class="wrap">
	      			<div class="contents"><img src="/Hansta/img/0002.jpg"></div>
	      			<div class="box"></div>
      			</div>
      		</a>
      		<a href="#">
      			<div class="wrap">
	      			<div class="contents"><img src="/Hansta/img/0002.jpg"></div>
	      			<div class="box"></div>
      			</div>
      		</a>
      	</div> -->
      	
      	<!-- 내 타임라인인데 게시물이 없는 경우 -->
      	<!-- <div id="none">
      		<h2>소중한 순간을 포착하여 공유해보세요.</h2>
			<h3>첫 사진이나 동영상을 공유해보세요</h3>
			<a href="#"><img src="/Hansta/img/plus.png"></a>
		</div> -->
		
		<!-- 타인의 타임라인에 게시물이 없는 경우 -->
		<div id="none">
			<h3>아직 게시물이 없습니다.</h4>
		</div>
      </div>


   </article>

</main>

<!-- 팔로우 혹은 팔로워 리스트 -->
<div id="pop">
</div>
<div class="popArea">

	<img src="/Hansta/img/cancel.png" id="cancel">
	<div class="popTable">
		<header><span>팔로워</span></header>
		<ul>
			<li>
				<div class="person">
					<a href="#"><img src="/Hansta/img/person.jpg"></a>
					<div>
						<span class="personId"><a href="#">LeeSue</a></span>
						<span class="personName">이수현</span>
					</div>
						<button>팔로우</button>
				</div>
			</li>
		
		</ul>
	</div>
</div>

</body>

</html>
    