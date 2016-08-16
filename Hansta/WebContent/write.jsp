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
		margin-left: 497px;
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
		padding: 17px 0;
		height: 26px;		
	}
	#profileImg{
		border-radius: 50%;
		overflow: hidden;
		margin-right: 11px;
	}
	.left{
		display: table-cell;
		/* vertical-align: top; */	
		border: 1px solid #EFEFEF;
	} 
	.right{
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
	}
	.profileImg{
		display: table-cell;
		
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
		width: 1000px;
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
	
}
</style>
<script type="text/javascript">
	function share_go(f) {
		f.action="write.do";
		f.submit();
	}

	function imageCheck(input) {
		
		
		if(input.files&&input.files[0]){
			var reader = new FileReader();
			reader.onload=function(e){
				$('#preview').attr('src',e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
		
	
	}
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
					
					<div class="btn">
						<input type="button" class="photoSel" value="파일 선택" />
						<input type="file" class="photoSelFile" name="photoSel" onchange="imageCheck(this);"/>
						
						
					</div>
					        
					<div class="img">
						<div style="border: 1px solid #EFEFEF">
							<img src="img/imgSel.png" id="preview" width="600px" height="600px"/>
						</div>
					</div>
					
				</div>
				<div class="right">
					<div id="share">
						<div class="share-1"><input type="button" class="cancel" name="cancel" value="<"/></div>
						<a class="share-2">새 게시물</a>
						<div class="share-3"><input type="button" class="share" onclick="share_go(this.form)" value="공유하기"/></div>
						
					</div>
					<div class="prWrap">
						<div class="profile">
							<div class="profileImg">
								<a class=""><img id="profileImg" src="img/a.jpg" width="38px" height="38px"/></a>
							</div>
							<div class="profileId">
								<a style="font-family: 'Maven Pro', sans-serif; font-weight:bold; font-size: 15px; color: #656565">kheehyun93</a>
							</div>
						</div>
						<div class="text">
							<textarea class="textarea" name="b_content" rows="30" cols="20" placeholder="설명 쓰기.."></textarea>
							<!-- <input type="text" placeholder="설명 쓰기.." style="width: 300px; height: 500px" /> -->
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	
</body>
</html>