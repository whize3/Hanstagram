<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<jsp:include page="../header.jsp" />
	
		<div id="mainview">
		<div align="center">
			<tr align="left">
				<table width="700">
					<thead>
						<tr align="left">
							<th width="200"></th>
							<th width="200">책번호</th>
							<th width="200">책제목</th>
							<th width="200">책위치</th>
							<th width="200">출판사</th>
							<th width="200">저자</th>
							<th width="200">분류</th>
							<th width="200">ISBN</th>
						</tr>
					</thead>
					<tbody>
						<td colspan="8"><hr color="black" /></td>
						<c:forEach items="${booklist}" var="k">
							<tr>
								<td>${k.s_url}</td>
								<td><a href="/HbLib/Controller?type=selectone&b_num=${k.b_num }">${k.b_num}>${k.b_num}</a></td>
								<td>${k.b_subject}</td>
								<td>${k.b_location}</td>
								<td>${k.publisher}</td>
								<td>${k.writer}</td>
								<td>${k.category}</td>
								<td>${k.ISBN}</td>
							</tr>
							<td colspan="8"></td>
							</tr>
						</c:forEach>

					</tbody>
					</div>
					</div>
					</div>
				</table>
</body>
</html>