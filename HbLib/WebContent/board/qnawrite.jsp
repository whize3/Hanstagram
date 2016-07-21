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
function sendData(f) {
	
	f.submit();
}


</script>
</head>
<body>
<jsp:include page="../header.jsp" />
<div class="mainArea">
		<div class="mainArea2">
			<jsp:include page="board_navi.jsp" />
			<div id="mainview">
				<div class="mainviewnavi">◆게시판> QNA </div>
				<div>
					<div align="center">
						<form action="/HbLib/Controller?type=qnawrite" method="post" >
		<table border="1">
			<tr>
			<td bgcolor="#B2EBF4">제목</td>
				<td><input type="text" name="qa_subject"></td>
			</tr>
			<tr>
				<td bgcolor="#B2EBF4">내용</td>
				<td><textarea rows="10" cols="50" name="qa_content"></textarea>
				</td>
			</tr>
			<tr>
				<td bgcolor="#B2EBF4">첨부파일</td>
				<td><input type="file" name="filename"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="hidden" name="id" value="${user.id}"/>
				<input type="button" value="쓰기" onclick="sendData(this.form)" /> 
				<input type="reset" value="취소" />
				</td>
			</tr>

		</table>
	</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>