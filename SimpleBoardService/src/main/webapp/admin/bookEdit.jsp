<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ include file="/include/header.jsp" %>
	
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
			<h1>WelCome</h1>
			<hr>
			<p>
			저희 사이트는 도서관과 도서에 대한 정보교류 및 의견을 나누며
			 자유롭게 토론하는 커뮤니티 사이트 입니다~~! 
			
			</p>
			<div class="panel panel-default">
				
				
				<div>
				
				<form action="/admin/editBook.do" method="post"  >
					
				<div class="mb-3">
  					<label for="exampleFormControlInput1" class="form-label">제목(Title)</label>
  						<input type="text" class="form-control" id="exampleFormControlInput1" name="title" value="${book.title }">
				</div>
				<div class="mb-3">
  					<label for="exampleFormControlInput1" class="form-label">작가(author)</label>
  						<input type="text" class="form-control" id="exampleFormControlInput1" name="author" value="${book.author }">
				</div>
				<div class="mb-3">
  					<label for="exampleFormControlInput1" class="form-label">출판사(Publisher)</label>
  						<input type="text" class="form-control" id="exampleFormControlInput1" name="publisher" value="${book.publisher }">
				</div>
				<div class="mb-3">
  					<label for="exampleFormControlInput1" class="form-label">가격(Price)</label>
  						<input type="text" class="form-control" id="exampleFormControlInput1" name="price" value="${book.price }">
				</div>
				<div class="mb-3">
  					<label for="exampleFormControlTextarea1" class="form-label">설명 (Description)</label>
 					<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="description">${book.description}</textarea>
				</div>
				<input type="hidden" name="no" value="${book.no}"> 
				
				
				
				<button type="submit" >수정하기</button>
				</form>
				
				</div>
				
				
				
								
				</div>


			
			<input type="hidden" id="addr">
			</div>


		</section>
	
		<a href="/admin/index.do">admin</a>
	
<%@ include file="/include/footer.jsp" %>

