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
		sql="insert into member0607 values(?,?,?,?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, custno);
		pstmt.setString(2, custname);
		pstmt.setString(3, phone);
		pstmt.setString(4, address);
		pstmt.setString(5, joindate);
		pstmt.setString(6, grade);
		pstmt.setString(7, city);
		pstmt.setString(8, goods);
		pstmt.executeUpdate();
		pstmt.close();
%>
<script>
alert("회원정보 등록 성공\n회원 등록 화면으로 이동합니다.");
location.href="addMember.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>