<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp" %>
<%
	String custno=request.getParameter("custno");
	String custname=request.getParameter("custname");
	String phone=request.getParameter("phone");
	String address=request.getParameter("address");
	String joindate=request.getParameter("joindate");
	String grade=request.getParameter("grade");
	String city=request.getParameter("city");
	String[] good=request.getParameterValues("goods");
	String goods=null;
	if(good.length==1){
		goods=good[0];
	}else{
		for(int i=0; i<good.length;i++){
			if(goods==null){
				goods=good[i]+",";
			}else if(goods!=null&&i<good.length-1){
				goods=goods+good[i]+",";
			}else if(i==good.length-1){
				goods=goods+good[i];
			}
		}
	}
	try{
		sql="update member0607 set custname=?,phone=?,address=?,joindate=?,grade=?,city=?,goods=? where custno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(8, custno);
		pstmt.setString(1, custname);
		pstmt.setString(2, phone);
		pstmt.setString(3, address);
		pstmt.setString(4, joindate);
		pstmt.setString(5, grade);
		pstmt.setString(6, city);
		pstmt.setString(7, goods);
		pstmt.executeUpdate();
		pstmt.close();
%>
<script>
alert("회원정보 수정 성공\n회원 등록 화면으로 이동합니다.");
location.href="selectMember.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>