<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ include file="/include/header.jsp" %>
	


		<section style="width: 80%">
			<div class="panel panel-default" >
				
				

						

				<h1>${lib.name}</h1>
				<hr>
				<div style="overflow: auto;">
				<form action="/insertBoard.do" method="post" id="insertform" enctype="multipart/form-data">
					<div  class="form_box" align="center">

						<div class="form-group">
							<label for="InputMail">제목</label> <input type="text"
								class="form-control" id="title" name="title"
								value="${Lib.name}에 관하여">
						</div>
						<div class="form-group">
							<label for="InputPassword">내용:</label> 
							<br>
							<textarea rows="14" cols="100" name="content"></textarea>
						</div>
						<h4>주제 선정</h4>
						<hr>
						<select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="tag"  style="width:300px;">
  							
  							<option value="자유" selected>자유</option>
  							<option value="도서">도서</option>
  							<option value="일정">일정</option>
						</select>
						<hr>
						<input type="file" name="file" class="form-control-file">
						<input type="hidden" value="${userID}" name="writer">
						<input type="hidden" name = "libNo" value="${Lib.no}">
						<input type="hidden" name="libName" value="${Lib.name}">
						<hr class="my-4">
					
					<input type="submit" value="글 쓰기" class="btn primary-btn"
							id="insertBoard">
					</div>
				</form>
			</div>



			</div>
	

		</section>
		</div>
			
<%@ include file="/include/footer.jsp" %>