<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ include file="/include/header.jsp" %>
	
	<style>
	 div.left {
        width: 50%;
        float: left;
        box-sizing: border-box;
        
        background: #ff0;
    }
    div.right {
        width: 50%;
        float: right;
        box-sizing: border-box;
        
        background: #0ff;
    }

	
	
	</style>
	
	<div class="container" align="center">
		<div class="imgbox" align="center"
			style="height: 400px; background-image: url('https://media.istockphoto.com/photos/old-school-chalkboard-picture-id547016978?b=1&amp;k=20&amp;m=547016978&amp;s=170667a&amp;w=0&amp;h=CFpK3c30n2dD059xLC0PxngaX1wMn2Aa5erw9M0ub3s=')">
			<h1
				style="color: white; position: absolute; left: 50%; top: 50%; margin: auto;">Simple
				Board</h1>

			<hr>
		</div>


		<section style="width: 80%">
			<div class="panel panel-default">
				
				<div class="left"></div>
        		<div class="right"></div>



			
				</div>	
		</section>
	
		</div>
	
<%@ include file="/include/footer.jsp" %>

