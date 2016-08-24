<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/Hansta/css/sue.css">
<style type="text/css">
.Container header{
width:100%;
text-align:center;
display: block;
height:72px;
}
.Container header h1{
font-weight:500;
font-size:34px;
line-height:10px;
}

.Container header h4{
line-height:10px;
font-weight:normal;
}
</style>
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
	
	<main> <article>

	<div class="Container">
	<header>
		<h1>${keyword }</h1>
		<h4>게시물 ${fn:length(list)} 개</h4>
	</header>
		<c:if test="${fn:length(list)>6 }">
			<h2 class="bnn">인기 게시물</h2>
			<c:if test="${fn:length(list) <10 }">
				<div class="line">
					<c:forEach var="k" items="${list_b }" end="2">
						<a href="#">
							<div class="wrap">
								<div class="contents">
									<img src="${k.img_url }" alt="이미지">
								</div>
								<div class="box"></div>
								<span> <img src="/Hansta/img/bubble.png"> <span>${k.b_idx }</span>
									<img src="/Hansta/img/likeWhite.png"> <span>${k.like_count }</span>
								</span>
							</div>
						</a>
					</c:forEach>
				</div>
			</c:if>

			<c:if test="${(fn:length(list) <15) && (fn:length(list) >=10) }">
				<div class="line">
					<c:forEach var="k" items="${list_b }" end="2">
						<a href="#">
							<div class="wrap">
								<div class="contents">
									<img src="${k.img_url }" alt="이미지">
								</div>
								<div class="box"></div>
								<span> <img src="/Hansta/img/bubble.png"> <span>${k.b_idx }</span>
									<img src="/Hansta/img/likeWhite.png"> <span>${k.like_count }</span>
								</span>
							</div>
						</a>
					</c:forEach>
				</div>
				<c:if test="${fn:length(list_b)>3 }">
				<div class="line">
					<c:forEach var="k" items="${list_b }" begin="3" end="5">
						<a href="#">
							<div class="wrap">
								<div class="contents">
									<img src="${k.img_url }" alt="이미지">
								</div>
								<div class="box"></div>
								<span> <img src="/Hansta/img/bubble.png"> <span>${k.b_idx }</span>
									<img src="/Hansta/img/likeWhite.png"> <span>${k.like_count }</span>
								</span>
							</div>
						</a>
					</c:forEach>
				</div>
				</c:if>
			</c:if>

			<c:if test="${fn:length(list) >=15 }">
				<div class="line">
					<c:forEach var="k" items="${list_b }" end="2">
						<a href="#">
							<div class="wrap">
								<div class="contents">
									<img src="${k.img_url }" alt="이미지">
								</div>
								<div class="box"></div>
								<span> <img src="/Hansta/img/bubble.png"> <span>${k.b_idx }</span>
									<img src="/Hansta/img/likeWhite.png"> <span>${k.like_count }</span>
								</span>
							</div>
						</a>
					</c:forEach>
				</div>
				<c:if test="${fn:length(list_b)>3 }">
				<div class="line">
					<c:forEach var="k" items="${list_b }" begin="3" end="5">
						<a href="#">
							<div class="wrap">
								<div class="contents">
									<img src="${k.img_url }" alt="이미지">
								</div>
								<div class="box"></div>
								<span> <img src="/Hansta/img/bubble.png"> <span>${k.b_idx }</span>
									<img src="/Hansta/img/likeWhite.png"> <span>${k.like_count }</span>
								</span>
							</div>
						</a>
					</c:forEach>
				</div>
				</c:if>
				<c:if test="${fn:length(list_b)>6 }">
				<div class="line">
					<c:forEach var="k" items="${list_b }" begin="6" end="8">
						<a href="#">
							<div class="wrap">
								<div class="contents">
									<img src="${k.img_url }" alt="이미지">
								</div>
								<div class="box"></div>
								<span> <img src="/Hansta/img/bubble.png"> <span>${k.b_idx }</span>
									<img src="/Hansta/img/likeWhite.png"> <span>${k.like_count }</span>
								</span>
							</div>
						</a>
					</c:forEach>
				</div>
				</c:if>
			</c:if>
		</c:if>
		<h2 class="bnn">최근 사진</h2>
		<c:set var="newidx" value="0" />
		<div class="line">
			<c:forEach var="k" items="${list }" begin="${newidx }"
				end="${newidx+2 }">
				<a href="#">
					<div class="wrap">
						<div class="contents">
							<img src="${k.img_url }" alt="${newidx }">
						</div>
						<div class="box"></div>
						<span> <img src="/Hansta/img/bubble.png"> <span>${k.b_idx }</span>
							<img src="/Hansta/img/likeWhite.png"> <span>${k.like_count }</span>
						</span>
					</div>
				</a>
			</c:forEach>
			<c:set var="newidx" value="${newidx+3 }" />
		</div>
		<div class="line">
			<c:forEach var="k" items="${list }" begin="${newidx }"
				end="${newidx+2 }">
				<a href="#">
					<div class="wrap">
						<div class="contents">
							<img src="${k.img_url }" alt="${newidx }">
						</div>
						<div class="box"></div>
						<span> <img src="/Hansta/img/bubble.png"> <span>${k.b_idx }</span>
							<img src="/Hansta/img/likeWhite.png"> <span>${k.like_count }</span>
						</span>
					</div>
				</a>
			</c:forEach>
			<c:set var="newidx" value="${newidx+3 }" />
		</div>
		<div class="line">
			<c:forEach var="k" items="${list }" begin="${newidx }"
				end="${newidx+2 }">
				<a href="#">
					<div class="wrap">
						<div class="contents">
							<img src="${k.img_url }" alt="${newidx }">
						</div>
						<div class="box"></div>
						<span> <img src="/Hansta/img/bubble.png"> <span>${k.b_idx }</span>
							<img src="/Hansta/img/likeWhite.png"> <span>${k.like_count }</span>
						</span>
					</div>
				</a>
			</c:forEach>
			<c:set var="newidx" value="${newidx+3 }" />
		</div>
		<c:if test="${fn:length(list)>newidx }">
		<div>더보기~</div>
		</c:if>
	</div>
	</div>
	</article> </main>


</body>

</html>
