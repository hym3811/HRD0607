<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../Main/header.jsp" %>
<%@ include file="../Main/nav.jsp" %>
<section>
	<form name=form>
		<h3 style="font-size:2em;text-align:center;">회원 정보 목록</h3>
		<%
			Integer number=null;
			try{
				sql="select count(custno) from member0607";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()){
					number=rs.getInt(1);
				}pstmt.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
		<pre>             총 <%=number %>명의 회원이 있습니다.</pre>
		<hr>
		<table border=1 style="margin:0 auto;width: 80%; text-align:center;">
			<tr>
				<th style="height:40px;">no</th>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
				<th style="width:30%;">관심상품</th>
				<th>구분</th>
			</tr>
		<%
			Integer i=0;
			Integer no=0;
			String[] custno=new String[number];
			String custname=null;
			String phone=null;
			String address=null;
			java.util.Date joindate=null;
			String grade=null;
			String city=null;
			String goods=null;
			try{
				sql="select * from member0607";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					no++;
					custno[i]=rs.getString(1);
					custname=rs.getString(2);
					phone=rs.getString(3);
					address=rs.getString(4);
					joindate=rs.getDate(5);
					grade=rs.getString(6);
					city=rs.getString(7);
					goods=rs.getString(8);
					i++;
		%>
			<tr>
				<td height="40px;"><%=no %></td>
				<td><a href="updateMember.jsp?custno=<%=custno[i-1]%>" style="text-decoration:none;color:orange;"><%=custno[i-1] %></a></td>
				<td><%=custname %></td>
				<td><%=phone %></td>
				<td><%=address %></td>
				<td><%=joindate %></td>
				<td><%=grade %></td>
				<td><%=city %></td>
				<td><%=goods %></td>
				<td><a onclick=del() href="deleteMember.jsp?custno=<%=custno[i-1] %>" style="text-decoration:none;color:red;">삭제</a></td>
			</tr>
		<%
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