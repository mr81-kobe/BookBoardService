<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ include file="/include/header.jsp" %>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
				
				<form action="/admin/insertLib.do" method="post"  >
					
				<div class="mb-3">
  					<label for="exampleFormControlInput1" class="form-label">도서관 이름(Title)</label>
  						<input type="text" class="form-control" id="exampleFormControlInput1" name="name" required="required">
				</div>
				<div class="mb-3">
  					<label for="exampleFormControlInput2" class="form-label">주소(address)</label>
  						<input type="text" class="form-control" id="sample4_roadAddress" name="address"  required="required">
					
				
				</div>
				<button id="addButton">주소찾기</button>
				<div id="map" style="width:100%; height:350px;"></div>
				<div class="mb-3">
  					<label for="exampleFormControlInput3" class="form-label">전화번호</label>
  						<input type="text" class="form-control" id="exampleFormControlInput2" name="phone" required="required">
				</div>
				 <div class="mb-3">
  					<label for="exampleFormControlInput4" class="form-label">홈페이지(url)</label>
  						<input type="text" class="form-control" id="exampleFormControlInput3" name="url" required="required">
				</div>
				<div class="mb-3">
  					<label for="exampleFormControlTextarea5" class="form-label">도서관 종류(type)</label>
 					<textarea class="form-control" id="exampleFormControlTextarea4" rows="3" name="type" required="required"></textarea>
				</div>
				
				<div id="weKung">
					<input type="hidden" name="we" id="we">
					<input type="hidden" name="kung" id="kung">
				</div> 
				
				
				
				
				
				
				<button type="submit">입력하기</button>
				</form>
				
				</div>
				
				
				
								
				</div>


			
			<input type="hidden" id="addr">
			


		</section>
	
		<a href="/admin/index.do">admin</a>
		<script>
		
		
		
		
		$("#addButton").bind("click",function(e){
			
			e.preventDefault(); 
			sample4_execDaumPostcode();
			
			
			
			
		})
		
		
		
		 function sample4_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		            	
		            	
		            	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var roadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 참고 항목 변수

		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		              
		                document.getElementById("sample4_roadAddress").value = roadAddr;
		               
		                
		                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
		                
		                addrSearch(document.getElementById("sample4_roadAddress").value);
		                
		            }
		        }).open();
		    
		     
		        	
		        	
		        	
		        	
		   
		        
		
		}
		
		
		
		
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng('37.5666805', '126.9784147'), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	
	var coords = new kakao.maps.LatLng(we, kung);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });
	
	function addrSearch(addr){
		
		geocoder.addressSearch(addr, function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">도서관 위치</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    
		     $("#we").val(result[0].y);
		     $("#kung").val(result[0].x);
		     } 
		     else{
		    	 
		    	 
		    	 alert("주소 검색 실패")
		    	 
		     }
		}); 
			
		
		
	}
	
	// 주소로 좌표를 검색합니다
	
		</script>
		
	
<%@ include file="/include/footer.jsp" %>

