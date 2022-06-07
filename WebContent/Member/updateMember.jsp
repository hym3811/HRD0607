<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원등록</title>
<script>
	function add(){
		var doc=document.form;
		var chk=document.getElementsByName("goods");
		var ctn=0;
		for(var i=0;i<chk.length;i++){
			if(chk[i].checked==true){
				ctn++;
				break;
			}
		}
		
		if(doc.custname.value==""){
			alert("[회원성명]\n회원성명을 입력하세요.");
			doc.custname.focus();
		}else if(doc.phone.value==""){
			alert("[회원전화]\n회원전화를 입력하세요.");
			doc.phone.focus();
		}else if(doc.address.value==""){
			alert("[회원주소]\n회원주소를 입력하세요.");
			doc.address.focus();
		}else if(doc.joindate.value==""){
			alert("[가입일자]\n가입일자를 입력하세요.");
			doc.joindate.focus();
		}else if(doc.joindate.value.length!=8){
			alert("[가입일자]\n가입일자는 숫자8자리로 입력하세요.");
			doc.joindate.focus();
		}else if(doc.grade.value==""){
			alert("[고객등급]\n고객등급을 선택하세요.");
			doc.grade.focus();
		}else if(doc.city.value==""){
			alert("[도시코드]\n도시코드를 선택하세요.");
			doc.city.focus();
		}else if(ctn==0){
			alert("[관심상품]\n관심상품을 1개 이상 선택하세요.");
			doc.goods.focus();
		}else{
			doc.action="updateMemberProcess.jsp";
			doc.submit();
		}
	}
</script>
</head>
<body>
<%@ include file="../Main/header.jsp" %>
<%@ include file="../Main/nav.jsp" %>
<section>
	<form name=form>
		<h3 style="font-size:2em;text-align:center;">홈쇼핑 회원 수정 화면</h3>
		<br>
		<hr>
		<table border=1 style="margin:0 auto; width:40%;">
		<%
			String custno=request.getParameter("custno");
			String custname=null;
			String phone=null;
			String address=null;
			String date=null;
			String join=null;
			String joindate=null;
			String grade=null;
			String city=null;
			String goods=null;
			try{
				sql="select * from member0607 where custno=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, custno);
				rs=pstmt.executeQuery();
				if(rs.next()){
					custname=rs.getString(2);
					phone=rs.getString(3);
					address=rs.getString(4);
					date=rs.getString(5);
					join=date.substring(0,10);
					joindate=join.replace("-", "");
					grade=rs.getString(6);
					city=rs.getString(7);
					goods=rs.getString(8);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			
		%>
			<tr>
				<th style="width:25%;height:40px;">회원번호</th>
				<td><input type=number name=custno readonly value="<%=custno==null ? "" : custno%>" style="width:100%;height:40px;"></td>
			</tr>
			<tr>
				<th style="width:25%;height:40px;">회원성명</th>
				<td><input type=text name=custname style="width:100%;height:40px;" value="<%=custname==null ? "" : custname%>"></td>
			</tr>
			<tr>
				<th style="width:25%;height:40px;">회원전화</th>
				<td><input type=text name=phone style="width:100%;height:40px;" value="<%=phone==null ? "" : phone%>"></td>
			</tr>
			<tr>
				<th style="width:25%;height:40px;">회원주소</th>
				<td><input type=text name=address style="width:100%;height:40px;" value="<%=address==null ? "" : address%>"></td>
			</tr>
			<tr>
				<th style="width:25%;height:40px;">가입일자</th>
				<td><input type=number name=joindate style="width:100%;height:40px;" value="<%=joindate==null ? "" : joindate%>"></td>
			</tr>
			<tr>
				<th style="width:25%;height:40px;">고객등급</th>
				<td>
				<select name=grade style="width:100%;height:40px;">
					<option value="">고객등급 선택</option>
					<option value="A" <%="A".equals(grade) ? "selected" : "" %>>A:VIP</option>
					<option value="B" <%="B".equals(grade) ? "selected" : "" %>>B:일반</option>
					<option value="C" <%="C".equals(grade) ? "selected" : "" %>>C:직원</option>
				</select>
				</td>
			</tr>
			<tr>
				<th style="width:25%;height:40px;">도시코드</th>
				<td>
				<select name=city style="width:100%;height:40px;">
					<option value="">도시코드 선택</option>
					<option value="01" <%="01".equals(city) ? "selected" : "" %>>서울</option>
					<option value="02" <%="02".equals(city) ? "selected" : "" %>>경기</option>
					<option value="10" <%="10".equals(city) ? "selected" : "" %>>대전</option>
					<option value="20" <%="20".equals(city) ? "selected" : "" %>>부산</option>
					<option value="30" <%="30".equals(city) ? "selected" : "" %>>광주</option>
					<option value="40" <%="40".equals(city) ? "selected" : "" %>>울산</option>
					<option value="50" <%="50".equals(city) ? "selected" : "" %>>대구</option>
					<option value="60" <%="60".equals(city) ? "selected" : "" %>>강원</option>
					<option value="70" <%="70".equals(city) ? "selected" : "" %>>경상</option>
					<option value="80" <%="80".equals(city) ? "selected" : "" %>>충청</option>
					<option value="90" <%="90".equals(city) ? "selected" : "" %>>제주</option>
				</select>
				</td>
			</tr>
			<tr>
				<th style="width:25%;height:40px;">관심상품</th>
				<td>
					<input type=checkbox name=goods value="의류" <%=goods.contains("의류")==true ? "checked" : "" %>>의류
					<input type=checkbox name=goods value="식료품" <%=goods.contains("식료품")==true ? "checked" : "" %>>식료품
					<input type=checkbox name=goods value="컴퓨터" <%=goods.contains("컴퓨터")==true ? "checked" : "" %>>컴퓨터
					<input type=checkbox name=goods value="공산품" <%=goods.contains("공산품")==true ? "checked" : "" %>>공산품
					<input type=checkbox name=goods value="관광" <%=goods.contains("관광")==true ? "checked" : "" %>>관광
					<input type=checkbox name=goods value="전자제품" <%=goods.contains("전자제품")==true ? "checked" : "" %>>전자제품
					<input type=checkbox name=goods value="건강제품" <%=goods.contains("건강제품")==true ? "checked" : "" %>>건강제품
					<input type=checkbox name=goods value="운동기구" <%=goods.contains("운동기구")==true ? "checked" : "" %>>운동기구
				</td>
			</tr>
			<tr>
				<td colspan=2 style="height:40px;text-align:center;">
					<input type=button value="등록" onclick=add() style="height:40px;width:80px;color:white;background-color:black;font-size:1.3em;font-weight:bold;">
					<input type=button value="취소" onclick=reset() style="height:40px;width:80px;color:white;background-color:black;font-size:1.3em;font-weight:bold;">
				</td>
			</tr>
		</table>
	</form>
</section>
<%@ include file="../Main/footer.jsp" %>
</body>
</html>