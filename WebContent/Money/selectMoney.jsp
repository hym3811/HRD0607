<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매출 조회</title>
</head>
<body>
<%@ include file="../Main/header.jsp" %>
<%@ include file="../Main/nav.jsp" %>
<section>
	<form name=form>
	<br>
	<h3 style="text-align:center;margin:0 auto;font-size:2em;">회원 매출 정보 목록</h3>
	<br>
	<%
		Integer num=0;
		try{
			sql="select count(custno) from money0607";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				num=rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	<pre>                                                            총 <%=num %>건의 매출 정보가 있습니다.</pre>
	<hr>
	<table border=1 style="margin:0 auto;width:70%;">
		<tr>
			<th style="height:40px;">No</th>
			<th>회원번호</th>
			<th>회원이름</th>
			<th>판매번호</th>
			<th>단가</th>
			<th>수량</th>
			<th>가격</th>
			<th>상품코드</th>
			<th>상품명</th>
			<th>판매일자</th>
			<th>구분</th>
		</tr>
	<%
		Integer number=0;
		try{
			sql="select count(custno) from member0607";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				number=rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		String[] custno=new String[number];
		Integer i=0;
		Integer no=0;
		String custname=null;
		String saleno=null;
		String pcost=null;
		String amount=null;
		String price=null;
		String pcode=null;
		String pname=null;
		java.util.Date sdate=null;
		try{
			sql="select custno,sum(pcost*amount) as total from money0607 group by custno order by total desc";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				custno[i]=rs.getString(1);
				i++;
			}
			for(int j=0;j<custno.length;j++){
				sql="select b.custname,a.saleno,to_char(a.pcost,'999,999'),to_char(a.amount,'999,999'),to_char(a.price,'999,999'),a.pcode,a.sdate,c.pname from money0607 a join member0607 b on a.custno=b.custno join product0607 c on a.pcode=c.pcode where a.custno=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, custno[j]);
				rs=pstmt.executeQuery();
				while(rs.next()){
					no++;
					custname=rs.getString(1);
					saleno=rs.getString(2);
					pcost=rs.getString(3);
					amount=rs.getString(4);
					price=rs.getString(5);
					pcode=rs.getString(6);
					sdate=rs.getDate(7);
					pname=rs.getString(8);
	%>
		<tr>
			<td style="height:30px;text-align:center;"><%=no %></td>
			<td style="height:30px;text-align:center;"><a href="updateMoney.jsp?custno=<%=custno[j]%>&saleno=<%=saleno%>&pcode=<%=pcode %>" style="text-decoration:none;color:orange;"><%=custno[j] %></a></td>
			<td style="height:30px;text-align:center;"><%=custname %></td>
			<td style="height:30px;text-align:center;"><%=saleno %></td>
			<td style="height:30px;text-align:right;width:10%;"><%=pcost %>원</td>
			<td style="height:30px;text-align:right;"><%=amount %>(ea)</td>
			<td style="height:30px;text-align:right;width:15%;"><%=price %>원</td>
			<td style="height:30px;text-align:center;"><%=pcode %></td>
			<td style="height:30px;text-align:center;"><%=pname %></td>
			<td style="height:30px;text-align:center;"><%=sdate %></td>
			<td style="height:30px;text-align:center;"><a href="deleteMoney.jsp?custno=<%=custno[j]%>&saleno=<%=saleno %>" style="text-decoration:none;color:red;">삭제</a></td>
		</tr>
	<%				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	</table>
	</form>
</section>
<%@ include file="../Main/footer.jsp" %>
</body>
</html>