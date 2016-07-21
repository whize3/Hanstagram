<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/HbLib/css/mylibrary.css">
<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
function modify_go(f) {
	f.action = "/HbLib/Controller?type=qnamodify";
	f.submit();
}
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_02").css("background-color", "gray")
	});	
</script>
</head>
<body>
<jsp:useBean id="qna" class="com.hb.mybatis.QnaVO" scope="request"/>
<jsp:setProperty property="*" name="qna"/>
	<jsp:include page="../header.jsp" />
	<div class="mainArea">
		<div class="mainArea2">
			<jsp:include page="board_navi.jsp" />
			<div id="mainview">
				<div class="mainviewnavi">◆게시판> 공지사항</div>
				<div>
					<div align="center">
						<input type="hidden" class="id" value="${user.id}">
						<form method="post">
							<table width="300">
								<tbody>
									<tr>
										<th bgcolor="#B2EBF4">번호</th>
										<td id="q_idx">${qna.q_idx}</td>
									</tr>

									<tr>
										<th bgcolor="#B2EBF4">제목</th>
										<td id="qa_subject">${qna.qa_subject}</td>
									</tr>
									<tr>
										<th bgcolor="#B2EBF4">첨부파일</th>
									</tr>

									<tr>
										<th bgcolor="#B2EBF4">날짜</th>
										<td id="qa_date">${qna.qa_date}</td>
									</tr>
									<tr>
										<th bgcolor="#B2EBF4">내용</th>
									</tr>
									<tr>
										<td colspan="2"><pre id="qa_content">${qna.qa_content}</pre></td>
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
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>