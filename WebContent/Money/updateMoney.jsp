<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매출 수정</title>
</head>
<body>
<%@ include file="../Main/header.jsp" %>
<%@ include file="../Main/nav.jsp" %>
<section>
	<form name=form>
	<br><h3 style="font-size:2em;text-align:center;">회원 매출 수정</h3><br>
	<table border=1 style="margin:0 auto; width:30%;">
		<%
			String custno=request.getParameter("custno");
			String saleno=request.getParameter("saleno");
			String pcode=request.getParameter("pcode");
			Integer total=0;
			Integer amount=0;
			Integer number=0;
			int i=0;
			String[] code=new String[number];
			String[] name=new String[number];
			Integer stockqty=0;
			Integer[] cost=new Integer[number];
			String pname=null;
			Integer pcost=0;
			Integer price=0;
			Integer qty=0;
			if(request.getParameter("amount")!=null){
				stockqty=Integer.parseInt(request.getParameter("amount"));
			}
			java.util.Date sdate=null;
			String date=null;
			if(request.getParameter("sdate")!=null){
				date=request.getParameter("sdate");
			}
			try{
				sql="select count(pcode) from product0607";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()){
					number=rs.getInt(1);
				}pstmt.close();
				code=new String[number];
				name=new String[number];
				
				sql="select pcode,pname from product0607";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					code[i]=rs.getString(1);
					name[i]=rs.getString(2);
					i++;
				}pstmt.close();
				
				sql="select a.pcode,b.pname,a.pcost,a.amount,a.price,a.sdate from money0607 a join product0607 b on a.pcode=b.pcode where custno=? and saleno=? and a.pcode=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, custno);
				pstmt.setString(2, saleno);
				pstmt.setString(3, pcode);
				rs=pstmt.executeQuery();
				if(rs.next()){
					pcode=rs.getString(1);
					pname=rs.getString(2);
					pcost=rs.getInt(3);
					amount=rs.getInt(4);
					total=total+amount;
					price=rs.getInt(5);
					sdate=rs.getDate(6);
					if(request.getParameter("amount")!=null){
						if(stockqty!=amount){
							amount=stockqty;
							price=pcost*amount;
						}
					}
					sql="select stockqty from product0607 where pcode=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, pcode);
					rs=pstmt.executeQuery();
					if(rs.next()){
						qty=rs.getInt(1);
						total=total+qty;
					}pstmt.close();
					if(amount>total){
						stockqty=total;
		%>
		<script>
		alert("수정 가능 수량을 초과했습니다.\n최대수량으로 설정합니다.");
		</script>
		<%
					}
				}else{
					sql="select pname,price,stockqty from product0607 where pcode=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, pcode);
					rs=pstmt.executeQuery();
					if(rs.next()){
						pname=rs.getString(1);
						pcost=rs.getInt(2);
						qty=rs.getInt(3);
						price=pcost*stockqty;
					}pstmt.close();
					if(stockqty>qty){
						stockqty=qty;
		%>
		<script>
		alert("수정 가능 수량을 초과했습니다.\n최대수량으로 설정합니다.");
		</script>
		<%
					}
				}pstmt.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
		<tr>
			<th style="height:40px;">회원번호</th>
			<td><input type=number name=custno value="<%=custno%>" readonly style="height:40px;width:100%;"></td>
		</tr>
		<tr>
			<th style="height:40px;">판매번호</th>
			<td><input type=number name=saleno value="<%=saleno%>" readonly style="height:40px;width:100%;"></td>
		</tr>
		<tr>
			<th style="height:40px;">상품코드</th>
			<td>
				<select name=pcode onchange=search() style="background-color:orange;height:40px;width:100%;">
			<%
				for(int j=0;j<code.length;j++){
			%>
					<option value="<%=code[j]%>" <%=code[j].equals(pcode) ? "selected" : "" %>><%=code[j] %>: <%=name[j] %></option>
			<%
				}
			%>
				</select>
			</td>
		</tr>
		<tr>
			<th style="height:40px;">상품명</th>
			<td><input type=text name=pname value="<%=pname==null ? "" : pname%>" readonly style="height:40px;width:100%;"></td>
		</tr>
		<tr>
			<th style="height:40px;">단가</th>
			<td><input type=number name=pcost value="<%=pcost==0 ? "" : pcost%>" readonly style="height:40px;width:100%;"></td>
		</tr>
		<tr>
			<th style="height:40px;">수량</th>
			<td><input type=number name=amount value="<%=stockqty==0 ? amount : stockqty%>" style="background-color:orange;height:40px;width:100%;" onchange=search()></td>
		</tr>
		<tr>
			<th style="height:40px;">가격</th>
			<td><input type=number name=price value="<%=price==0 ? "" : price%>" readonly style="height:40px;width:100%;"></td>
		</tr>
		<tr>
			<th style="height:40px;">판매일자</th>
			<td><input type=date name=sdate value="<%=date==null ? sdate : date%>" readonly style="height:40px;width:100%;"></td>
		</tr>
		<tr>
			<td colspan=2 style="height:40px;text-align:center;">
				<input type=button value="수정" onclick=update() style="height:40px;width:80px;background-color:black;color:white;">
				<input type=button value="뒤로" onclick=back() style="height:40px;width:80px;background-color:black;color:white;">
			</td>
		</tr>
	</table>
	</form>
</section>
<%@ include file="../Main/footer.jsp" %>
</body>
<script>
function search(){
	document.form.action="updateMoney.jsp";
	document.form.submit();
}
function back(){
	location.href="selectMoney.jsp";
}
function update(){
	document.form.action="updateMoneyProcess.jsp";
	document.form.submit();
}
</script>
</html>