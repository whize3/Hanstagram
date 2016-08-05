<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
div{
display: inline-block;
}
article{
display:block;
padding:40px 20px;
width:100%;
}
main{
background:#fafafa;
width:987px;
height:100%;
margin:0 auto;
display: block;
}

main header.profile{
padding:20px;
margin-bottom:45px;
display: table;
}

.profile .profileImg, .profile .profileInfo{
display: table-cell;
vertical-align:middle;
padding:0;
margin:0;
}

.profile .profileInfo{
padding-left:36px;
}
.profile .profileImg{
margin:-2px 60px;
overflow: hidden;
border-radius:50%;
border:1px solid #dbdbdb;
display: inline-block;
}

.profile .profileImg img{
display: inline-block;
}
.profile h1{
display:inline-block;
font-weight:300;
font-size:34px;
line-height:40px;
margin:0;
}

.profile ul{
padding:0;
}

.profile li{
float:left;
list-style: none;
display: inline-block;
margin:0;
margin-right: 40px;
}

.profile .name{

display:inline-block;
font-weight:600;

}
.profileInfo > div:FIRST-CHILD{
display: block;
}
.profile .fBtn button{
width:100%;
height:100%;
border:1px solid #999;
background:0 0;
font-size:16px;
color: #999;
border-radius:3px;
}

.fBtn{
display: inline-block;
width:106px;
height:31px;
}

.info{

margin:0;

margin-top:14px;

}

.number{

font-weight:bold;

}

a{

color:#000;

text-decoration: none;

}

.contents{
display: inline-block;
width:293px;
height:293px;
}
.contents img{
display: block;
width:100%;
height:auto;
}
.line{
display: block;
width:100%;
height:293px;
}
.line a{
position:relative;

margin:0;
margin-right:28px;
}
.line a:LAST-CHILD {
margin:0;
}

.wrap{
width:293px;
height:293px;
display: inline-block;
}
.box{
display:none;
width:100%;
height:100%;
background:#545454;
opacity:0.5;
position: relative;
top: -293px;
left: 0;
height: 293px;
width: 293px;
}
.fBtn button:HOVER{
font-weight:600;
background:#999;
color:#fff;
cursor:pointer;
}
#none{
text-align: center;
margin:0 auto;
width:500px;
height:300px;
display: block;
}
.Container{
width:100%;
}
#pop{
display: block;
width:100%;
height:100%;
background:#000;
z-index:100;
position:absolute;
top:0;
left:0;
opacity:0.75;
}
#cancel{
display:inline-block;
position:inherit;
top:10px;
right:20px;
width:20px;
height:auto;
}
.popTable{
display: table;
background:#fff;
width:400px;
height:400px;
opacity:1;
margin:0 auto;
margin-top:150px;
}
.popArea{
width:100%;
height:100%;
position:absolute;
top:0;
left:0;
background:none;
z-index:1000;
}
.popTable header,.popTable div{
display: block;
width:100%;
border-bottom:1px solid #ff0000;
}
.popTable header{
height:40px;
}
.popTable div{
height:50px;
}
.popTable header span{
display: block;
margin:15px;
}
</style>

</head>

<body class="body">

<main>

   <article>

      <header class="profile">
         <div class="profileImg">
            <img src="/tmp/img/a.jpg"/>
         </div>
         <div class="profileInfo">
            <div>
               <h1>UserIDUserIDUserID</h1>
               <span class="fBtn"><button>프로필 편집</button></span>
               <span class="fBtn" id="write"><button>게시글 작성</button></span>
            </div>
            <div class="name info">UserName</div>
            <ul class="info">
               <li><span>게시물 <span class="number">0</span> 개</span></li>
               <li><a href="#"><span>팔로워 <span class="number">0</span> 명</span></a></li>
               <li><a href="#"><span>팔로우 <span class="number">0</span> 명</span></a></li>
            </ul>
         </div>
      </header>
      <div class="Container">
      	<!-- <div class="line">
      		<a href="#">
      			<div class="wrap">	
	      			<div class="contents"><img src="/tmp/img/0001.jpg"></div>
	      			<div class="box"></div>
      			</div>
      		</a>
      		<a href="#">
      			<div class="wrap">
	      			<div class="contents"><img src="/tmp/img/0002.jpg"></div>
	      			<div class="box"></div>
      			</div>
      		</a>
      		<a href="#">
      			<div class="wrap">
	      			<div class="contents"><img src="/tmp/img/0002.jpg"></div>
	      			<div class="box"></div>
      			</div>
      		</a>
      	</div> -->
      	
      	<div id="none">
      		<h2>소중한 순간을 포착하여 공유해보세요.</h2>
			<h3>첫 사진이나 동영상을 공유해보세요</h3>
			<a href="#"><img src="/tmp/img/plus.png"></a>
		</div>
      </div>


   </article>

</main>

<div id="pop">
	<img src="/tmp/img/cancel.png" id="cancel">
</div>
<div class="popArea">
	<div class="popTable">
		<header><span>팔로워</span></header>
		<div>d</div>
	</div>
</div>

</body>

</html>
    