<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ include file="/include/header.jsp" %>
	
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fe7dc358638f8a8a09aa227f4dc50e33"></script>
	


		<section style="width: 80%">
			<div class="panel panel-default">
				
				<div id="map" style="width: 750px; height: 350px;"></div>
					<div id="libList">
				
				<input type="text" value="">
				
					</div>
				<input type="hidden" id="prePage">

				
			
			</div>


		</section>
		<script >
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	var imageSize = new kakao.maps.Size(24, 35); 
	var imageSrc2="https://cdn3.iconfinder.com/data/icons/navigation-24/48/navigations-18-512.png";
	var mrarkerImage2= new kakao.maps.MarkerImage(imageSrc2, imageSize); 
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	var lat ='${lat}';
	var lon ='${lon}';
	var addr;
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
		var map = new kakao.maps.Map(mapContainer, mapOption);
	
	
	
	
	
	
	
	
	$(document).ready(function(){
	
		$.ajax({
			url:'https://localhost:8443/call.do',
			type:'POST',
			 dataType: 'json',
			 data:JSON.stringify({
				prePage: "1"
				
			 }),
			 contentType:"application/json; charset-utf-8",
			success: function(res){
				
			
				
			
				makeTable(res);
				
				},
			error: function(err){
				alert(err.status)
			}
		})
	})
		
		
		
		

	
	
	
	
	
	
	
	
	
	$(document).on( 'click','#indexBut',function(e){
		
		
		$.ajax({
				
		url:'https://localhost:8443/call.do',
		data:JSON.stringify({
		'prePage': Number($(this).html()),	
		}),
		type:"post",
		contentType:"application/json; charset-utf-8",
		dataType:"json",
		success:function(result){
			
			makeTable(result);
		},
		error:function(error){
			console.log("???");
		}
		
	})
	
	})
	
	
	
	
	function makeTable(res){
			
			
			
			
			var list = res.list;
			var startPage=res.startPage;
			var endPage=res.endPage;
			var ht='';
			var wholePage =res.wholePage;
			
			ht+='<table class="table table-hover" style="width: 100%">'
				ht+='<thead><tr>';
				ht+='<th scope="col">name</th><th scope="col">Type</th><th scope="col">tel</th>'
				ht+='</tr></thead><tbody>'
		    
			$.each(list,function(index,lib){
			    
				console.log(lib.we)
				console.log(lib.kung)
			    // 마커 이미지의 이미지 크기 입니다
			    
			   
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: new kakao.maps.LatLng(lib.we, lib.kung), // 마커를 표시할 위치
			        title : lib.name, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage // 마커 이미지 
			    });
			
			
				
				ht+='<tr><td id="name">'+lib.name+'</td><input type="hidden" id="lat" value="'+lib.we+'"><input type="hidden" id="lon" value="'+lib.kung+'"><td>'+lib.type+'</td><td>'+lib.phone+'</td><td><a href="../getLi.do?no='+lib.no+'">정보 보기</a></td></tr>'
			
			
			
			
			
			
			})
			
			ht+='</tbody></table>'
			if(prePage>1){
			ht+='<button  id="prev" value='+Number(prePage)-Number(1)+'>이전</button>';
			}
			
			for(var i=startPage; i<endPage; i++){
				
				
			ht+='<button id="indexBut">'+i+'</button>'
				
			}
			if(wholePage>5){
				ht+='<button id="next" value="'+ Number(prePage)+Number(5) +'">다음</button>'
			}
			
			
		
			 var marker_me = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: new kakao.maps.LatLng(lat, lon), // 마커를 표시할 위치
			        title : "you", // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : mrarkerImage2 // 마커 이미지 
			    });
			
		
			
			
			
			
			 $("#libList").html(ht);
			
			
		
		
		
		
		}
		
	function panTo(lat,lon) {
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new kakao.maps.LatLng(lat, lon);
	    
	    // 지도 중심을 부드럽게 이동시킵니다
	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	    map.panTo(moveLatLon);            
	}        	
	
/* 	
	$(document).on('click','#name',function(e){
		
		$("#name").bind("click", function() {
			e.preventDefault();
			var lat=$(this).next("input").val();
			var lon=$(this).next("input").next("input").val();
			console.log(lat)
			
			panTo(lat,lon);
		})
			
		
		
	}) */
		
		
		
$(document).on('click','#name',function(e){
		
		
			
	var lat=$(this).next("input").val();
	var lon=$(this).next("input").next("input").val();
	console.log(lat)
	
	panTo(lat,lon);
			
		
		
	})
		
		
	
	
	</script>
	
		
		</div>
		
	
	
	
	
	
<%@ include file="/include/footer.jsp" %>

