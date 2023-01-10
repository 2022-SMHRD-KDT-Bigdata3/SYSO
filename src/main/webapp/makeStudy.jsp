<%@page import="java.io.PrintWriter"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.smhrd.model.tb_user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>TEAM SYSO - Study cafe with calendar</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap Icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic"
	rel="stylesheet" type="text/css" />
<!-- SimpleLightbox plugin CSS-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<!-- 비동기통신을 위한 제이쿼리 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href='main.css' rel='stylesheet'></link>
<script src='main.js'></script>
</head>

<body id="page-top">
	<!-- 세션에 사용자정보 가져오기 -->
	<%
	tb_user info = (tb_user) session.getAttribute("info");
	%>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3"
		id="mainNav">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="main.html#page-top">SYSO</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto my-2 my-lg-0">
					<li class="nav-item"><a class="nav-link"
						href="main.html#page-top">홈</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> 스터디 카페 </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="studyCafe.jsp#masthead">나의
									스터디모임</a></li>
							<li><a class="dropdown-item" href="studyCafe.jsp#searchRoom">스터디모임
									찾기</a></li>
							<li><a class="dropdown-item" href="studyCafe.jsp#makeRoom">스터디모임
									만들기</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link"
						href="mainPage.jsp#page-top">나의 일정</a></li>
					<!-- 세션의 아이디값 확인 -->
					<%
					if (info != null) {
					%>
					<li class="nav-item"><a class="nav-link"
						href="mainPage.jsp#page-top"><%=info.getUser_id()%>님 환영합니다</a></li>
					<%
					} else {
					%>
					<h3>현재 아이디값 못찾음</h3>
					<%
					}
					%>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Back to top button -->
	<button type="button" class="btn btn-danger btn-floating btn-lg"
		id="btn-back-to-top">
		<i class="fi fi-br-angle-small-up"></i>
	</button>


	<!-- header-->
	<header class="masthead">
		<div class="container px-4 px-lg-5 h-100">
			<div
				class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
				<div class="col-lg-8 align-self-end">
					<h2 class="text-white font-weight-bold">스터디모임 만들기</h2>
					<hr class="divider" />
				</div>
				<div class="col-lg-8 align-self-baseline"></div>
				
				<form class="row g-3" style='background-color:white;'>
					<div class="col-md-6">
						<label for="inputEmail4" class="form-label">스터디룸 이름</label> <input
							type="text" name="sr_num" class="form-control" id="sr_num">
					</div>
					<div class="col-md-6">
						<label for="inputPassword4" class="form-label">연령대</label> <input
							type="text" name="sr_aog" class="form-control" id="sr_aog">
					</div>
					<div class="col-12">
						<label for="inputAddress" class="form-label">허용인원수</label> <input
							type="number" name="sr_capacity" class="form-control" id="sr_capacity"
							placeholder="ex) 5">
					</div>
					<div class="col-12">
						<label for="inputAddress2" class="form-label">응시지역</label> <input
							type="text" name="location" class="form-control" id="location"
							placeholder="ex) 광주광역시">
					</div>
					<div class="col-md-4">
						<label for="inputState" class="form-label" name="sr_gender">방성별</label> <select
							id="sr_gender" class="form-select">
							<option selected>남녀</option>
							<option>남자만</option>
							<option>여자만</option>							
						</select>
					</div>			
					<div class="col-12">
						<button type="submit" class="btn btn-primary">생성</button>
					</div>
				</form>
			</div>
		</div>		
				
	</header>



	<!-- Footer-->
	<footer class="bg-light py-5">
		<div class="container px-4 px-lg-5">
			<div class="small text-center text-muted">Copyright &copy; 2023
				- TEAM syso</div>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- SimpleLightbox plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

</body>
</html>
