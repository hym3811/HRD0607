<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품별 매출 조회</title>
</head>
<body>
<%@ include file="../Main/header.jsp" %>
<%@ include file="../Main/nav.jsp" %>
<section>
	<form name=form>
		<br><h3 style="text-align:center;font-size:2em;">상품 매출 정보 조회(상품번호별 집계)</h3><br>
		<hr>
		<br>
		<table border=1 style="margin:0 auto; width:40%;text-align:center;">
			<tr>
				<th>No</th>
				<th>상품코드</th>
				<th>상품명</th>
				<th>매출</th>
			</tr>
	<%
		Integer no=0;
		String pcode=null;
		String pname=null;
		String sum=null;
		try{
			sql="select pcode,pname,to_char(sum(price),'999,999') as sum from product0607 group by pcode,pname order by sum desc";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				no++;
				pcode=rs.getString(1);
				pname=rs.getString(2);
				sum=rs.getString(3);
	%>
			<tr>
				<td><%=no %></td>
				<td><%=pcode %></td>
				<td><%=pname %></td>
				<td><%=sum %></td>
			</tr>
	<%
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
		</table>
		<table style="margin:0 auto;">
			<tr>
				<td>
					<input type=button value="작성" onclick=add() style="width:80px;height:40px;background-color:black;color:white;text-align:center;">
				</td>
			</tr>
		</table>
	</form>
</section>
<%@ include file="../Main/footer.jsp" %>
</body>
<script>
function add(){
	location.href="addProduct.jsp";
}
</script>
</html>