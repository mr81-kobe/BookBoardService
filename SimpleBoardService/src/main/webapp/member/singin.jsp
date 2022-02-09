<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>


		<section style="width: 65%">
			<!-- 본문 -->
			<!-- <table border="4" style="background-color: gray; border-color: black">
			<thead><tr align="center"> <td colspan="2"><h3>회원가입</h3></td></tr> </thead>
				<tr><td>아이디(이메일):</td><td><input type="email" name="email" placeholder="hgj0307@hanmail.net" required="required" ></td></tr>
				<tr><td>비밀번호:</td><td><input type="password" name="password" required="required"   id="password"></td></tr>
				<tr><td>비밀번호 확인:</td><td><input type="password"  id="password2" name="name" required="required" ></td><td><div id="pwd_check"></div></td></tr>
				
				<tr><td>이름 :</td><td><input type="text"  id="name" name="name" required="required" ></td></tr>
				<tr><td>주소:</td><td><input type="text"  id="address" required="required" name="address" ></td></tr>
			</table> --> 
			
			<h1>회원가입</h1>
			<form method="POST" action="/signin.do" id="form">
				<div align="left" class="form_box">
					<div class="form-group">
						<label for="InputName">성명</label> <input type="text"
							class="form-control" id="name" name="name" placeholder="ex)황규준">
					</div>
					<div class="form-group">
						<label for="InputEmail">이메일 주소</label> <input type="email"
							class="form-control" id="email" name="email"
							placeholder="ehdrmf0307@naver.com">
					</div>


					<div class="form-group">
						<label for="InputPassword">비밀번호</label> <input type="password"
							class="form-control" id="password" name="password">
					</div>
					<div class="form-group" style="">
						<label for="InputPassword2">비밀번호 확인</label> <input type="password"
							class="form-control" id="password2">
						<div id="pwd">이히히</div>

					</div>
					<div class="form-group">
						<label for="InputAddress">주소</label> <input type="text"
							class="form-control" id="address" name="address">
					</div>

					<div class="form-group">

						<input type="submit" class="btn btn-primary" id="btn_final"
							value="회원가입">
					</div>


				</div>
			</form>
		</section>


<script src="${pageContext.request.contextPath}/resources/js/signin.js?v=<%=System.currentTimeMillis() %>"></script>
<%@ include file="/include/footer.jsp" %>