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
			<h1>Adimin Index</h1>
			<hr>
			<p>
			${userID} 관리자 님 안녕하세요  관리자 페이지 진입 하셨습니다.
			</p>
			<div class="panel panel-default">
				
				
				
				<div class="left">
				<a href="/admin/libMange.do">도서관련 분류</a>
				
				</div>
        		<div class="right">
        		<a href="/admin/boardMange.do">게시판 관련 분류</a>	
        		
        		
        		
        		</div>
				
				
				
				
				<a href="/admin/userMange.do">회원 관련 분류 </a>
				
				
				<a href="/admin/bookMange.do">책 관련 분류</a>
								
				</div>


			
			


		</section>
	
		
	
<%@ include file="/include/footer.jsp" %>

