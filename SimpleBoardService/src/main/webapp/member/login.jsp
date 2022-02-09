<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/include/header.jsp" %>

		<section style="width: 80%">

			<form action="/login.do" method="post" id="loginform">
				<div align="left" class="form_box">

					<div class="form-group">
						<label for="InputMail">아이디</label> <input type="text"
							class="form-control" id="email" name="email"
							placeholder="vhdvhd0307@gmail.com">
					</div>
					<div class="form-group">
						<label for="InputPassword">비밀번호</label> <input type="password"
							class="form-control" id="password" name="password">
					</div>
					<input type="hidden" name="lat" id="lat"> <input
						type="hidden" name="lon" id="lon"> 
					<input type="hidden" name ="addr" id="addr">
						<input type="submit"
						value="Login" class="btn primary-btn" id="login">
				</div>
			</form>
		</section>

		<%@ include file="/include/footer.jsp" %>

	<%-- <script
		src="${pageContext.request.contextPath}/resources/js/ajaxTest.js?v=<%=System.currentTimeMillis() %>"></script> --%>
	<script>
var geocoder = new kakao.maps.services.Geocoder();

















if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
            var coord = new kakao.maps.LatLng(lat, lon);
            var callback = function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    console.log('그런 너를 마주칠까 ' + result[0].address.address_name + '을 못가');
               $("#addr").val(result[0].address.address_name);
                
                }
            };

            geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
      /*  var locPosition = new kakao.maps.LatLng(lat, lon) */// 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
        $("#lat").val(lat);
        $("#lon").val(lon);
       
    
}) 
    }else { 
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}









</script>
</body>
</html>