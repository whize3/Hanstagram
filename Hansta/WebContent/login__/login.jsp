<%@page import="org.apache.cxf.transport.http.HTTPSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function go_manage_user() {
		window.open("user_list_view.do", "",
				"width=430, height=500, toolbar=no, scrollbar=yes");
	}
</script>
</head>
<body>
	<jsp:useBean id="vo" class="spring.project.db.UserVO" />
	<jsp:setProperty property="*" name="vo" />
	<c:choose>
		<c:when
			test="${vo.id == 'admin1' || vo.id == 'admin2' || vo.id == 'admin3' || vo.id == 'admin4' || vo.id == 'admin5'}">
			<script type="text/javascript">
				alert('${login_vo.id}');
			</script>
			<input type="button" onclick="go_manage_user()" value="회원 관리">
		</c:when>
		<c:otherwise>
				${login_vo.id } </br>
				${login_vo.name } </br>
			
		</c:otherwise>
	</c:choose>
</body>
</html>
