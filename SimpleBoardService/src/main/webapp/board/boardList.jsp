<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
	<%@ include file="/include/header.jsp" %>
	

		<section style="width: 80%" >
			<h1>도서관 게시판</h1>
			<div class="panel panel-default" >
				
				

				<!-- Table -->
				<table class="table table-hover" style="width: 100%" >
					<thead>
						<tr>
							<th scope="col">No</th>
							<th scope="col">Title</th>
							
							<th scope="col">count</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${list}" var="board">
						<tr>
							
							<td >${board.no }</td>
							<td onclick="location.href='../getBoard.do?boardNo=${board.no}'">${board.title }</td>
							<td>${board.cnt }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			
				
			</div>
			<div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups" >
  					
  						<div class="btn-group me-2" role="group" aria-label="First group">
    						
    						<c:if test="${page.startPage ne 1}">
    							<button  class="btn btn-outline-secondary" onclick="location.href='../prePage.do?end=${page.startPage-1}'">이전</button>
    						</c:if>
    						<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}" >
    							<c:if test="${i < page.startPage+5}">
    								<button type="button" class="btn btn-outline-secondary" onclick="location.href='../boardList.do?pageNO=${i}'">${i}</button>
    							</c:if>
    							
    						</c:forEach>
    						<c:if test="${page.endPage > page.startPage+4}">
    							<button class="btn btn-outline-secondary" onclick="location.href='../next.do?start=${page.prePage+1}'">다음</button> 
    						</c:if>
    							<button onclick="location.href='./board/insertForm.jsp'" class="btn btn-outline-secondary">글쓰기</button>
    					
    					</div>
  					
				</div>

		</section>
		</div>
<%@ include file="/include/footer.jsp" %>