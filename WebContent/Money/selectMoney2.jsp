<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원별 매출 조회</title>
</head>
<body>
<%@ include file="../Main/header.jsp" %>
<%@ include file="../Main/nav.jsp" %>
<section>
	<form name=form>
		<br><h3 style="text-align:center;font-size:2em;">회원 매출 정보 조회(회원번호별 집계)</h3><br>
		<hr>
		<br>
		<table border=1 style="margin:0 auto; width:40%;text-align:center;">
			<tr>
				<th style="height:40px;">No</th>
				<th>회원번호</th>
				<th>회원이름</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
	<%
		Integer no=0;
		Integer custno=0;
		String custname=null;
		String grade=null;
		String sum=null;
		try{
			sql="select a.custno,a.custname,a.grade,to_char(sum(b.price),'999,999') as sum from member0607 a join money0607 b on a.custno=b.custno group by a.custno,a.custname,a.grade order by sum desc";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				no++;
				custno=rs.getInt(1);
				custname=rs.getString(2);
				switch(rs.getString(3)){
				case "A":
					grade="VIP";
					break;
				case "B":
					grade="일반";
					break;
				case "C":
					grade="직원";
					break;
				}
				sum=rs.getString(4);
	%>
			<tr>
				<td style="height:40px;"><%=no %></td>
				<td><%=custno %></td>
				<td><%=custname %></td>
				<td><%=grade %></td>
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
					<input type=button value="작성" onclick=add() style="height:40px;width:70px;background-color:black;color:white;">
				</td>
			</tr>
		</table>
	</form>
</section>
<%@ include file="../Main/footer.jsp" %>
</body>
<script>
function add(){
	location.href="addMoney.jsp";
}
</script>
</html>