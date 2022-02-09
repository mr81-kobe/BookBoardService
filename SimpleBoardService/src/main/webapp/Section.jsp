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
				
				
				
				<div class="left">
				<h3>평점이 높은 도서관</h3>
					<hr>
					<table class="table table-dark table-hover">
  <thead>
    <tr>
      <th scope="col">no</th>
      <th scope="col">title</th>
      <th scope="col">ration</th>
      <th scope="col">address</th>
    </tr>
  </thead>
  <tbody>
   <c:forEach items="${best}" var="l">
	<tr onclick="location.href='../getLi.do?no=${l.no}'">
      <th scope="row">${l.no}</th>
      <td >${l.name}</td>
      <td>${l.address}</td>
      <td>${l.ration}</td>
    </tr>
   </c:forEach>	
  </tbody>
</table>
				
				
				</div>
        		<div class="right">
        			
        			<h3>인기도서</h3>
        			<hr>
        			<table>
        			
        			
        			
        			</table>
        		
        		
        		
        		
        		</div>

				<div class="under">
				<hr>
				<h3>Hot Issue</h3>
				<hr> 
				
<table class="table table-dark table-hover">
  <thead>
    <tr>
      <th scope="col">no</th>
      <th scope="col">title</th>
      <th scope="col">cnt</th>
    </tr>
  </thead>
  <tbody>
   <c:forEach items="${hot}" var="h">
	<tr onclick="location.href='../getBoard.do?boardNo=${h.no}'">
      <th scope="row">${h.no}</th>
      <td>${h.title}</td>
      <td>${h.cnt}</td>
    </tr>
   </c:forEach>	
  </tbody>
</table>
								
				</div>


			
			<input type="hidden" id="addr">
			</div>


		</section>
	
		<a href="/admin/index.do">admin</a>
	
<%@ include file="/include/footer.jsp" %>

