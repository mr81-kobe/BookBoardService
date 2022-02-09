<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fe7dc358638f8a8a09aa227f4dc50e33&libraries=services"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<title>BoardDetail</title>
</head>
<body>
	<header>
		<div class="row-fluid">

			<div align="left">

				<nav class="navbar navbar-default">
					<div class="container-fluid">
						<div class="navbar-header" style="display: flex">


							<div class="page-header" >
								<a href="Section.jsp"><h1>
										Simple Board <small>Toy Project</small>
									</h1></a>
							</div>

							<div style="position: absolute; top: 0px; right: 0px; float: right"  >
								<div id="first"  style="display: block;">
									<button type="button" class="btn btn-default navbar-btn" onclick="location.href='singin.jsp'">Sign-in</button>
									<button type="button" class="btn btn-default navbar-btn" onclick="location.href='/member/login.jsp'">Log-in</button>
								</div>
								<div class="login_box" id="last" style="display: block;" >${userID } 님 환영합니다.
									<button type="button" class="btn btn-default navbar-btn" onclick="location.href='logout.do'">log-out</button>
								</div>
								<ul class="nav nav-tabs">
									<li role="presentation" class="active"><a href="#">Home</a></li>
									<li role="presentation"><a href="#">BoardList</a></li>
									<li role="presentation"><a href="#">Info</a></li>
									<li role="presentation"><a href="#">Profile</a></li>
								</ul>
								
							</div>



						</div>
					</div>
				</nav>
			</div>



		</div>
	</header>
	<div class="container" align="center">
		<div class="imgbox" align="center"
			style="height: 400px; background-image: url('https://p4.wallpaperbetter.com/wallpaper/814/287/584/books-library-shelves-interior-wallpaper-preview.jpg')">
			<h1
				style="color: white; position: absolute; left: 50%; top: 50%; margin: auto;">Lib</h1>

			<hr>
		</div>
	<hr>
	<div style="" align="center">
			<h3 style="margin-bottom: 0px; padding:0px;">${board.title}</h3>
				
	</div>	
<hr>
		<section style="width: 80%">
			<div class="panel panel-default">
				
				

						
			
				
				
					<div align="left" class="form_box">

						<div class="form-group">
							<label for="title">제목</label> <input type="text"
								class="form-control" id="title" name="title"
								placeholder="" value="${board.title}" readonly="readonly">
						</div>
						<div class="form-group">
							<label for="writer">글 쓴이</label> <input type="email"
								class="form-control" id="email" name="writer"
								placeholder="" value="${board.writer}" readonly="readonly">
						</div>
						
						<div class="form-group">
							<label for="content">내용:</label> 
							<br>
							<textarea rows="14" cols="100" name="content" readonly="readonly" style="width: 884px">${board.content}</textarea>
						</div> 
						<div class="form-group">
							<label for="writer">글 종류</label> <input type="text"
								class="form-control" id="tag" 
								placeholder="" value="${board.tag}">
						</div>
						
						<div class="form-group">
							<a href="../download.do?fileName=${board.fileName}">${board.fileName}</a>
						</div>
						
						<br> 
						<h4></h4>
						
						<c:if test="${userID eq board.writer}">
						<button  id="updateButton" value="" onclick="location.href='../updateForm.do?no=${board.no}'">글 편집</button>
						<button id="delbutton" value="" onclick="location.href='../deleteBoard.do?no=${board.no}'">글 삭제</button>
						</c:if>
					</div>
				


			</div>
		
			
			
			
			<div id="libBox">
			
				<h3>${lib.name}</h3>
				<p>${lib.address}</p>
				
				
			<div id="map" style="width:100%;height:350px;"></div>
			
			
			
			</div>
			
			
			
			
			
			
		
			<div id="commentBox">
				<form action="../comment.do" method="post" id="commentForm">
					<input type="hidden" value="${userID}" name="writer">
					<h4>${userID}</h4>
					내용: <textarea rows="10" cols="60" name="content" class="form-control" style="width: 500px;"></textarea>
					<input type="hidden" value="${board.no}" name="boardNo" id="boardNo">
					<button type="submit" value="">댓글 작성</button>
					
				
				</form>
				
			
			
			
			</div>
			
			<div id="commentList" >
				
			<c:forEach items="${list }" var="comment">
				<div id="commentArea">	
					<h4>${comment.writer }</h4>
					<h3 style="display: none">${comment.no}</h3>
					<textarea rows="10" cols="60" readonly="readonly" style="width: 500px" >${comment.content }</textarea>
					<button id="commentEdit">편집</button> <button id="commentDelete">삭제</button>
				</div>
			</c:forEach>
				<c:if test="${page.startPage > 1}">
					<button class="btn btn-outline-secondary" onclick="location.href='../getBoard.do?boardNo=${page.boardNo}&prePage=${page.prePage-1}'">이전</button>
				</c:if>
				<c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
				
					<button class="btn btn-outline-secondary" onclick="location.href='../getBoard.do?boardNo=${page.boardNo}&prePage=${i}'">${i}</button>
				
				</c:forEach>
				<c:if test="${page.endPage < page.wholePage}">
					<button class="btn btn-outline-secondary" onclick="location.href='../getBoard.do?boardNo=${page.boardNo}&prePage=${page.prePage+1}'">다음</button>
				</c:if>
			</div>
		</section>
		<footer>
			<div class="jumbotron" align="center">
				<h3>Footer</h3>
				<p class="si">
					You only live once<br> <br> Follow your heart<br> <br>
					Past in jsust past<br> <br> Love your self
				</p>
			</div>
			<hr>
		</footer>
	</div>





<script type="text/javascript">
var no=${board.no};

	$(document).on('click',"#commentDelete",function(e){
		
		$('#commentList').html('');
	e.preventDefault();
	$.ajax({
		
	url:"https://localhost:8443/deleteComment.do",
	type:"POST",
	contentType:"application/json",
	data:JSON.stringify({
		"no":$(this).prev("button").prev("textarea").prev("h3").html(),
		"boardNo": String(no)
		
		
	}),
	dataType:"json",
	success:function(result){
		makeCommentList(result);
	},
	error:function(error){
		alert(error.statusText);
	}
	
	
	})} ) 
	
	$(document).on('click',"#commentEdit",function(e){
		e.preventDefault(); 
		
		$(this).attr('id',"commentEdit2");

		var textarea=$(this).prev("textarea");
		textarea.removeAttr("readonly");
		textarea.focus(); 
		$("#commentEdit2").bind("click",function(e){
			
			$('#commentList').html('');
			 
			 e.preventDefault();
			$.ajax({
				
			url:"https://localhost:8443/editComment.do",
			type:"POST",
			contentType:"application/json",
			data:JSON.stringify({
				"no":$(this).prev("textarea").prev("h3").html(),
				"content":$(this).prev("textarea").val(),
				"boardNo":String(no)
			}),
			dataType:"json",
			success:function(result){
				
				makeCommentList(result);
				
				
			},
			error:function(error){
				alert(error.statusText);
			}
			
			
			
		});
		
			$(this).attr('id',"commentEdit");
		
		})
		
		
	})
	
	
	
	
	
	
	
	
	
	
	
	
	
	var userID ='${userID}';
	if(userID!=""){
		
		$("#id").css("display" ,"block"); 
		$("#first").css("display","none");
		
	}
	
	
	
	
	
	var no=$("#boardNo").val();
	$(document).on('submit',"#commentForm",function(e){
		 $('#commentList').html('');
		e.preventDefault();
		var queryString = JSON.stringify($(this).serializeObject());
	$.ajax({
			
			url:"https://localhost:8443/comment.do",
			type: "POST",
			contentType:"application/json; charset-utf-8",
			data:queryString,
			dataType:"json",
			success:function(result){
				makeCommentList(result);
				

				
			},
			error: function(error){
				
				alert(error.statusText);
			}
			
		})
		
		
		
	});
	
	
	
	
	
	
	$.fn.serializeObject = function() {
		  "use strict"
		  var result = {}
		  var extend = function(i, element) {
		    var node = result[element.name]
		    if ("undefined" !== typeof node && node !== null) {
		      if ($.isArray(node)) {
		        node.push(element.value)
		      } else {
		        result[element.name] = [node, element.value]
		      }
		    } else {
		      result[element.name] = element.value
		    }
		  }

		  $.each(this.serializeArray(), extend)
		  return result
		}

	
	
	
	

	
	
	
	
	
	
	
function makeCommentList(result){
		
		
		var boardNo=result.boardNo;
		 var commentList=result.list;
		 var startPage = result.startPage;
		 var endPage =result.endPage;
		 var prePage =result.prePage;
		 var wholePage=result.wholePage;
		 var a='';
		 $.each(commentList, function(key, value) {
		 
			 
           
            a+='<div id="commentArea">'
            a+='<h4>'+value.writer+'</h4>'
            a+='<h3 style="display: none">'+value.no+'</h3>'
            a+='<textarea rows="10" cols="60" readonly="readonly" style-"width:500px" >'+value.content+'</textarea>'
            a+='<button id="commentEdit">편집</button> <button id="commentDelete">삭제</button>'
            a+='</div>'
			 
		 });
		 if(startPage>1){
			 a+='<button class="btn btn-outline-secondary" onclick="location.href=../getBoard.do?boardNo='+boardNo+'&prePage='+prePage+'">이전</button>'
		 }
		 
		 for (var num=startPage; num<=endPage; num++) {
            
                 a += '	<button class="btn btn-outline-secondary" onclick="">'+num+'</button>'
          
              }
		if(endPage<wholePage){
			a+='<button class="btn btn-outline-secondary" onclick="location.href=../getBoard.do?boardNo='+boardNo+'&prePage='+prePage+'">다음</button>'
		}
		

		 $('#commentList').html(a);
			
	}
	var we ='${lib.we}'; 
	var kung='${lib.kung}';
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
</body>
</html>