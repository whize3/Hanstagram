<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		
	});
	/* $(document).on("click", ".test", function() {
		$(".myaccount").css({"display" : "inline"});
	}); 클릭했을때 개인정보 불러오는 function*/
</script>

</head>
<body>
<div>
<jsp:include page="header.jsp"/>
</div>
<div>
<jsp:include page="login.jsp"/>
<input type="button" value="test" class="test" />
</div>

</body>
</html>