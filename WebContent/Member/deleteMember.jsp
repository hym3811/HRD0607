<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp" %>
<%
	String custno=request.getParameter("custno");
	try{
		sql="delete from member0607 where custno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, custno);
		pstmt.executeUpdate();
%>
<script>
alert("회원번호: <%=custno%>\n삭제 성공");
location.href="selectMember.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>