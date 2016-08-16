<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/Hansta/css/sue.css">
<script type="text/javascript" src="/Hansta/js/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		$(".wrap").hover(function() {
			$(this).find(".box").css("z-index", "100");
			$(this).find("span").css("z-index", "105");
		}, function() {
			$(this).find(".box").css("z-index", "-100");
			$(this).find("span").css("z-index", "-100");
		});

		$("#cancel0").click(function() {
			$(this).css("display", "none");
			$("#pop").css("display", "none");
			$(".detailArea").css("display", "none");
		});
		$("#cancel").click(function() {
			$(this).css("display", "none");
			$("#pop").css("display", "none");
			$(".popArea").css("display", "none");
		});
		$("#pop").click(function() {
			console.log("bye");
			$("#cancel").css("display", "none");
			$("#pop").css("display", "none");
			$(".popArea").css("display", "none");
			$(".detailArea").css("display", "none");
		});

		$("#follower")
				.click(
						function() {
							$("#cancel").css("display", "inline-block");
							$("#pop").css("display", "block");
							$(".popArea").css("display", "block");
							$("#followTitle").empty().text("팔로워");
							$
									.ajax({
										type : "post",
										url : "followerList.do",
										data : {
											"follower" : $("#followerId").val(),
											"followee" : $("#followeeId").val(),
											"flag" : "follower"
										},
										dataType : "json",
										success : function(data) {
											console.log("성공")
											$("#flist").empty();
											for (var i = 0; i < data.length; i++) {
												var str = "<a href='#'><img src='/Hansta/img/person.jpg'></a>"
												str += "<div><span class='personId'>";
												str += "<a href='#'>"
														+ "LeeSue"
														+ "</a></span>";
												str += "<span class='personName'>"
														+ "이수현"
														+ "</span></div>"
												str += "<button>팔로우</button></div>"

												$("<li>").html(str).appendTo(
														"#flist");
											}
										},
										error : function() {
											console.log("실패");
										}

									})
						});
		$(".wrap")
				.each(
						function() {
							$(this)
									.on(
											"click",
											function() {
												var b_idx = $(this).attr(
														"b_idx");
												var da_date = $(this).children(
														$("<span>")).children(
														".date").attr("date");
												var da_like = $(this).children(
														$("<span>")).children(
														".likecnt").text()
												$(".detailArea").css("display",
														"inline-block");
												$(".detailArea_like").text(
														da_like);
												$(".detailArea_date").text(
														da_date);
												$("#detailArea_comment_ul")
														.text("");
												$
														.ajax({
															type : "post",
															url : "timelinecomment.do",
															data : {
																"b_idx" : b_idx
															},
															dataType : "json",
															success : function(
																	data) {
																for (var i = 0; i < data.length; i++) {
																	$("<li>")
																			.html(
																					"<div><a href='#' class='name00'>"
																							+ data[i]["id"]
																							+ "</a>"
																							+ data[i]["c_content"]
																							+ "</div>")
																			.appendTo(
																					"#detailArea_comment_ul");
																}
															},
															error : function(
																	request,
																	status,
																	error) {
																alert("code:"
																		+ request.status
																		+ "\n"
																		+ "message:"
																		+ request.responseText
																		+ "\n"
																		+ "error:"
																		+ error);
															}
														});
											});
						});
	});
</script>
</head>

<body class="body">
	<input type="hidden" id="followerId" value="aaaa">
	<input type="hidden" id="followeeId" value="aaaa">
	<main> <article> <header class="profile">
	<div class="profileImg">
		<c:choose>
			<c:when test="${usersvo.profile_url == null }">
				<img src="/Hansta/img/default.jpg" />
			</c:when>
			<c:otherwise>
				<img src="${usersvo.profile_url }" />
			</c:otherwise>
		</c:choose>
	</div>
	<div class="profileInfo">
		<c:choose>
			<c:when test="${user.id eq usersvo.id }">
				<div>
					<h1>${user.id }</h1>
					<span class="fBtn"><button>프로필 편집</button></span> <span
						class="fBtn" id="write"><button>게시글 작성</button></span>
				</div>
			</c:when>
			<c:otherwise>
				<div>
					<h1>${usersvo.id }</h1>
					<!-- 팔로우 여부에 따라 다른 버튼 공개 -->
					<c:set var="fCnt" value="0" />
					<c:forEach var="k" items="${followervo }">
						<c:if test="${k.id eq user.id}">
							<c:set var="fCnt" value="${fCnt+1}" />
						</c:if>
					</c:forEach>
					<c:choose>
						<c:when test="${fCnt == 0 }">
							<span class="fBtn" id="ableFollow"><button
									onclick="location.href='follow.do?id=${user.id}&followeeId=${usersvo.id }'">팔로우</button></span>
						</c:when>
						<c:otherwise>
							<span class="fBtn" id="enableFollow"><button
									onclick="location.href='unfollow.do?id=${user.id}&followeeId=${usersvo.id }'">팔로잉</button></span>
						</c:otherwise>
					</c:choose>
				</div>
			</c:otherwise>
		</c:choose>

		<div class="name info">${usersvo.name }</div>
		<ul class="info">
			<li><span>게시물 <span class="number">${boardcount }</span>
					개
			</span></li>
			<li><a href="#" id="follower"><span>팔로워 <span
						class="number">${fn:length(followervo) }</span> 명
				</span></a></li>
			<li><a href="#" id="follow"><span>팔로우 <span
						class="number">${fn:length(followeevo) }</span> 명
				</span></a></li>
		</ul>
	</div>
	</header>
	<div class="Container">

		<!-- 게시글이 있는 경우, 한 라인당 3개씩 -->
		<c:set var="view" value="0" />
		<c:if test="${fn:length(boardvo)>0 }">

			<c:forEach var="k" items="${boardvo }">

				<c:choose>
					<c:when test="${view==0}">
						<div class="line">
					</c:when>


				</c:choose>
				<c:if test="${view>2 }">
					<c:choose>
						<c:when test="${view%3==0 }">
							<div class="line">
						</c:when>
					</c:choose>
				</c:if>
				<c:set var="view" value="${view+1 }" />
				<a href="#">
					<div class="wrap" b_idx="${k.b_idx }">
						<div class="contents">
							<img src="/Hansta/img/0001.jpg">
						</div>
						<div class="box"></div>
						<span> <img src="/Hansta/img/bubble.png"> <span
							class="date" date="${k.b_time.substring(0,16)}">${k.comment_count }</span>
							<img src="/Hansta/img/likeWhite.png"> <span class="likecnt">${k.like_count }개</span>
						</span>
					</div>
				</a>

				<c:if test="${view>2 }">
					<c:if test="${view%3==0 }">
	</div>
	</c:if> </c:if> </c:forEach> </c:if> <!-- 내 타임라인인데 게시물이 없는 경우 --> <!-- <div id="none">
      		<h2>소중한 순간을 포착하여 공유해보세요.</h2>
			<h3>첫 사진이나 동영상을 공유해보세요</h3>
			<a href="#"><img src="/Hansta/img/plus.png"></a>
		</div> --> <!-- 타인의 타임라인에 게시물이 없는 경우 --> <!-- 		<div id="none">
			<h3>아직 게시물이 없습니다.</h4>
		</div> -->
	</div>


	</article> </main>

	<!-- 팔로우 혹은 팔로워 리스트 -->
	<div id="pop"></div>
	<div class="popArea">

		<img src="/Hansta/img/cancel.png" id="cancel">
		<div class="popTable">
			<header>
			<span id="followTitle"></span></header>
			<ul id="flist">
				<c:forEach var="k" items="${followervo }">

					<li>
						<div class="person">
						<c:choose>
							<c:when test="${k.profile_url == null }">
								<a href="timeline.do?id=${k.id }"><img src="/Hansta/img/default.jpg" /></a>
							</c:when>
							<c:otherwise>
								<img src="${k.profile_url }" />
							</c:otherwise>
						</c:choose>
							<div>
								<span class="personId"><a href="#">${k.id }</a></span> <span
									class="personName">${k.name }</span>
							</div>
							<c:set var="sue" value="0" />
							<c:forEach var="s" items="${myfollowList }">
								<c:if test="${s.id == k.id}">
									<c:set var="sue" value="${sue+1}" />
								</c:if>
							</c:forEach>
							<c:choose>
								<c:when test="${sue eq 0 }">
									<button>팔로우</button>
								</c:when>
								<c:when test="${sue > 0}">
									<button>팔로잉</button>
								</c:when>
							</c:choose>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="detailArea">
		<img src="/Hansta/img/cancel.png" id="cancel0">
		<div class="contentsArea">
			<article>
			<div>
				<header> <a href="#"><img src="/Hansta/img/a.jpg"></a>
				<div class="name">
					<a href="">_suhyuneee</a>
				</div>
				<!-- 				<span><button class="follow">팔로우</button></span> --> <span><button
						class="following">팔로잉</button></span> </header>
				<div class="left">
					<img
						src="https://scontent.cdninstagram.com/t51.2885-15/e35/13687040_1563987130573588_1209261600_n.jpg?ig_cache_key=MTI5NzE4MTA0MzgyNDg2MTQ3Mg%3D%3D.2">
				</div>
				<div class="detailCon">
					<section id="info">
					<div>
						좋아요 <span class="detailArea_like">0개</span>
					</div>
					<div class="detailArea_date">날짜</div>
					</section>
					<ul id="detailArea_comment_ul">

						<li>
							<div>
								<a href="#" class="name00">username!</a> 늦어서
								미안합니다!!!!!!!!!!!!ㅠㅠㅠ <a href="#" class="hashTag">#해시태그는</a> 이렇게
								하까?
							</div>
						</li>
					</ul>
					<section id="comment"> <span><img
						src="/Hansta/img/littleLike.png"></span>
					<form>
						<input type="text" placeholder="댓글 달기...">
					</form>
					</section>
				</div>
			</div>
			</article>
		</div>

	</div>
</body>


</html>
