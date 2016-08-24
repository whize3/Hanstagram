<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#con{
text-align:center;
}
.test99 {
    display: inline-table;
    border: 2px solid #ba32c7;
    border-radius: 50%;
    width: 115px;
    height: 115px;
    text-align: center;
    font-size: 10px;
    font-weight:normal;
}

.listshowmore{
	display: table-cell;
    vertical-align: middle;
    margin: 0 auto;
    cursor: pointer;
    color:#ba32c7;
}
.wrap {
	margin-top:25px;
	background-color: #fafafa;
}
.container{
	width: 40%;
	margin: 0 auto;
}
.a1{
	margin-bottom: 60px;
}
.h1 {
	height: 26px;
	padding: 14px 20px;
	vertical-align: middle;
}

.profile {
	border: 1px solid #dbdbdb;
	border-radius: 50%;
	box-sizing: border-box;
	display: block;
	height: 30px;
	overflow: hidden;
	width: 30px;
	float: left;
	margin-right: 10px;
}

.profile_img {
	height: 100%;
	width: 100%;
}


a{
text-decoration: none;
color:#262626;


}

.image-wrap{
	width: 100%;
}
.image{
	width: 100%;
}
article{
background-color:white;
border: 1px solid #efefef;
}
.date{
float: right;
    color: #999;
}
.like{
	color: #262626;
	display: inline-block;    
}
ul{
	list-style: none;
	padding-left: 0px;
}
button{
font-size:20px;
background:transparent;
color: #999;
border: none;
padding: 0px;
}
.showmore{
font-size:15px;
}
.comment-wrap{
padding-left: 25px;
padding-right: 25px;
}
.comment_id{
font-size: 15px;
font-weight: bold;
padding-right: 10px;
}
.comment_content{
font-size: 15px;
font-weight: normal;
}
.comment_write{
width:100%;
height:50px;
border-top:1px solid #efefef;
display: table;
}
.heart_link{
width:25px;
height:25px;

    vertical-align: middle;
    display: table-cell;
}
.heart{
width:25px;

}
.comment_write_content{
padding-left: 10px;
border: none;
    display: table-cell;
    vertical-align: middle;
        width: 300px;
    height: 30px;
    margin-top: 6px;
}
.comment_all{
display:none;
}
.hashAndcontent span{
font-weight:600;
display: inline-block;
}
._hash{
color:#003569;

}

</style>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
$(function() {
	//좋아요 클릭 이벤트
	$(".heart").on("click",$(".comment_write>*"),function() {
		/* var index = $(".comment_write>a>img").index(this); */
		var src = $(this).attr("src");
		var b_idx = $(this).attr("b_idx");
		var counttext;
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
						alert(data[0]["chk"]);
						counttext = $("#"+b_idx).text().substring(3,$("#"+b_idx).text().length-1);
						if(data[0]["chk"]=="삭제"){
						$("#"+b_idx).text("좋아요 "+(parseInt(counttext)-1)+"개");
						}else{
							$("#"+b_idx).text("좋아요 "+(parseInt(counttext)+1)+"개");
						}
			},
			error : function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});	
	});	
	
	//댓글 입력(엔터) 이벤트
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
					$("<li>").attr("id",data[0]["c_idx"]+"_li").html("<a class='comment_id'>"+${user.id}+"</a><span class='comment_content'>"+c_content+"</span><span class='deletecomment' c_idx="+data[0]["c_idx"]+">삭제</span>").appendTo("#"+b_idx+"_ul");
					$("<li>").attr("id",data[0]["c_idx"]+"_li").html("<a class='comment_id'>"+${user.id}+"</a><span class='comment_content'>"+c_content+"</span><span class='deletecomment' c_idx="+data[0]["c_idx"]+">삭제</span>").appendTo("."+b_idx+"_ul");
					$(".comment_write_content").val("");
					$(".deletecomment").each(function(){
						 $(this).on("click", function(){
							 var c_idx = $(this).attr("c_idx");
							 $.ajax({
									type: "post",
									url: "deletecomment.do",
									data: {"c_idx" : c_idx},
									dataType: "text",
									success: function(data){
										 $('#'+c_idx+'_li').text("")
										 $('#'+c_idx+'_li').contents().unwrap();
										 
									},
									error : function(request,status,error){
										alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								    }
								});	
							
						 });
					});	
				},
				error : function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			});	
	    };        
	});
	
	$(".deletecomment").each(function(){
		 $(this).on("click", function(){
			 var c_idx = $(this).attr("c_idx");
			 $.ajax({
					type: "post",
					url: "deletecomment.do",
					data: {"c_idx" : c_idx},
					dataType: "text",
					success: function(data){
						 $('#'+c_idx+'_li').text("")
						 $('#'+c_idx+'_li').contents().unwrap();
						 
					},
					error : function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    }
				});	
			
		 });
	});	
	$(".showmore").each(function(){
		 $(this).on("click", function(){
			 var b_idx = $(this).attr("b_idx");
			 $("#comment_"+b_idx).css("display","none");
			 $("#comment_all_"+b_idx).css("display","block");
		 });
	});	
	
	
	$(".listshowmore").each(function(){
		 $(this).on("click", function(){
			var pagenum = $(this).attr("pagenum");
			var pagenum2 = Number(pagenum)+1;
	    	$.ajax({
				type: "post",
				url: "newsfeedmore.do",
				data: {"pagenum" : pagenum},
				dataType: "json",
				success: function(data){
					alert("성공");
					$(".listshowmore").attr("pagenum",pagenum2);
					var b_idx;
					for(var i=0; i<data.length;i++){
						 b_idx = data[i]["b_idx"];
					$(".container").append(
							"<article class='a1'>"
							+"<header class='h1'>"
							+"<a class='profile' href='timeline.do?id="+data[i]["id"]+"'><img class='profile_img' src='https://scontent.cdninstagram.com/t51.2885-19/s150x150/12918039_230227960666719_282379501_a.jpg'></a>"
							+"<a class='id' href='timeline.do?id="+data[i]["id"]+"'>"+data[i]["id"]+"</a>"
							+"<span class='date'>"+data[i]["b_time"].substring(0,16)+"</span>"
							+"</header>"
							+"<div class='image-wrap'>"
							+"<img class='image' src='"+data[i]["img_url"]+"' style=''>"
							+"</div>"
							+"<div class='comment-wrap'>"
							+"<div class='like'><span id='"+data[i]["b_idx"]+"'>좋아요 "+data[i]["like_count"]+"개</span></div>"
							+"<div class='comment' id='comment_"+data[i]["b_idx"]+"'>"
							+"<ul id='"+data[i]["b_idx"]+"_ul'>"
							+"</ul>"
							+"</div>"
							+"<div class='comment_all' id='comment_all_"+data[i]["b_idx"]+"'>"
							+"<ul id='"+data[i]["b_idx"]+"_ul' class='"+data[i]["b_idx"]+"_ul'>"
							+"</ul>"
							+"</div>"
							+"<div class='comment_write' id='"+data[i]["b_idx"]+"_cw'>"
							+"</div>"
							+"</div>"
							+"</article>"
					);
					if(data[i]["like_state"]==0){
						$("#"+data[i]["b_idx"]+"_cw").append("<a class='heart_link'><img class='heart' b_idx='"+data[i]["b_idx"]+"' src='img/like.PNG' onclick='like_go(this)'></a>");
					}else{
						$("#"+data[i]["b_idx"]+"_cw").append("<a class='heart_link'><img class='heart' b_idx='"+data[i]["b_idx"]+"' src='img/liked.PNG' onclick='like_go(this)'></a>");
					}
					$("#"+data[i]["b_idx"]+"_cw").append("<input type='text' class='comment_write_content'  b_idx='"+data[i]["b_idx"]+"' aria-label='댓글 달기...' placeholder='댓글 달기...'>");
					$.ajax({
						type: "post",
						url: "newsfeedmorec.do",
						data: {"b_idx" : b_idx},
						dataType: "json",
						success: function(data){
							if(data.length>5){
								$("<li>").html("<button class='showmore' b_idx='"+data[0]["b_idx"]+"'>댓글 더보기</button>").appendTo("#"+data[0]["b_idx"]+"_ul");
								for(var i=0; i<6; i++){
									$("<li>").attr("id",data[i]["c_idx"]+"_li").html("<a class='comment_id'>"+data[i]["id"]+"</a><span class='comment_content'>"+data[i]["c_content"]+"</span>"+data[i]["delete"]).appendTo("#"+data[0]["b_idx"]+"_ul");
									}
								for(var i=0; i<data.length; i++){
									$("<li>").attr("id",data[i]["c_idx"]+"_li").html("<a class='comment_id'>"+data[i]["id"]+"</a><span class='comment_content'>"+data[i]["c_content"]+"</span>"+data[i]["delete"]).appendTo("."+data[0]["b_idx"]+"_ul");
									}
							}else{for(var i=0; i<data.length; i++){
							$("<li>").attr("id",data[i]["c_idx"]+"_li").html("<a class='comment_id'>"+data[i]["id"]+"</a><span class='comment_content'>"+data[i]["c_content"]+"</span>"+data[i]["delete"]).appendTo("#"+data[0]["b_idx"]+"_ul");
							}
							}
							$(".showmore").each(function(){
								 $(this).on("click", function(){
									 var b_idx = $(this).attr("b_idx");
									 $("#comment_"+b_idx).css("display","none");
									 $("#comment_all_"+b_idx).css("display","block");
								 });
							});	
							$(".deletecomment").each(function(){
								 $(this).on("click", function(){
									 var c_idx = $(this).attr("c_idx");
									 $.ajax({
											type: "post",
											url: "deletecomment.do",
											data: {"c_idx" : c_idx},
											dataType: "text",
											success: function(data){
												 $('#'+c_idx+'_li').text("")
												 $('#'+c_idx+'_li').contents().unwrap();
												 
											},
											error : function(request,status,error){
												alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
										    }
										});	
									
								 });
							});	
							
						},
						error : function(request,status,error){
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					    }
					});
					}
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
									$("<li>").attr("id",data[0]["c_idx"]+"_li").html("<a class='comment_id'>"+${user.id}+"</a><span class='comment_content'>"+c_content+"</span><span class='deletecomment' c_idx="+data[0]["c_idx"]+">삭제</span>").appendTo("#"+b_idx+"_ul");
									$("<li>").attr("id",data[0]["c_idx"]+"_li").html("<a class='comment_id'>"+${user.id}+"</a><span class='comment_content'>"+c_content+"</span><span class='deletecomment' c_idx="+data[0]["c_idx"]+">삭제</span>").appendTo("."+b_idx+"_ul");
									$(".comment_write_content").val("");
									$(".deletecomment").each(function(){
										 $(this).on("click", function(){
											 var c_idx = $(this).attr("c_idx");
											 $.ajax({
													type: "post",
													url: "deletecomment.do",
													data: {"c_idx" : c_idx},
													dataType: "text",
													success: function(data){
														 $('#'+c_idx+'_li').text("")
														 $('#'+c_idx+'_li').contents().unwrap();
														 
													},
													error : function(request,status,error){
														alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
												    }
												});	
											
										 });
									});	
								},
								error : function(request,status,error){
									alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							    }
							});	
					    };        
					});
					$(".heart").on("click",$(".comment_write>*"),function() {
						/* var index = $(".comment_write>a>img").index(this); */
						var src = $(this).attr("src");
						var b_idx = $(this).attr("b_idx");
						var counttext;
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
										alert(data[0]["chk"]);
										counttext = $("#"+b_idx).text().substring(3,$("#"+b_idx).text().length-1);
										if(data[0]["chk"]=="삭제"){
										$("#"+b_idx).text("좋아요 "+(parseInt(counttext)-1)+"개");
										}else{
											$("#"+b_idx).text("좋아요 "+(parseInt(counttext)+1)+"개");
										}
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
	
	
	
// 		$(".listshowmore").each(function(){
// 		 $(this).on("click", function(){
// 			var cPage = $(this).attr("cPage");
// 			alert("gdgd");
// 			 $(".test99").html("<c:forEach var='k' begin='6' end='11' items='${boardvo}'><article class='a1'><header class='h1'><a class='profile' href='#'><img class='profile_img' src='https://scontent.cdninstagram.com/t51.2885-19/s150x150/12918039_230227960666719_282379501_a.jpg'></a><a class='id' href='#'>${k.id}</a><span class='date'>${k.b_time.substring(0,16)}</span></header><div class='image-wrap'><img class='image' src='upload/${k.img_url}.jpg' style=''></div><div class='comment-wrap'><div class='like'><span id='${k.b_idx }'>좋아요 ${k.like_count}개</span></div><div class='comment' id='comment_${k.b_idx }'><ul id='${k.b_idx }_ul'><c:set var='comment_cnt' value='0' /><c:forEach var='c' items='${commentvo}'><c:if test='${c.b_idx==k.b_idx }'><c:set var='comment_cnt' value='${comment_cnt+1 }' /></c:if></c:forEach><c:if test='${comment_cnt>5 }'><li><button class='showmore' b_idx='${k.b_idx}'>댓글 더보기</button></li></c:if><c:set var='comment_cnt' value='0' /><c:forEach var='c' items='${commentvo}'><c:if test='${comment_cnt<5 }'><c:if test='${c.b_idx==k.b_idx}'><c:set var='comment_cnt' value='${comment_cnt+1 }' /><li id='${c.c_idx }_li'><a class='comment_id'>${c.id}</a><span class='comment_content'>${c.c_content}</span><c:if test='${c.id==user.id }'><span class='deletecomment' c_idx=${c.c_idx }>삭제</span></c:if></li></c:if></c:if></c:forEach></ul></div><div class='comment_all' id='comment_all_${k.b_idx }'><ul id='${k.b_idx }_ul' class='${k.b_idx }_ul'><c:set var='comment_cnt' value='0' /><c:forEach var='c' items='${commentvo}'><c:if test='${c.b_idx==k.b_idx}'><c:set var='comment_cnt' value='${comment_cnt+1 }' /><li id='${c.c_idx }_li'><a class='comment_id'>${c.id}</a><span class='comment_content'>${c.c_content}</span><c:if test='${c.id==user.id }'><span class='deletecomment' c_idx=${c.c_idx }>삭제</span></c:if></li></c:if></c:forEach></ul></div><div class='comment_write'><c:choose><c:when test='${k.like_state==0}'><a class='heart_link'><img class='heart' b_idx='${k.b_idx}' src='img/like.PNG' onclick='like_go(this)'></a></c:when><c:when test='${k.like_state==1}'><a class='heart_link'><img class='heart' b_idx='${k.b_idx}' src='img/liked.PNG' onclick='like_go(this)'></a></c:when></c:choose><input type='text' class='comment_write_content'  b_idx='${k.b_idx}' aria-label='댓글 달기...' placeholder='댓글 달기...'></div></div></article></c:forEach><div class='test99'><c:if test='${fn:length(boardvo)>6 }'><h2 class='listshowmore' cPage='2'>더보기</h2></c:if></div>")
// 			 $(".test99").contents().unwrap();
// 			//$(".test99").html("<c:forEach var='k' begin='6' end='11' items='${boardvo}'><article class='a1'><header class='h1'><a class='profile' href='#'><img class='profile_img' src='https://scontent.cdninstagram.com/t51.2885-19/s150x150/12918039_230227960666719_282379501_a.jpg'></a><a class='id' href='#'>${k.id}</a><span class='date'>${k.b_time.substring(0,16)}</span></header><div class='image-wrap'><img class='image' src='upload/${k.img_url}.jpg' style=''></div><div class='comment-wrap'><div class='like'><span id='${k.b_idx }'>좋아요 ${k.like_count}개</span></div><div class='comment' id='comment_${k.b_idx }'><ul id='${k.b_idx }_ul'><c:set var='comment_cnt' value='0' /><c:forEach var='c' items='${commentvo}'><c:if test='${c.b_idx==k.b_idx }'><c:set var='comment_cnt' value='${comment_cnt+1 }' /></c:if></c:forEach><c:if test='${comment_cnt>5 }'><li><button class='showmore' b_idx='${k.b_idx}'>댓글 더보기</button></li></c:if><c:set var='comment_cnt' value='0' /><c:forEach var='c' items='${commentvo}'><c:if test='${comment_cnt<5 }'><c:if test='${c.b_idx==k.b_idx}'><c:set var='comment_cnt' value='${comment_cnt+1 }' /><li id='${c.c_idx }_li'><a class='comment_id'>${c.id}</a><span class='comment_content'>${c.c_content}</span><c:if test='${c.id==user.id }'><span class='deletecomment' c_idx=${c.c_idx }>삭제</span></c:if></li></c:if></c:if></c:forEach></ul></div><div class='comment_all' id='comment_all_${k.b_idx }'><ul id='${k.b_idx }_ul' class='${k.b_idx }_ul'><c:set var='comment_cnt' value='0' /><c:forEach var='c' items='${commentvo}'><c:if test='${c.b_idx==k.b_idx}'><c:set var='comment_cnt' value='${comment_cnt+1 }' /><li id='${c.c_idx }_li'><a class='comment_id'>${c.id}</a><span class='comment_content'>${c.c_content}</span><c:if test='${c.id==user.id }'><span class='deletecomment' c_idx=${c.c_idx }>삭제</span></c:if></li></c:if></c:forEach></ul></div><div class='comment_write'><c:choose><c:when test='${k.like_state==0}'><a class='heart_link'><img class='heart' b_idx='${k.b_idx}' src='img/like.PNG' onclick='like_go(this)'></a></c:when><c:when test='${k.like_state==1}'><a class='heart_link'><img class='heart' b_idx='${k.b_idx}' src='img/liked.PNG' onclick='like_go(this)'></a></c:when></c:choose><input type='text' class='comment_write_content'  b_idx='${k.b_idx}' aria-label='댓글 달기...' placeholder='댓글 달기...'></div></div></article></c:forEach><div class='test99'><c:if test='${fn:length(boardvo)>6 }'><h2 class='listshowmore' cPage='2'>더보기</h2></c:if></div>");
// 	    });        
// 	});
	
	
}); 
</script>
</head>
<body>
<jsp:useBean id="boardvo2" scope="page" class="spring.project.db.BoardVO"/>
<jsp:setProperty property="*" name="boardvo2"/>
<jsp:include page="header.jsp"></jsp:include>
<c:set var="pagenum" value="0" />
<div class="wrap">
	<div class="container">
	<c:set var="nowcnt" value="6"/>
	<c:choose>
		<c:when test="${fn:length(boardvo)==0 }">
			<h2 style="margin-top:250px;">친구를 팔로우하거나, 게시글을 등록해주세요</h2>
		</c:when>
		<c:otherwise>
		<c:forEach var="k" begin="0" end="${fn:length(boardvo) }" items="${boardvo}">
		<article class="a1"> 
			<header class="h1"> 
				<a class="profile" href="timeline.do?id=${k.id }"><img class="profile_img"
				src="https://scontent.cdninstagram.com/t51.2885-19/s150x150/12918039_230227960666719_282379501_a.jpg"></a>
				<a class="id" href="timeline.do?id=${k.id }">${k.id}</a> 
				<span class="date">${k.b_time.substring(0,16)}</span> 
			</header>
			<div class="image-wrap">
				<img class="image" src="${k.img_url}" style="">				
			</div>
			<div class="comment-wrap">
				<div class="like"><span id="${k.b_idx }">좋아요 ${k.like_count}개</span></div>
				<div class="hashAndcontent">
					<div>
						<span>${k.id}</span>
						<% pageContext.setAttribute("LF", "\n"); %>
						
						<c:set var="str" value="${fn:replace(k.b_content, LF,'<br/>') }"/>
						<c:forTokens var="hash" items="${str}" delims="#">
						<c:set var="tokenCnt" value="1"></c:set>
							<c:forTokens var="token" items="${hash}" delims=" ">
								<c:choose>
									<c:when test="${tokenCnt==1 }"><a href="hashlist.do?keyword=${token }" class="_hash">#${token}</a></c:when>
									<c:otherwise>${token}</c:otherwise>
								</c:choose>
								<c:set var="tokenCnt" value="${tokenCnt+1 }"/>
							</c:forTokens>
						</c:forTokens>
						<%-- <c:forEach var="c" items="${k.b_content}">
							
						</c:forEach> --%>
					</div>
				</div>
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
			</c:otherwise>
		</c:choose>
	</div>
	<div id="con">
		<div class="test99">
		<h2 class="listshowmore" pagenum="2">더 읽어들이기</h2>
		</div>
	</div>
</div>

</body>
</html>