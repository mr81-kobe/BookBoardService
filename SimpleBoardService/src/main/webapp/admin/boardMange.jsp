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
	<p>관리자 페이지 게시판 작업 페이지</p>
	<div class="panel panel-default">




		<h3>관리자 페이지 게시판</h3>
		<hr>



		<table class="table table-dark table-hover">
			<thead>
				<tr>
					<th scope="col">no</th>
					<th scope="col">title</th>
					<th scope="col">writer</th>
					<th scope="col">content</th>
					<th scope="col">cnt</th>
					<th>function</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.list}" var="l">
					<tr>
						<th scope="row">${l.no}</th>
						<td>${l.title}</td>
						<td>${l.writer}</td>
						<td>${l.content}</td>
						<td>${l.cnt}</td>
						<td><button onclick="location.href='/admin/boardEdit?no=${l.no}'">편집</button> <button value="${l.no}" id="deleteBut">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		
		<c:if test="${page.prePage>1 }">
			<button onclick="location.href='/admin/boardMange.do?prePage=${page.prePage-1}'">이전</button>
		</c:if>
		
		<c:forEach begin="${page.startPage }" end="${page.endPage}" var="i">
		
			<button onclick="location.href='/admin/boardMange.do?prePage=${i}'">${i}</button>
		
		</c:forEach>
		
		<c:if test="${page.prePage<page.wholePage}">
			<button onclick="location.href='/admin/boardMange.do?prePage=${page.prePage+1}'">다음</button>
		</c:if>
		
		
		<input type="hidden" id="addr">
	</div>


</section>
<div><button onclik="location.href='#'" >추가하기</button></div>
<a href="/admin/index.do">admin</a>

<%@ include file="/include/footer.jsp"%>

