<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href='https://fonts.googleapis.com/css?family=Maven+Pro' rel='stylesheet' type='text/css'>
<style type="text/css">
	.wrap{
		width: 100%;
		text-align: center;
		position: relative;
		display:table; 
		background: #FAFAFA;
	}
	.photoSel{
	
		position:relative;
		top:2px;
		margin-left: 20px;
		background: transparent;
		border: none;
		outline: none;
		font-size: 14px;
		color: #656565;
		
	}
	/* .photoSel:HOVER{
		color: #404040;
	} */
	.photoSelFile{
		position: relative;
    	top: -20px;
  		width: 70px;
		margin-left: 497px;
		cursor: pointer;
		opacity: 0;
		filter:alpha(opcity=0);
		-ms-filter:"alpha(opacity=0)";
		-khtml-opacity:0;
		-moz-opacity:0;
	}
	.photoSelFile:HOVER{
		/* 안됨 ㅎㅎ */
		cursor: pointer;
	}
	.share{
		background: transparent;
		border: none;
		outline: none;
		font-size: 17px;
		color: #424BD1;
		cursor: pointer;
	}
	.share:HOVER{
		color: #626BE4;
	}
	#share{
		display: table-cell;
		/* vertical-align: top; */
		padding-bottom: 20px;
		padding-left: 24px
	}
	.btn{
		display : table-cell;
		padding: 17px 0;
		height: 26px;		
	}
	#profileImg{
		border-radius: 50%;
		overflow: hidden;
		margin-right: 11px;
	}
	.left{
		width:230px;
		display: table-cell;
		/* vertical-align: top; */	
		border: 1px solid #EFEFEF;
	} 
	.right{
		width:700px;
		display: table-cell;
		vertical-align: middle;
		height: 630px;
		padding-top: 20px;
		padding-bottom: 20px;
		padding-left: 5px;
		padding-right: 5px;
		border: 1px solid #EFEFEF;
	}
	.profile{
		display: table;
		margin-bottom: 10px;
		padding-left: 11px;
		border-bottom: 1px solid #EFEFEF;
	}
	.profileImg{
		display: table-cell;
		margin-left: 99px;
	}
	.profileId{
		display: table-cell;
		vertical-align: middle;
		/* margin-left: 30px; */
	}
	.img{
		margin-left:5px;
		margin-right: 5px;
	}
	.wrap2{
		width: 930px;
		/* text-align: center; */
		margin: 0 auto;
	}
	.text{
		margin-top: 11px;
		padding-top:14px;
		border-top: 1px solid #EFEFEF;
	}
	.textarea{
		margin: 0px; 
		width: 319px; 
		height: 507px; 
		resize: none;
		border: 1px solid #EFEFEF;
		outline: none;
	}
	.share-1{
		display: table-cell;
		padding-right: 58px;
	}
	.share-2{
		display: table-cell;
		padding-right: 50px;
	}
	.share-3{
		display: table-cell;
	}
	.cancel{
		background: transparent;
		border: none;
		outline: none;
		font-size: 25px;
		color: #686868;
		cursor: pointer;
	}
	.cancel:HOVER {
		color: #989797;
	}
	ul{
		list-style: none;
	}
	li{
		display: list-item;
    	text-align: -webkit-match-parent;
	}
	ul>li>a{
		padding: 16px 16px 16px 30px;
	}
	.profile_bottom{
		display: table-row;
		margin: 0 auto;
	}
}
</style>
 <jsp:useBean id="uvo" class="spring.project.db.UsersVO" />
 <jsp:setProperty property="*" name="uvo"/> 
<script type="text/javascript">
	function share_go(f) {
		f.action="write.do";
		f.submit();
	}
	$(function(){ $('#jcrop_target').Jcrop(); });




</script>

</head>
<body>
	<div>
		<jsp:include page="header.jsp"/>
	</div>
	<div class="wrap">
		<div class="wrap2">
			<form id="imageUp" runat="server" method="post" enctype="multipart/form-data">
				<div class="left">
					
					<ul>
						<li>
							<a>프로필 편집</a>
						</li>
					</ul>
					
				</div>
				<div class="right">
				
					<div class="prWrap">
						<div class="profile">
							<div class="profileImg">
								<a class=""><img id="profileImg" class="jcrop_target" src="img/a.jpg" width="38px" height="38px"/></a>
<%-- 								<a class=""><img id="profileImg" class="jcrop_target" src="${uvo.profile_url}" width="38px" height="38px"/></a> --%>
							</div>
							<div class="profileId">
								<a style="font-family: 'Maven Pro', sans-serif; font-weight:bold; font-size: 15px; color: #656565">khee</a>
<%-- 								<a style="font-family: 'Maven Pro', sans-serif; font-weight:bold; font-size: 15px; color: #656565">${user.id }</a> --%>
							</div>
							<div class="btn">
								<input type="button" class="photoSel" value="파일 선택" />
								<input type="file" class="photoSelFile" name="photoSel" onchange="imageCheck(this);"/>
							</div>
						</div>
						<div class="profile_bottom">
							<label class="f_label">이름</label><input type="text" class="f_input" name="name"/><br/>
							<label class="f_label">사용자 이름</label><input type="text" class="f_input" name="id"/><br/>
							<label class="f_label">이메일</label><input type="text" class="f_input" name="email"/><br/>
							<label class="f_label">비밀번호</label><input type="password" class="f_input" name="pwd"/><br/>
							<label class="f_label">비밀번호 확인</label><input type="password" class="f_input" name="pwd"/><br/>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	
</body>
</html>