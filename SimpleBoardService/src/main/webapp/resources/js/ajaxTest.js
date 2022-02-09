/**
 * 에이 잭스 테스트
 * 
 * JavaScript를 이용하여 서버로 보내는 HTTP request를 만들기 위해서는 그에 맞는 기능을 제공하는 Object의 인스턴스가
 * 필요합니다. XMLHttpRequest 가 그러한 Object의 한 예입니다. 이러한 로직은 Internet Explorer의
 * XMLHTTP 라고 불리는 ActiveX 객체로 부터 시작되었습니다. 이후, Mozilla, Safari 등 기타 브라우저들이
 * Microsoft사의 ActiveX 객체의 매서드와 프로퍼티를 지원하는 XMLHttpRequest 객체를 적용합니다. 그러는 동안,
 * Microsoft도 XMLHttpRequest를 적용합니다.
 * 
 * http request(요청)을 자바스크립트로 만들기 위해서는 XMLHttpRequest를 필요로 한다.
 *//*
// httpRequest 객체 생성하기 어... 그 뭔 인터넷 프로그램을 쓰느냐에 따른 호환성에 따른 객체 생성의 예
var httpRequest;
if (window.XMLHttpRequest) { // 모질라, 사파리, IE7+ ...
	httpRequest = new XMLHttpRequest();
} else if (window.ActiveXObject) { // IE 6 이하
	httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
}


 * 서버에 요청(Request)을 하기에 앞서, 서버로 보낸 요청에 대한 응답을 받았을 때 어떤 동작을 할 것인지 정해야합니다. 위에서 생성한
 * httpRequest 의 onreadystatechange property에 특정 함수(nameOfTheFunction)를 할당하면 요청에
 * 대한 상태가 변화할 때 특정 함수(nameOfTheFunction)가 불리게 됩니다.
 

httpRequest.onreadystatechange = function() {
	// 서버의 응답에 따른 로직을 여기에 작성합니다. 
	alert("서버와 통신 성공 했을 떄 사용될 로직");
};

httpRequest.open('GET', 'http://www.example.org/some.file', true);
httpRequest.send(null);

첫번째 파라미터는 http 요구 방식을 받는다 get post 같은 form에  Method 속성 값을 원한다. 
 * 두번쨰 파라미터는 요구하고자하는 URL 입니다 아마 login.do 같은 걸 말하는 한데  
 * 요구하는 모든 페이지에 정확한 도메인 네임을 사용하십시오. 그렇지 않으면 open() 메소드를 호출할 때 'permission denied' 에러가 발생할 수 있습니다. 일반적인 오류는 당신의 사이트에 domain.tld 와 같은 형태로 접근하는 것 입니다. 이러한 경우 www.domain.tld 와 같은 형태로 페이지를 요구하기 바랍니다
   를 봐서는 http://localhost/login.do 이렇게 플러스 포트 번호 까지 넣어가면서 정확한 url을 읿력해야 할듯 보인다.
3번째 파라미터가 asynchronous(비동기)를 할지 결정하는 boolean 값으로 넘기는 듯 false 일떄가 비동기 처리이다. 
 *
  
httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 


만약 post 방식으로 데이터를 보내려 한다면 요청에 MIME type을 먼저 설정해야 한다.
 * 
 * 
 * MIME 타입이란 클라이언트에게 전송된 문서의 다양성을 알려주기 위한 메커니즘입니다: 웹에서 파일의 확장자는 별  의미가 없습니다. 그러므로, 각 문서와 함께 올바른 MIME 타입을 전송하도록, 서버가 정확히 설정하는 것이 중요합니다.
 * 
 * 확장자 대신 서버에 이거 이런거야 하고 알려주는 매커니즘을 말하는데 이걸 먼저 알려주고 보내야 된다는 말이지... 
 * 
 * content-type 즉 http request에 헤더에 저장되는 부가적인 정보들 중에 어떠한 컨테트 타입 인지 보낸단 말이지 결국 저거 content type은 
 * 모든 이진데이터(바이너리 타입) 단순한 텍스트x 에 x-www-form-urlencoded서브 타입으로 보낸다는 말이다. 그걸 mime 마임 타입이라고 부르는듯? 
 * 
   



 * 보냇잖아 보냇으면 이제 그 콜백 으로 넣어놓은 함수가 무슨 역할을 하는지가 중요하다 이거지 
 * 서버로 부터 모든 응답을 받았고 그걸 처리할 준비가 되어있는지 확인한다 이거지
 * 
 * 
 

if (httpRequest.readyState === XMLHttpRequest.DONE) {
    // 이상 없음, 응답 받았음 
} else {
    // 아직 준비되지 않음
} 


0 (uninitialized) - (request가 초기화되지 않음)
1 (loading) - (서버와의 연결이 성사됨)
2 (loaded) - (서버가 request를 받음)
3 (interactive) - (request(요청)을 처리하는 중)
4 (complete) - (request에 대한 처리가 끝났으며 응답할 준비가 완료됨) 


이제 그 후에는 request가 제대로 처리 되었는지 확인을 해야하는 두번 쨰 과정이 필요한데 이게 
 * 404냐 500이냐 이런거 있는데 200일때 이상이 없는거다
 

if (httpRequest.status === 200) {
    // 이상 없음!
} else {
    // 요구를 처리하는 과정에서 문제가 발생되었음
    // 예를 들어 응답 상태 코드는 404 (Not Found) 이거나
    // 혹은 500 (Internal Server Error) 이 될 수 있음
} 




$("#login").click(function() {
	
	
	makeHttpRequst();

	
	
});

var alertContent=function(){
	if(httpRequest.readyState==XMLHttpRequest.DONE){
		if(httpRequest.status==200){
			alert(httpRequest.responseText);
		}
	}else{
		alert("xmlRequest에 뭔가 문제가 있어 이자식아");
	}
	
};
var httpRequest;  

function makeHttpRequst(){
	
	 httpRequest = new XMLHttpRequest();
	httpRequest.onreadystatechange=alertContent; 
	httpRequest.open("GET", "http://localhost:8081/login.do",false);
	httpRequest.setRequestHeader('Content-Type', 'application/text'); 
	 httpRequest.send('userName=' + encodeURIComponent("sibal"));
}
*/ 


$("#loginform").submit(function(event){
	event.preventDefault();
	let queryString = JSON.stringify($(this).serializeObject());
	console.log(queryString);
	$.ajax({
		
		url:"https://localhost:8443/login.do",
		type: "POST",
		contentType:"application/json; charset-utf-8",
		data:queryString,
		dataType:"text",
		success:function(result){
			
			alert(result); 
			location.href="../Section.jsp";
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








