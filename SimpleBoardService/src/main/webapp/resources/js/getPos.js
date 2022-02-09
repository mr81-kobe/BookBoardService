/**
 * 
 */


	
	var geocoder = new kakao.maps.services.Geocoder();
	 var we ;
	 var kung; 
	 var addr;

	if (navigator.geolocation) {
	    
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	        
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	            var coord = new kakao.maps.LatLng(lat, lon);
	            var callback = function(result, status) {
	                if (status === kakao.maps.services.Status.OK) {
	                	we=lat;
	   	               kung=lon;
	                	console.log('그런 너를 마주칠까 ' + result[0].address.address_name + '을 못가');
	             
	              		
	                
	                }
	            };

	            geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
	     	
	            geocoder.coord2RegionCode(coord.getLng(), coord.getLat(), function(result,status){
	            	
	            	 if (status === kakao.maps.services.Status.OK) {
	            		 
	            		 for(var i = 0; i < result.length; i++) {
	            	            // 행정동의 region_type 값은 'H' 이므로
	            	            if (result[i].region_type === 'H') {
	            	                $("#addr").val(result[i].address_name);
	            	               	
	            	                break;
	            	            }
	            	        }
	            		 
	            	 }
	            	
	            }); 
	    
	}) 
	    }else { 
	    
	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
	        message = 'geolocation을 사용할수 없어요..'
	        
	    displayMarker(locPosition, message);
	}
	
	
	
	
	$("#goToLib").bind("click", function(e) {
		
		e.preventDefault();
		var form = $('<form ></form>') //action ="../getLib.do" method="post"
		
		form.attr("method", "get");
		form.attr("action", "../getLib.do");
		
		
		var lat =$('<input type="hidden" name="lat" value="'+we+'">');
		var lon =$('<input type="hidden" name="lon" value="'+kung+'">');
		var addr=$('<input type="hidden" name="addr" value="'+$("#addr").val()+'">');
		form.appendTo('body')
		form.append(lat)
		form.append(lon)
		form.append(addr)
		form.submit();
	})
	
	
	
	
	
	
	
	
