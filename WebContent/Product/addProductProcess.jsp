<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp" %>
<%
	String pcode=request.getParameter("pcode");
	String pname=request.getParameter("pname");
	String price=request.getParameter("price");
	String stockqty=request.getParameter("stockqty");
	try{
		sql="insert into product0607 values(?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, pcode);
		pstmt.setString(2, pname);
		pstmt.setString(3, price);
		pstmt.setString(4, stockqty);
		pstmt.executeUpdate();
%>
<script>
alert("상품 등록 성공");
location.href="selectMoney3.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>