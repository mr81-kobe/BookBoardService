<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ include file="/include/header.jsp" %>
	


		<section style="width: 80%; margin: 0 auto;"  >
			
				<h1>${book.title }</h1>
				
				<div id="content box" >
				<div class="imgBox" style="display: flex">
				<img src="${book.img_url}" width="450px" height="300px">
				
				<ul class="list-group" style="width: 330px">
  					<li class="list-group-item"><h3>제목: ${book.title}</h3></li>
  					<li class="list-group-item"><h3>작가: ${book.author}</h3></li>
  					<li class="list-group-item"><h3>출판사: ${book.publisher}</h3></li>
  					<li class="list-group-item"><h3>가격: ${book.price}</h3></li>
  					
				</ul>
				
				
				 </div>
				</div>
			     <hr>
			    	<div style="display:flex" align="center">	
			    		<div id="ButBox">
			    			<c:if test="${empty like}">
			    			<button id="likeButton">♡</button>
			    			</c:if> 
			    			<c:if test="${not empty like}">
			    				<button id="disLikeBut">♥</button>
			    			</c:if>
			    		</div>
			    		&nbsp;&nbsp;&nbsp;&nbsp; <h5 id="good">${book.good}</h5>
			     	
			     	</div>
			     <hr>
			     <textarea  rows="10" class="form-control" readonly="readonly" style="height: auto" > ${book.description }</textarea> 
				
				
				
				
			
		</section>
		</div>
		<script>
		
		
		$.ajax({
		
			url:"https://www.googleapis.com/books/v1/volumes?q=isbn=9791127860349",
			type: "GET",
			contentType:"application/json",
			success: function(res){
				console.log(res.items[0].id)
				
			}
			
			
		})
		
		
		var bookNo = '${book.no}';
		var wirter ='${userID}'
		
		
		</script>
	<script src="${pageContext.request.contextPath}/resources/js/Like.js?v=<%=System.currentTimeMillis() %>"></script>
<%@ include file="/include/footer.jsp" %>

