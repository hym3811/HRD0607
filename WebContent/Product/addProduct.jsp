<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 등록</title>
</head>
<body>
<%@ include file="../Main/header.jsp" %>
<%@ include file="../Main/nav.jsp" %>
<section>
	<form name=form>
		<br><h3 style="font-size:2em;text-align:center;">상품 등록 화면</h3><br>
		<table border=1 style="margin:0 auto; width:30%;">
		<%
			Integer number=0;
			String num=null;
			String n=null;
			try{
				sql="select count(pcode) from product0607";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()){
					number=rs.getInt(1)+1;
				}
				num=Integer.toString(number);
				if(number<100){
					n="A0"+num;
				}else{
					n="A"+num;
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
			<tr>
				<th style="height:40px;">상품코드</th>
				<td><input type=text name=pcode value="<%=n==null ? "" : n%>" style="height:40px;width:100%;"></td>
			</tr>
			<tr>
				<th style="height:40px;">상품명</th>
				<td><input type=text name=pname style="height:40px;width:100%;"></td>
			</tr>
			<tr>
				<th style="height:40px;">단가</th>
				<td><input type=number name=price style="height:40px;width:100%;"></td>
			</tr>
			<tr>
				<th style="height:40px;">재고수량</th>
				<td><input type=number name=stockqty style="height:40px;width:100%;"></td>
			</tr>
			<tr>
				<td colspan=2 style="height:40px;text-align:center;">
					<input type=button value="등록" onclick=add() style="background-color:black;color:white;width:70px;height:40px;">
					<input type=button value="취소" onclick=reset() style="background-color:black;color:white;width:70px;height:40px;">
				</td>
			</tr>
		</table>
	</form>
</section>
<%@ include file="../Main/footer.jsp" %>
</body>
<script>
function add(){
	var doc=document.form;
	if(doc.pcode.value==""){
		alert("[상품코드]\n상품코드를 입력하세요.");
		doc.pcode.focus();
	}else if(doc.pname.value==""){
		alert("[상품명]\n상품명을 입력하세요.");
		doc.pname.focus();
	}else if(doc.price.value==0||doc.price.value==""){
		alert("[단가]\n단가를 입력하세요.");
		doc.price.focus();
	}else if(doc.stockqty.value==0||doc.stockqty.value==""){
		alert("[재고수량]\n재고수량을 입력하세요.");
		doc.stockqty.focus();
	}else{
		doc.action="addProductProcess.jsp";
		doc.submit();
	}
}
</script>
</html>