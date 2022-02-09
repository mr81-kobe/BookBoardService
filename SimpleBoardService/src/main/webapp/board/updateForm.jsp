<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<%@ include file="/include/header.jsp" %>

		<section style="width: 80%">
			<div class="panel panel-default">
				
				

						

				<h1>글 상세 보기</h1>
				<hr>
				
					<div align="left" class="form_box">
				<form action="../updateBoard.do" method="post">
						<div class="form-group">
							<label for="title">제목</label> <input type="text"
								class="form-control" id="title" name="title"
								placeholder="" value="${board.title}" >
						</div>
						<div class="form-group">
							<label for="writer">글 쓴이</label> <input type="email"
								class="form-control" id="email" name="writer"
								placeholder="" value="${board.writer}" readonly="readonly">
						</div>
						
						<div class="form-group">
							<label for="content">내용:</label> 
							<br>
							<textarea rows="14" cols="100" name="content">${board.content}</textarea>
						</div> 
						<div class="form-group">
							<label for="writer">글 종류</label> <input type="text"
								class="form-control" id="tag" 
								placeholder="" value="${board.tag}">
						</div>
						<br>
						<button type="submit" value="수정!">수정</button>
						</form>
						
						
						
						
					</div>
				


			</div>


		</section>
	
<%@ include file="/include/footer.jsp" %>
