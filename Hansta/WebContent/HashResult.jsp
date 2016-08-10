<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
});
</script>
</head>

<body class="body">
<%-- <c:forEach var="k" items="${list }"> --%>
<%-- 		      			${k.b_idx } --%>
<%-- 		      			</c:forEach> --%>
${fn:length(list) } 
<main>

   <article>
      <div class="Container">
      	<div class="line">
      	
      	
      		<a href="#">
      			<div class="wrap">
	      			<div class="contents"><img src="/Hansta/img/0001.jpg"></div>
	      			<div class="box"></div>
	      			<span>
		      			<img src="/Hansta/img/bubble.png">
		      			<span></span>
		      			<img src="/Hansta/img/likeWhite.png">
		      			<span>0</span>
		      		</span>
      			</div>
      		</a>
      		
      		
      		<a href="#">
      			<div class="wrap">
	      			<div class="contents"><img src="/Hansta/img/0002.jpg"></div>
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
	      			<span>
		      			<img src="/Hansta/img/bubble.png">
		      			<span>0</span>
		      			<img src="/Hansta/img/likeWhite.png">
		      			<span>0</span>
		      		</span>
      			</div>
      		</a>
      	</div>
      	<div class="line">
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
	      			<span>
		      			<img src="/Hansta/img/bubble.png">
		      			<span>0</span>
		      			<img src="/Hansta/img/likeWhite.png">
		      			<span>0</span>
		      		</span>
      			</div>
      		</a>
      	</div>
      </div>


   </article>

</main>


</body>

</html>
    