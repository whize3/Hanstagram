<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/HbLib/css/mylibrary.css">
<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		
	});	
</script>

<style type="text/css">
 
 
#div1 {
    list-style-type: none;
    padding: 0;
}

#div1 {
    float: left;
    max-width: 160px;
    margin: 0;
    padding: 1em;
}

#div2 {
    list-style-type: none;
    padding: 0;
}

#div2 {
    float: left;
    max-width: 160px;
    margin: 0;
    padding: 1em;
}


</style>
<title>Insert title here</title>
</head>
<body>
 <%

	String b_num = request.getParameter("b_num");
	String b_subject = request.getParameter("b_subject");
	String b_location = request.getParameter("b_location");
	String publisher = request.getParameter("publisher");
	String writer = request.getParameter("writer");
	String category = request.getParameter("category");
	String ISBN = request.getParameter("ISBN");
	String L_url = request.getParameter("L_url");
	System.out.println(L_url);
 
 %>
 		
 		<jsp:include page="../header.jsp" />
 	
 	 	
				 
				 <div id="div1">
				 <li><img src="<%=L_url%>"></li>	
				</div>
				
				
				<div id="div2">
					<li><%=b_num %></li>
					<li><%=b_subject %></li>
					<li><%=b_location %></li>
					<li><%=publisher %></li>
					<li><%=writer %></li>
					<li><%=category %></li>
					<li><%=ISBN %></li>
				
				</div>
				
				
				


<%-- 


 	 				<tr>
 	 				 <td>
 	 				  <table align="center" width="100px">
 	 				  	<tbody align="center">
 	 				  		<td>분류<%=category %></td>
 	 				  	</tr>
 	 				  	
 	 				  	 <br />
 	 				  	
 	 				  	<td>저자<%=writer%></td>
 	 				  	 </tr>
 	 				  	
 	 				  	 <tr>
 	 				  	 <br/>
 	 				  	
 	 				  	 <td>번호	<%=b_num %></td>
 	 				  	 </tr>
 	 				  	
 	 				  	 <td>제목<%=b_subject %></td>
 	 				  	 <br/>
 	 				  	 </tr>
 	 				  	 
 	 				  	 <td>출판사<%=publisher %></td>
 	 				  	 <br/>
 	 				  	 </tr>			  	
 	 				  	 
 	 				  	 <td>위치<%=b_location %></td>
 	 				  	 <br/>
 	 				  	 </tr>
 	 				  	 
 	 				  	 <td>ISBN<%=ISBN %></td>
 	 				  	 <br/>
 	 				  	 </tr>
 	 				  	 
 	 				  	</tbody>
 	 				  
 	 				  </table>
 	 			
 --%> 	 	
 	 	
 	 		
 	 	
 	 	
 	 	
 	 	
 	 	
 	 	
 
  
  	  
		
</body>

</html>