<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<footer>
	
	<script src="${pageContext.request.contextPath}/resources/js/getPos.js?v=<%=System.currentTimeMillis() %>"></script>

			<div class="jumbotron" align="center">
				<h3>Footer</h3>
				<p>
					You only live once<br> <br> Follow your heart<br> <br>
					Past in jsust past<br> <br> Love your self
				</p>
			</div>
			<hr>
</footer>
	
<script type="text/javascript">
	var userID ='${userID}';
	if(userID!=""){
		
		$("#last").css("display" ,"block"); 
		$("#first").css("display","none");
		
	}
	</script>

</body>
</html>