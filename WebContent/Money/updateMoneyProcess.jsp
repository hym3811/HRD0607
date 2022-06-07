<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp" %>
<%
	String custno=request.getParameter("custno");
	String saleno=request.getParameter("saleno");
	String pcost=request.getParameter("pcost");
	Integer amount=Integer.parseInt(request.getParameter("amount"));
	String price=request.getParameter("price");
	String pcode=request.getParameter("pcode");
	String sdate=request.getParameter("sdate");
	String code=null;
	Integer amount2=0;//기존 수량
	Integer stockqty=0;//기존 재고
	Integer qty=0;//신규 재고
	try{
		sql="select pcode,amount from money0607 where custno=? and saleno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, custno);
		pstmt.setString(2, saleno);
		rs=pstmt.executeQuery();
		if(rs.next()){
			code=rs.getString(1);
			amount2=rs.getInt(2);
		}pstmt.close();
		if(pcode.equals(code)){
			sql="update money0607 set amount=?,price=? where custno=? and saleno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, amount);
			pstmt.setString(2, price);
			pstmt.setString(3, custno);
			pstmt.setString(4, saleno);
			pstmt.executeUpdate();
			pstmt.close();
			
			sql="select stockqty from product0607 where pcode=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pcode);
			rs=pstmt.executeQuery();
			if(rs.next()){
				stockqty=rs.getInt(1);
			}pstmt.close();
			
			sql="update product0607 set stockqty=? where pcode=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, stockqty+amount2-amount);
			pstmt.setString(2, pcode);
			pstmt.executeUpdate();
			pstmt.close();
		}else{
			sql="select stockqty from product0607 where pcode=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, code);
			rs=pstmt.executeQuery();
			if(rs.next()){
				stockqty=rs.getInt(1);
			}pstmt.close();
			
			sql="update product0607 set stockqty=? where pcode=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, stockqty+amount2);
			pstmt.setString(2, code);
			pstmt.executeUpdate();
			pstmt.close();
			
			sql="select stockqty from product0607 where pcode=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pcode);
			rs=pstmt.executeQuery();
			if(rs.next()){
				stockqty=rs.getInt(1);
			}pstmt.close();
			
			sql="update product0607 set stockqty=? where pcode=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, stockqty-amount);
			pstmt.setString(2, pcode);
			pstmt.executeUpdate();
			pstmt.close();
			
			sql="update money0607 set pcode=?,amount=?,price=? where custno=? and saleno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pcode);
			pstmt.setInt(2, amount);
			pstmt.setString(3, price);
			pstmt.setString(4, custno);
			pstmt.setString(5, saleno);
			pstmt.executeUpdate();
			pstmt.close();
		}
%>
<script>
alert("수정 성공");
location.href="selectMoney.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>