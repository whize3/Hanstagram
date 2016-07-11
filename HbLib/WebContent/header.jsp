<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	li{
		list-style: none;
	}
	nav{
		display:block;
		width:100%;
		border-bottom:1px solid #C1C0BD;
		paddin:0;
	}
	header{
		display:block;
		width:100%;
		
	}
	
	/* 최상단 */
	.topArea{
		width:100%;
		height:15px;
		display:block;
		border-bottom: 1px solid #f4f4f4;
	}
	
	/* 검색바 */
	#keyword{
		position:relative;
		bottom:10px;
		left:10px;
		border:0;
		outline: none;
		width:390px;
		height:20px;
		font-size:15px;
	}
	#searchBtn{
		position:relative;
		right:-58px;
		background:url(img/searchBtn.png) no-repeat;
		background-size:25px;
		border:0;
		width:30px;
		height:30px;
		display:inline;
	}
	#searchBar{
		width:480px;
		height:30px;
		display:block;
		margin:0 auto;
		margin-top:20px;
		border-bottom: 3px solid #052efc;
	}
	
	#searchArea{
		
	}
	
	/* 네비 */
	
	ul#mainNav{
		display:block;
		width:960px;
		/* border:1px solid #000; */
		margin:0 auto;
		height:25px;
		padding-top:45px;
		padding-left:0px;
		margin-bottom:5px;
		
	}
	ul#mainNav .firstMenu{
		display:inline-block;
		float:left;
		width:240px;
		text-align:center;
		margin:0 auto;
		/* border:1px solid red; */
	}
	ul#mainNav .firstMenu ul{
		display:none;
	}
	.firstMenu:hover{
		color:#052efc;
		font-weight:bolder;
	}
	ul#mainNav .firstMenu:hover ul{
		display:block;
		position:relative;
		top:15px;
		width:234px;
		border:2px solid #3cbf80;
		
	}
</style>
</head>
<body>
<header>
	<div class="topArea"></div>
	<div id="searchBar">
		<div id="searchArea">
			<form action="">
				<input type="text" id="keyword" placeholder="검색할 도서정보를 입력하세요">
				<input type="button" id="searchBtn">
			</form>
		</div>
	</div>
	<nav>
		<ul id="mainNav">
			<li class="firstMenu">자료검색</li>
			<li class="firstMenu">전자자료
				<ul>
					<li></li>
					<li>두울</li>
					<li>두울</li>
					<li>두울</li>
				</ul>
			</li>
			<li class="firstMenu">My Library
				<ul>
					<li>두울</li>
					<li>두울</li>
					<li>두울</li>
					<li>두울</li>
				</ul>
			</li>
			<li class="firstMenu">도서관 안내</li>
		</ul>
	</nav>
</header>
</body>
</html>