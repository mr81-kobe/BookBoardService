<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fe7dc358638f8a8a09aa227f4dc50e33&libraries=services"></script>
<title>Section</title>
<link rel="shortcut icon" href="#">


</head>
<body>
	<header>
		<div class="row-fluid">

			<div align="left">

				<nav class="navbar navbar-default">
					<div class="container-fluid">
						<div class="navbar-header" style="display: flex">


							<div class="page-header" >
								<a href="../Section.do"><h1>
										Library and Book Board <small>Toy Project</small>
									</h1></a>
							</div>

							<div style="position: absolute; top: 0px; right: 0px; float: right"  >
								<div id="first"  style="display: block;">
									<button type="button" class="btn btn-default navbar-btn" onclick="location.href='../member/singin.jsp'">Sign-in</button>
									<button type="button" class="btn btn-default navbar-btn" onclick="location.href='../member/login.jsp'">Log-in</button>
								</div>
								<div class="login_box" id="last" style="display: none;" >${userID } 님 환영합니다.
									<button type="button" class="btn btn-default navbar-btn" onclick="location.href='logout.do'">log-out</button>
								</div>
								<ul class="nav nav-tabs">
									<li role="presentation" class="active"><a href="../Section.jsp">Home</a></li>
									<li role="presentation"><a href="../boardList.do">BoardList</a></li>
									<li role="presentation"><a href="../bookBoard.do">BookList</a></li>
									
									<li role="presentation"><a id="goToLib">NearLibList</a></li>
									
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
			style="height: 400px;  background-image: url('https://p4.wallpaperbetter.com/wallpaper/814/287/584/books-library-shelves-interior-wallpaper-preview.jpg')">
			<h1
				style="color: white; position: absolute; left: 50%; top: 50%; margin: auto;">Library and Book Board</h1>

			<hr>
		</div>