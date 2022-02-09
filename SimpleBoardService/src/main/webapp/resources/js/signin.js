/**
 *  비밀번호 체크 중복 확인은 ajax 사용할 생각 중 입니다. 
 */

var pwd2 = $("#password2").val();
var check = function checkPwd() {
	pwd2 = $("#password2").val();
	if ($("#password").val() == pwd2) {
		$("#pwd").html("");
		$("#pwd").html("<h3>비밀번호가 일치 합니다.</h3>");
	} else {
		$("#pwd").html("");
		$("#pwd").html("<h3>비밀번호가 일치하지 않습니다.</h3>");
	}
};

$("#password2").change(check);

var email = $("#email");

$("#form").bind("submit", (function(e) {
	e.preventDefault();
	
	$.ajax({

		url : "http://localhost:8080/check.do",
		type : "GET",
		contentType : "application/json; charset-utf-8",
		data : {
			id : email.val()

		},
		dataType : "text",
		success : function(result) {
			if (result == "yes") {
				$("#form").unbind();		
				$("#form").submit();

			} else {
				alert(result);
				email.val('');
				email.focus();
			}

		},
		error : function() {

			alert("전송실패");

		}

	})

}));
