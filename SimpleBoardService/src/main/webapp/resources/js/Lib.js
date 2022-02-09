/**
 * 
 */
var roadviewContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
		var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
		var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

		var position = new kakao.maps.LatLng(we, kung);

		// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
		roadviewClient.getNearestPanoId(position, 50, function(panoId) {
		    roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
		});
		
	
		
		
		
		function starPoint(star, div,ration){
			star.bind("mouseenter",function(e){
			
			
			$(this).prevAll().html("★")
			$(this).html("★");
			})
		star.bind("mouseleave",function(e){
			
			
			$(this).html("☆");
			$(this).nextAll().html("☆");
			})
		star.bind("click",function(e){
			
			
			star.off("mouseleave")
			star.off("mouseenter")
			$(this).prevAll().html("★");
			$(this).html("★");
			setRating(div,ration);
			
		
		})
		
		star.dblclick(function(e){
		
			star.bind("mouseleave",function(e){
				
				
				$(this).html("☆");
				$(this).nextAll().html("☆");
				})
			star.bind("mouseenter",function(e){
			
			
			$(this).prevAll().html("★")
			$(this).html("★");
			})
		})
		
		}
		
	
	function setRating(div,ration){	
		
		var rating=0;
		
		for(var i=0; i<div.children().length; i++){
			
			if(div.children().eq(i).html()=="★")
			{
				rating++; 
			}
		}
		ration.val(rating);
		
		}
		
		
		$(".editButton").bind("click" ,function(e){
			
			e.preventDefault();
			
			
			var no= $(this).val(); 
			var star = $('.star'+ no +'');
			var div =$('#starBox'+ no +''); 
			var ration=$('#ration'+ no +'');
			
			
			
			
			
			
			$(this).parent().children("textarea").removeAttr("readonly"); 
			starPoint(star,div,ration);
			
			
			
			$(this).parent().append('<button class="complte">편집 완료</button>'); 
			$('.complte').bind("click", function(e) {
				var content=$(this).parent().children("textarea").val();
				e.preventDefault();
				alert(ration.val());
				
				updatePost(no,ration,content);
				
			})
			
						
		
			
			
			
			
		})
		
		$("#deleteButton").bind("click" ,function(e){
			
			
			
			location.href='../deleteComment.do?no='+$(this).val()+"&libno="+libno;
			
			
			
			
		})
		
		
		$('.star').bind("mouseenter",function(e){
			
			
			$(this).prevAll().html("★")
			$(this).html("★");
			})
		$('.star').bind("mouseleave",function(e){
			
			
			$(this).html("☆");
			$(this).nextAll().html("☆");
			})
		$('.star').bind("click",function(e){
			
			var div =$("#starBox");
			var ration=$("#ration")
			$(this).prevAll().html("★");
			$(this).html("★");
			setRating(div,ration);
			$('.star').off("mouseleave")
			$('.star').off("mouseenter")
		
		})
		
		$('.star').dblclick(function(e){
		
			$('.star').bind("mouseleave",function(e){
				
				
				$(this).html("☆");
				$(this).nextAll().html("☆");
				})
			$('.star').bind("mouseenter",function(e){
			
			
			$(this).prevAll().html("★")
			$(this).html("★");
			})
		})
		
		
		function updatePost(no,ration,content){
			
			
			var f = document.createElement('form'); 
			f.setAttribute('method', 'post');
			f.setAttribute('action','../updateComment.do');
			var noInput = document.createElement('input');
			noInput.setAttribute('type', 'hidden');
			noInput.setAttribute('name', 'no'); 
			noInput.setAttribute('value', no); 
			var c = document.createElement('input');
			c.setAttribute('name', 'content');
			c.setAttribute('type','hidden');
			c.setAttribute('value', content);
			var r = document.createElement('input');
			r.setAttribute('name', 'ration');
			r.setAttribute('type', 'hidden');
			r.setAttribute('value', ration.val()); 
			var l =document.createElement('input');
			l.setAttribute('name', 'lbno');
			l.setAttribute('type', 'hidden');
			l.setAttribute('value', libNo);
			f.appendChild(noInput);
			f.appendChild(c);
			f.appendChild(r);
			f.appendChild(l);
			document.body.appendChild(f);
			f.submit();
			
			
		}
		
		//별점 관련 script 끝 
		
		
		
		
		//lib name 값 파라미터러 넘기기 
		
		$("#boardButton").bind("click", function(e){
			
			location.href='../board/insertForm.do?libNo='+libNo+''
		
		
		})
		
		
		
		
		