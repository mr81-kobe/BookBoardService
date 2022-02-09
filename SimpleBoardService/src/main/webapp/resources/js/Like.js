/**
 * 
 */

var like ; 


$(document).on('click' , '#likeButton',function(e){
	$.ajax({
		
		url: "https://localhost:8443/likeIt.do",
		data: JSON.stringify({
			
			bookNo: bookNo,
			love:'1',
			id: wirter
			
		}),
		type:'POST',
		dataType:'text',
		contentType:'application/json; charset=utf-8',
		success: function(res){
			alert(res)
			
			$("#good").html(res);
			
			$("#ButBox").empty();
			$("#ButBox").append('<button id="disLikeBut">♥</button>')
		},
		error: function(err){
			alert(err.statusText);
		}
		
	})
	
})


$(document).on('click' , '#disLikeBut',function(e){
	
	$.ajax({
	
		url: "https://localhost:8443/disLikeIt.do",
		type: "POST",
		contentType: 'application/json; charset=utf-8',
		data: JSON.stringify({
			
			bookNo: bookNo,
			love:'1',
			id: wirter
			
		}),
		dataType: "text",
		success: function(res){
			alert(res)
			$("#good").html(res);
			$("#ButBox").empty();
			$("#ButBox").append('<button id="likeButton">♡</button>')
		},
		error: function(err){
			alert("fail")
		}
		
	
	
	
	})
	
	
	
	
})

