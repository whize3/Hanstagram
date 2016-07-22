<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/HbLib/css/mylibrary.css">
<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
function modify_go(f) {
	var login_id = "<c:out value="${user.id}" />";
	var writer = "<c:out value="${qna.id}" />";
	if(login_id===writer){
		f.action = "/HbLib/board/qnamodify.jsp";
		f.submit();
	}else{
		alert("권한이 없습니다.");
	}
}
function comment_go(f) {
	var login_id = "<c:out value="${user.id}" />";
	if(login_id===""){
		alert("로그인 해주세요");
	}else{
		f.action = "/HbLib/Controller?type=writeqcomment";
		f.submit();
	}
}
function delete_go(f) {
	var login_id = "<c:out value="${user.id}" />";
	var writer = "<c:out value="${qna.id}" />";
	if(login_id===writer){
		var chk = confirm("정말 삭제 하시겠습니까?")
		if(chk===true){
			f.action = "/HbLib/Controller?type=qnadelete";
			f.submit();	
		}else{
			return;
		}
		
	}else{
		alert("권한이 없습니다.");
	}
	
	
}
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_02").css("background-color", "gray")
	});	
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="mainArea">
		<div class="mainArea2">
			<jsp:include page="board_navi.jsp" />
			<div id="mainview">
				<div class="mainviewnavi">◆게시판> QNA</div>
				<div>
					<div align="center">
						<form method="post">
							<table width="300">
								<tbody>
									<input type="hidden" name="q_idx" value="${qna.q_idx}">			

									<tr>
										<th bgcolor="#B2EBF4">제목</th>
										<td ><input type="hidden" name="qa_subject" value="${qna.qa_subject}">${qna.qa_subject}</td>
									</tr>
									<tr>
										<th bgcolor="#B2EBF4">첨부파일</th>
									</tr>

									<tr>
										<th bgcolor="#B2EBF4">날짜</th>
										<td><input type="hidden" name="qa_date" value="${qna.qa_date}">${qna.qa_date}</td>
									</tr>
									<tr>
										<th bgcolor="#B2EBF4">조회수</th>
										<td ><input type="hidden" name="qa_hit" value="${qna.qa_hit}">${qna.qa_hit}</td>
									</tr>
									<tr>
										<th bgcolor="#B2EBF4">내용</th>
									</tr>
									<tr>
										<td colspan="2"><input type="hidden" name="qa_content" value="${qna.qa_content}"><pre>${qna.qa_content}</pre></td>
									</tr>
									
								</tbody>
								<tfoot>
									<tr>
										<td colspan="2"><input type="button" value="목록"
											onclick="javascript:location.href='Controller?type=qnalist'" /> 
											<input type="button" value="수정"
											onclick="modify_go(this.form)" /> <input type="button"
											value="삭제" onclick="delete_go(this.form)" /></td>
									</tr>
								</tfoot>
							</table>
						</form>
						<div class="q_comment">
							<c:forEach var="k" items="${qclist}">
								<p>ID: ${k.id}</p>
								<p>날짜: ${k.qc_date.substring(0,10)}</p>
								<p>내용: <pre>${k.qc_content}</pre></p>
							</c:forEach>		
						
						</div>
						<div class="q_comment_write">
							<form method="post" >
								<textarea rows="4" cols="55" name="qc_content"></textarea><br/>
								<input type="hidden" name="id" value="${user.id}"/>
								<input type="hidden" name="q_idx" value="${qna.q_idx}"/>
								<input type="button" value="댓글쓰기" onclick="comment_go(this.form)"/> 
							</form>
							<br/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>