<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ include file="/include/header.jsp" %>
<style>
	.star{
	font-size: 30px;
	
	
	}
	.feeling_div {
  display: flex;
  justify-content: center;
  align-items: center;
} 
.button-container {
  margin-left: 20px;
}
.feeling_a {
  background-color: #fff;
  border: 2px solid #2199e8;
  padding: 10px 20px;
  border-radius: 2px;
  color: #2199e8;
}    
textarea {

resize :none;
}
</style>
	
	<h1>${lib.name }</h1>

		<section style="width: 80%;" >
			<div class="panel panel-default">
				
				
				<div id="content box" >
				<div class="imgBox" style="display: flex;">
				<div id="roadview" style="width:100%;height:auto;"></div>
				
				<ul class="list-group" style="width: 330px">
  					<li class="list-group-item"><h3>이름: ${lib.name}</h3></li>
  					<li class="list-group-item"><h3>주소: ${lib.address}</h3></li>
  					<li class="list-group-item"><h3>타입: ${lib.type}</h3></li>
  					<li class="list-group-item"><h3><a href="${lib.url}">홈 페이지</a> </h3></li>
  					<li class="list-group-item"><h3>보유 자료 수: ${lib.information}</h3></li>
  					<li class="list-group-item"><h3>보유 도서 수: ${lib.books}</h3></li>
					<li class="list-group-item">
					<c:forEach begin="1" end="${lib.ration}">
						<span style="font-size: 30px;">★</span> 
					</c:forEach>
				<c:forEach begin="${lib.ration +1}" end="5">
					<span style="font-size: 30px;">☆</span> 
				</c:forEach>
						
						<h5>${lib.ration }</h5>
					</li>
				</ul>
				
					
				 </div>
				<hr>
				<button id="boardButton" class="btn btn-primary btn-lg" >게시판에서 의견 남기기</button>
				<div class="button-container like-container">
			    
				</div>
			     <hr>
			     
			     <div id="map" style="width:100%;height:350px;"></div>
			     
			     
			     
			<div id="commentInsert" class="col-sm">
			<form action="boradbook/insertComment.do" method="POST">
				<h3>${userID }</h3>
				<input type="hidden" name="writer" value="${userID }" readonly="readonly">
				<textarea class="form-control" rows="10" cols="20" name="content"></textarea>			
				<div id="starBox">
					<span class="star">☆</span><span class="star">☆</span><span class="star">☆</span><span class="star">☆</span><span class="star">☆</span>
					<input type="hidden" value="${lib.no}" name="lbNo">
				</div>
					 
					<input type="hidden" id="ration" name="ration">
					<input type="submit" value="덧글 쓰기">
			
			</form>
			
			
			
			
			</div>
			
			
			</div>
		

		</section>
		<c:forEach items="${page.list}" var="c">
			<div id="commentBox"  style="width: 60%">
				<h4>${c.writer }</h4>
				<textarea rows="" cols="" readonly="readonly" class="form-control">${c.content}</textarea>
				<div id="starBox${c.no}" }>
				<c:forEach begin="1" end="${c.ration}">
					<span class="star${c.no}">★</span>
				</c:forEach>
				<c:forEach begin="${c.ration +1}" end="5">
					<span class="star${c.no}">☆</span>
				</c:forEach>
				</div>
				
				<span>${c.ration}</span>
			<c:if test="${c.writer eq userID }">
				<button id="editButton" class="editButton" value="${c.no}">편집</button><input type="hidden" id="ration${c.no}" name="ration" class="ration${c.no}" value="${c.ration}"> <button id="deleteButton" value="${c.no}" class="deleteButton">삭제</button>
			
			</c:if>
			</div>
			</c:forEach>
		
		<script>
		var we ='${lib.we}';
		var kung='${lib.kung}';
		
		var libNo='${lib.no}';
		
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(we, kung), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var markerPosition  = new kakao.maps.LatLng(we, kung); 

	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	marker.setMap(map)
		</script>
		
		
		<script src="${pageContext.request.contextPath}/resources/js/Lib.js?v=<%=System.currentTimeMillis() %>"></script>
		
		
		
		
	</div>
		
		
		
	
<%@ include file="/include/footer.jsp" %>

