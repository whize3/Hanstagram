<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/mylibrary.css">
<script type="text/javascript" src="../js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_05").css("background-color", "gray")
	});
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="mainArea">
		<div class="mainArea2">
			<jsp:include page="my_navi.jsp" />
			<div id="mainview">
				<div class="mainviewnavi">��My Library > ����ݳ��̷�</div>
				<div>
					<div class="mainview_c_btn">
						<input type="button" value="������Ȳ">
					</div>
					<div align="center">
						<table width="680">
							<thead>
								<tr align="left">
									<th width="250">����</th>
									<th width="150">����</th>
									<th width="130">������ȣ</th>
									<th width="150">�ݳ���</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="4"><hr color="black" /></td>
								</tr>
								<!-- for���ۤ� -->
								<tr>
									<td>���Ŀ�¯¯��</td>
									<td>���Ŀ�</td>
									<td>599</td>
									<td>2016-07-11</td>
								</tr>
								<tr>
									<td colspan="4"><hr /></td>
								</tr>
								<!-- for�� -->
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>