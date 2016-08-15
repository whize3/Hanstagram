<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="k" begin="0" end="5" items="${boardvo2}">
		<article class="a1"> 
			<header class="h1"> 
				<a class="profile" href="#"><img class="profile_img"
				src="https://scontent.cdninstagram.com/t51.2885-19/s150x150/12918039_230227960666719_282379501_a.jpg"></a>
				<a class="id" href="#">${k.id}</a> 
				<span class="date">${k.b_time.substring(0,16)}</span> 
			</header>
			<div class="image-wrap">
				<img class="image" src="upload/${k.img_url}.jpg" style="">				
			</div>
			<div class="comment-wrap">
				<div class="like"><span id="${k.b_idx }">좋아요 ${k.like_count}개</span></div>
				<div class="comment" id="comment_${k.b_idx }">
					<ul id="${k.b_idx }_ul">
					<c:set var="comment_cnt" value="0" />
					<c:forEach var="c" items="${commentvo}">
						<c:if test="${c.b_idx==k.b_idx }">
							<c:set var="comment_cnt" value="${comment_cnt+1 }" />
						</c:if>
					</c:forEach>
					<c:if test="${comment_cnt>5 }">
					<li><button class="showmore" b_idx="${k.b_idx}">댓글 더보기</button></li>
					</c:if>
						<c:set var="comment_cnt" value="0" />
						<c:forEach var="c" items="${commentvo}">
						<c:if test="${comment_cnt<5 }">
						<c:if test="${c.b_idx==k.b_idx}">
							<c:set var="comment_cnt" value="${comment_cnt+1 }" />
							<li id="${c.c_idx }_li"><a class="comment_id">${c.id}</a><span class="comment_content">${c.c_content}</span><c:if test="${c.id==user.id }"><span class="deletecomment" c_idx=${c.c_idx }>삭제</span></c:if></li>
						</c:if>
						</c:if>
						</c:forEach>
					</ul>
				</div>
				<div class="comment_all" id="comment_all_${k.b_idx }">
					<ul id="${k.b_idx }_ul" class="${k.b_idx }_ul">
						<c:set var="comment_cnt" value="0" />
						<c:forEach var="c" items="${commentvo}">
						<c:if test="${c.b_idx==k.b_idx}">
							<c:set var="comment_cnt" value="${comment_cnt+1 }" />
							<li id="${c.c_idx }_li"><a class="comment_id">${c.id}</a><span class="comment_content">${c.c_content}</span><c:if test="${c.id==user.id }"><span class="deletecomment" c_idx=${c.c_idx }>삭제</span></c:if></li>
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
					<input type="text" class="comment_write_content"  b_idx="${k.b_idx}" aria-label="댓글 달기..." placeholder="댓글 달기...">
				</div>
			</div>		
		</article>		
		</c:forEach>
</body>
</html>