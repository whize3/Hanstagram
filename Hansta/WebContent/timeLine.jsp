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
<style type="text/css">
.nonono{
display:none;
}
</style>
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
/* 
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
 */

	$("#follower").click(function(){
		$("#cancel").css("display","inline-block");
		$("#pop").css("display","block");
		$(".popArea").css("display","block");
		$("#followTitle").empty().text("팔로워");
		$.ajax({
			type:"post",
			url:"followerList.do",
			data:{
				"follower":$("#followerId").val(),
				"followee":$("#followeeId").val(),
				"flag":"follower"
				},
			dataType:"json",
			success:function(data){
				console.log("성공")
				$("#flist").empty();
				for(var i=0; i<data.length;i++){
					var str = "<a href='#'><img src='/Hansta/img/person.jpg'></a>"
					str += "<div><span class='personId'>";
					str += "<a href='#'>"+"LeeSue"+"</a></span>";
					str += "<span class='personName'>"+"이수현"+"</span></div>"
					str += "<button>팔로우</button></div>"
					
					$("<li>").html(str).appendTo("#flist");
				}
			},
			error:function(){
				console.log("실패");
			}
			
		})
	});
	$(".wrap").each(function(){
		 $(this).on("click", function(){
			 var b_idx = $(this).attr("b_idx");
			 var da_date = $(this).children($("<span>")).children(".date").attr("date");
			 var da_like = $(this).children($("<span>")).children(".likecnt").text()
			 var da_likestate = $("#likestate").val();
			 var uservoid = $("#uservoid").val();
			 $("#pop").css("display","inline-block");
			 $("#cancel0").css("display","inline-block");
			 $(".detailArea").css("display","inline-block");
			 $(".detailArea_like").text(da_like);
			 $(".detailArea_date").text(da_date);
			 $("#detailArea_comment_ul").text("");
			 $(".comment_write_content").attr("b_idx",b_idx);
			 $(".name").text();
			 $(".namediv").text(uservoid);
			 if(da_likestate==0){
				 $(".comment_write").append("<a class='heart_link'><img class='heart' b_idx='"+b_idx+"' src='img/like.PNG' onclick='like_go(this)'></a>");
			 }else{
				 $(".comment_write").append("<a class='heart_link'><img class='heart' b_idx='"+b_idx+"' src='img/liked.PNG' onclick='like_go(this)'></a>");
			 }
				$.ajax({
					type: "post",
					url: "timelinecomment.do",
					data: {"b_idx" : b_idx},
					dataType: "json",
					success: function(data){
						
						for(var i=0; i<data.length; i++){
							var liid=data[i]["c_idx"];
	                        $("<li>").attr("id",liid).html("<div><a href='#' class='name00'>"+data[i]["id"]+"</a>"+data[i]["c_content"]+"</div>").appendTo("#detailArea_comment_ul");
	                        $("<div>").attr("class","nonono").attr("id",liid+"_div").html(data[i]["id"]).appendTo("#"+liid);
		                        var aaa1 = $("#"+liid+"_div").html();
		                        var aaa2 = <c:out value="${user.id}"/>
		                        if(aaa1==aaa2){
		                        $("#"+liid).append("<span class='deletecomment' c_idx="+data[i]["c_idx"]+">삭제</span>");
		                        }
						}
						
						$(".deletecomment").each(function(){
							 $(this).on("click", function(){
								 var c_idx = $(this).attr("c_idx");
								 $.ajax({
										type: "post",
										url: "deletecomment.do",
										data: {"c_idx" : c_idx},
										dataType: "text",
										success: function(data){
											 $('#'+c_idx).text("")
											 $('#'+c_idx).contents().unwrap();
											 
										},
										error : function(request,status,error){
											alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
									    }
									});	
								
							 });
						});	
								 $(".heart").on("click",$(".comment_write>*"),function() {
										/* var index = $(".comment_write>a>img").index(this); */
										var src = $(this).attr("src");
										var b_idx = $(this).attr("b_idx");
										src = (src==="img/like.PNG")
										? "img/liked.PNG"
										: "img/like.PNG";		
										$(this).attr("src",src);	
										$.ajax({
											type: "post",
											url: "like.do",
											data: {"b_idx" : b_idx  , "id" : ${user.id}  },
											dataType: "json",
											success: function(data){
												alert("성공");
											},
											error : function(request,status,error){
												alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
										    }
										});	
									});	
					},
					error : function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    }
				});	
		 });
	});
						$(".comment_write_content").keyup(function(e) {
						    if (e.keyCode == 13){
						    	var index = $(".comment_write_content").index(this);	
						    	/* var index = $(".comment_write>a>img").index(this); */
						    	var c_content = $(this).val();
						    	var b_idx = $(this).attr("b_idx");
						    	var id = $(this).attr
						    	$.ajax({
									type: "post",
									url: "commentwrite.do",
									data: {"b_idx" : b_idx, "c_content" : c_content},
									dataType: "json",
									success: function(data){
										
									},
									error : function(request,status,error){
										alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								    }
								});	
						    };        
						});
							//좋아요 클릭 이벤트
							
});
</script>
</head>

<body class="body">
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
						class="fBtn" id="write"><button onclick="location.href='write.jsp?id=${user.id}'">게시글 작성</button></span>
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

		<!-- 내 타임라인인 경우 -->
		<!-- 게시글이 있는 경우, 한 라인당 3개씩 -->
<%-- 		<c:set var="view" value="0" />
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
 --%> 



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
	<c:choose>
		<c:when test="${fn:length(boardvo)>0}">
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
							<img src="${k.img_url}">
						</div>
						<div class="box"></div>
						<span>
						<img src="/Hansta/img/bubble.png">
						<span class="date" date="${k.b_time.substring(0,16)}">${k.comment_count }</span>
						<img src="/Hansta/img/likeWhite.png">
						<span class="likecnt">${k.like_count }개</span>
						<input type="hidden" id="likestate" value="${k.like_state }"/>
						</span>
					</div>
				</a>

				<c:if test="${view>2 }">
					<c:if test="${view%3==0 }">
						</div>
					</c:if>
				</c:if>
				
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:choose>
				<c:when test="${uservo.id eq user.id }">
					<div id="none">
			      		<h2>소중한 순간을 포착하여 공유해보세요.</h2>
						<h3>첫 사진이나 동영상을 공유해보세요</h3>
						<a href="#"><img src="/Hansta/img/plus.png"></a>
					</div>
				</c:when>
				<c:otherwise>
					<div id="none">
						<h3>아직 게시물이 없습니다.</h4>
					</div>
				</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>

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
	
	
	<!-- 여기 이후로는 합치기 성공 -->
	<div class="detailArea">
		<img src="/Hansta/img/cancel.png" id="cancel0">
		<div class="contentsArea">
			<article>
			<div>
				<header> <a href="#"><img src="/Hansta/img/a.jpg"></a>
				<div class="name">
					<a href="">_suhyuneee</a>
<!-- =======
				<div class="namediv">
					
>>>>>>> branch 'master' of https://github.com/whize3/Hanstagram.git -->
				
				</div>
				
				<!--<span><button class="follow">팔로우</button></span> -->
					<span><button class="following">팔로잉</button></span>
				</header>
						</div>
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
<!-- 					<section id="comment"> <span><img
						src="/Hansta/img/littleLike.png"></span>
					<form>
						<input type="text" placeholder="댓글 달기...">
					</form>
					</section>
					 -->
					<div class="comment_write">
					<input type="text" class="comment_write_content"  b_idx="1" aria-label="댓글 달기..." placeholder="댓글 달기...">
					</div>
				</div>
			</div>
			</article>
		</div>

	</div>
</body>


</html>
