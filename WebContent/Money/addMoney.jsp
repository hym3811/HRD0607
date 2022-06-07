<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매출 정보 등록</title>
</head>
<body>
<%@ include file="../Main/header.jsp" %>
<%@ include file="../Main/nav.jsp" %>
<section>
	<form name=form>
	<br><h3 style="text-align:center;font-size:2em;">매출 정보 등록 화면</h3><br>
	<table border=1 style="margin:0 auto;">
		<tr>
			<th>회원번호</th>
			<td></td>
		</tr>
		<tr>
			<th>판매번호</th>
			<td></td>
		</tr>
		<tr>
			<th>단가</th>
			<td></td>
		</tr>
		<tr>
			<th>수량</th>
			<td></td>
		</tr>
		<tr>
			<th>가격</th>
			<td></td>
		</tr>
		<tr>
			<th>상품코드</th>
			<td></td>
		</tr>
		<tr>
			<th>판매일자</th>
			<td></td>
		</tr>
	</table>
	</form>
</section>
<%@ include file="../Main/footer.jsp" %>
</body>
</html>