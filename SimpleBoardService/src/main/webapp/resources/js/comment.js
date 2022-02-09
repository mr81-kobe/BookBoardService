/**
 * 
 */
let no=$("#boardNo").val();
$('#commentForm').bind("submit",function(e){

	e.preventDefault();
	let queryString = JSON.stringify($(this).serializeObject());
$.ajax({
		
		url:"http:/localhost:8080/comment.do",
		type: "POST",
		contentType:"application/json; charset-utf-8",
		data:queryString,
		dataType:"application/json; charset-utf-8",
		success:function(result){
			
			
		},
		error: function(error){
			
			alert(error.statusText);
		}
		
	})
	
	
	
});

