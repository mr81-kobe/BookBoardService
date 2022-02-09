<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/include/header.jsp"%>

<style>
div.left {
	width: 50%;
	float: left;
	box-sizing: border-box;
}

div.right {
	width: 50%;
	float: right;
	box-sizing: border-box;
}
</style>

<section style="width: 80%">
	<h1>Admin</h1>
	<hr>
	<p>관리자 페이지 도서관련 작업 페이지</p>
	<div class="panel panel-default">




		<h3>관리자 페이지 (회원)</h3>
		<hr>



		<table class="table table-dark table-hover">
			<thead>
				<tr>
					<th scope="col">no</th>
					<th scope="col">email</th>
					<th scope="col">address</th>
					<th scope="col">authority</th>
					
					<th>function</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.list}" var="l">
					<tr>
						<th scope="row">${l.no}</th>
						<td>${l.email}</td>
						<td>${l.address}</td>
						<td>${l.authority}</td>
						<td><button onclick="location.href='/admin/bookEdit?title=${l.email}'">편집</button> <button value="${l.no}" id="deleteBut">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		
		<c:if test="${page.prePage>1 }">
			<button onclick="location.href='/admin/userMange.do?prePage=${page.prePage-1}'">이전</button>
		</c:if>
		
		<c:forEach begin="${page.startPage }" end="${page.endPage}" var="i">
		
			<button class="idxBut" >${i}</button>
		
		</c:forEach>
		
		<c:if test="${page.prePage<page.wholePage}">
			<button onclick="location.href='/admin/userMange.do?prePage=${page.prePage+1}'">다음</button>
		</c:if>
		
		
		<input type="hidden" id="addr">
	</div>

<div id="searchBox">
	
		<form action="/admin/userMange.do" method="post">
		
		<select name="option" id="option">
			<option value="email" selected="selected">email(아이디)</option>
			<option value="authority">권한</option>
		
		</select>
			
		<input type="text" name="search" id="search">
		<input type="submit" value="검색">
		</form>
	</div>
</section>

<a href="/admin/index.do">admin</a>
<script> 

	var option ='${page.option}'
	var search ='${page.search}'	
	 $(".idxBut").bind("click",function(e){
		
		location.href="/admin/userMange.do?prePage="+$(this).val()+"&option="+option+"&search="+search;
	
	}) 
	
	$("#deleteBut").bind("click", function(e) {
	
		location.href="/admin/deleteUser.do?no="+$(this).val();
		
		
	})
	
	

</script>
<%@ include file="/include/footer.jsp"%>

