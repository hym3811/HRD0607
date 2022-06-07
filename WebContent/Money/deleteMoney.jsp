<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp" %>
<%
	String custno=request.getParameter("custno");
	String saleno=request.getParameter("saleno");
	try{
		sql="delete from money0607 where custno=? and saleno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, custno);
		pstmt.setString(2, saleno);
		pstmt.executeUpdate();
%>
<script>
alert("custno: <%=custno%>\nsaleno: <%=saleno%>\n삭제 완료\n이전 페이지로 이동합니다.");
location.href="selectMoney.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>