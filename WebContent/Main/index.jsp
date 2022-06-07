<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>홈화면</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
	<form name=form>
		<br><h3 style="font-size:2em;text-align:center;font-weight:bold;">쇼핑몰 회원관리 프로그램</h3><br>
		<h5 style="font-size:1.3em; margin-left:3%;">쇼핑몰 회원정보와 회원매출정보 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.</h5>
		<h5 style="font-size:1.3em; margin-left:3%;">프로그램 작성 순서</h5><br>
		<ol>
			<li>회원정보 테이블을 생성한다.</li>
			<li>매출정보 테이블을 생성한다.</li>
			<li>상품정보 테이블을 생성한다.</li>
			<li>회원정보/매출정보/상품정보에서 제시된 참조데이터를 추가 생성한다.</li>
			<li>회원정보 입력 프로그램을 작성한다.</li>
			<li>회원정보 조회 프로그램을 작성한다.</li>
			<li>매출정보 입력 프로그램을 작성한다.</li>
			<li>매출정보 조회 프로그램을 작성한다.</li>
			<li>상품정보 입력 프로그램을 작성한다.</li>
			<li>상품정보 조회 프로그램을 작성한다.</li>
			<li>업무요건에 따라 프로그램을 작성한다.</li>
		</ol>
	</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>