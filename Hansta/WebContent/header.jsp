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
/* outline:none; */
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
</style>
</head>
<body class="body">
<nav>
	<div id="header">
		<div class="header">
		
			<a href="#" id="logoArea"><img src="/Hansta/img/headerLogo.PNG"></a>
			<div>
				<!-- <span class="searchMask"></span> --><input type="text" placeholder="검색">
			</div>
			<div id="iconArea"></div>
		</div>
	</div>
</nav>
</body>
</html>