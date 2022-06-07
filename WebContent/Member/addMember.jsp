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
			doc.action="addMemberProcess.jsp";
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
		<h3 style="font-size:2em;text-align:center;">홈쇼핑 회원 등록 화면</h3>
		<br>
		<hr>
		<table border=1 style="margin:0 auto; width:40%;">
		<%
			Integer custno=0;
			try{
				sql="select max(custno) from member0607";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()){
					custno=rs.getInt(1)+1;
				}pstmt.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
			<tr>
				<th style="width:25%;height:40px;">회원번호(자동생성)</th>
				<td><input type=number name=custno readonly value="<%=custno==0 ? "" : custno%>" style="width:100%;height:40px;"></td>
			</tr>
			<tr>
				<th style="width:25%;height:40px;">회원성명</th>
				<td><input type=text name=custname style="width:100%;height:40px;"></td>
			</tr>
			<tr>
				<th style="width:25%;height:40px;">회원전화</th>
				<td><input type=text name=phone style="width:100%;height:40px;"></td>
			</tr>
			<tr>
				<th style="width:25%;height:40px;">회원주소</th>
				<td><input type=text name=address style="width:100%;height:40px;"></td>
			</tr>
			<tr>
				<th style="width:25%;height:40px;">가입일자</th>
				<td><input type=number name=joindate style="width:100%;height:40px;"></td>
			</tr>
			<tr>
				<th style="width:25%;height:40px;">고객등급</th>
				<td>
				<select name=grade style="width:100%;height:40px;">
					<option value="">고객등급 선택</option>
					<option value="A">A:VIP</option>
					<option value="B">B:일반</option>
					<option value="C">C:직원</option>
				</select>
				</td>
			</tr>
			<tr>
				<th style="width:25%;height:40px;">도시코드</th>
				<td>
				<select name=city style="width:100%;height:40px;">
					<option value="">도시코드 선택</option>
					<option value="01">서울</option>
					<option value="02">경기</option>
					<option value="10">대전</option>
					<option value="20">부산</option>
					<option value="30">광주</option>
					<option value="40">울산</option>
					<option value="50">대구</option>
					<option value="60">강원</option>
					<option value="70">경상</option>
					<option value="80">충청</option>
					<option value="90">제주</option>
				</select>
				</td>
			</tr>
			<tr>
				<th style="width:25%;height:40px;">관심상품</th>
				<td>
					<input type=checkbox name=goods value="의류">의류
					<input type=checkbox name=goods value="식료품">식료품
					<input type=checkbox name=goods value="컴퓨터">컴퓨터
					<input type=checkbox name=goods value="공산품">공산품
					<input type=checkbox name=goods value="관광">관광
					<input type=checkbox name=goods value="전자제품">전자제품
					<input type=checkbox name=goods value="건강제품">건강제품
					<input type=checkbox name=goods value="운동기구">운동기구
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