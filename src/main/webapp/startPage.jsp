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
</head>
<body id="page-top">
	<%
	//세션으로부터 가지고올꺼니까 getAttribute
	// info 는 msgmembervo타입이고 getAttribute는 object로 반환되니까 다운캐스팅 필요
	// 로그인 하고 페이지를 넘어오자마자 인포라고 넣고 아래 흐름에서 모든 데이터를 사용할 수 있도록 위로 올림 
	tb_user info = (tb_user) session.getAttribute("info");
	%>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3"
		id="mainNav">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="#page-top">SYSO</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto my-2 my-lg-0">
					<li class="nav-item"><a class="nav-link" href="#about">사이트
							소개</a></li>
					<li class="nav-item"><a class="nav-link" href="#contact">로그인</a></li>
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
					<h1 class="text-white font-weight-bold">일정관리API를 활용한 스터디모임 서비스</h1>
					<hr class="divider" />
				</div>
				<div class="col-lg-8 align-self-baseline">
					<p class="text-white-75 mb-5">손쉬운 일정관리와 자격시험 스터디 모임</p>
					<a class="btn btn-primary btn-xl" href="#contact">Get Started!</a>
				</div>
			</div>
		</div>
	</header>
	<!-- About-->
	<section class="page-section bg-primary" id="about">
		<div class="container px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-lg-8 text-center">
					<h2 class="text-white mt-0">스터디모임을 가입하고 일정을 만들어보세요</h2>
					<hr class="divider divider-light" />
					<p class="text-white-75 mb-4">Start Bootstrap has everything
						you need to get your new website up and running in no time! Choose
						one of our open source, free to download, and easy to use themes!
						No strings attached!</p>
				</div>
			</div>
		</div>
	</section>
	<!-- 사이트소개-->
	<section class="page-section" id="about">
		<div class="container px-4 px-lg-5">
			<h2 class="text-center mt-0">At SYSO</h2>
			<hr class="divider" />
			<div class="row gx-4 gx-lg-5">
				<div class="col-lg-3 col-md-6 text-center">
					<div class="mt-5">
						<div class="mb-2">
							<i class="bi-gem fs-1 text-primary"></i>
						</div>
						<h3 class="h4 mb-2">서비스 소개1</h3>
						<p class="text-muted mb-0">기능에 대한 설명 1</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="mt-5">
						<div class="mb-2">
							<i class="bi-laptop fs-1 text-primary"></i>
						</div>
						<h3 class="h4 mb-2">서비스 소개2</h3>
						<p class="text-muted mb-0">기능에 대한 설명 2</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="mt-5">
						<div class="mb-2">
							<i class="bi-globe fs-1 text-primary"></i>
						</div>
						<h3 class="h4 mb-2">서비스 소개3</h3>
						<p class="text-muted mb-0">기능에 대한 설명 3</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="mt-5">
						<div class="mb-2">
							<i class="bi-heart fs-1 text-primary"></i>
						</div>
						<h3 class="h4 mb-2">서비스 소개4</h3>
						<p class="text-muted mb-0">기능에 대한 설명 4</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- join-->
	<section class="page-section" id="contact">
		<div class="container px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-lg-8 col-xl-6 text-center">
					<h2 class="mt-0">로그인</h2>
					<hr class="divider" />
					<p class="text-muted mb-5">계정이 없다면 회원가입을 진행하세요</p>
				</div>
			</div>
			<div class="row gx-4 gx-lg-5 justify-content-center mb-5">

				<div class="col-lg-6">
					<form action ="LoginService" id="contactForm" data-sb-form-api-token="API_TOKEN">
						<!-- Submit Button-->
						<div class="accordion" id="accordionExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingOne">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseOne"
										aria-expanded="true" aria-controls="collapseOne">로그인
									</button>
								</h2>
								<div id="collapseOne" class="accordion-collapse collapse show"
									aria-labelledby="headingOne" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<div class="input-group mb-3">
											<input type="text" name="user_id" class="form-control" placeholder="아이디"
												aria-label="Username" aria-describedby="basic-addon1">
											<input type="password" name="user_pw" class="form-control" placeholder="비밀번호"
												aria-label="Username" aria-describedby="basic-addon1">
										</div>
									<div class="d-grid"><button class="btn btn-primary" type="submit">로그인</button></div>
									</div>
								</div>
							</div>
					</form>

					<div class="accordion-item">
						<h2 class="accordion-header" id="headingTwo">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseTwo"
								aria-expanded="false" aria-controls="collapseTwo">회원가입
							</button>
						</h2>
						<div id="collapseTwo" class="accordion-collapse collapse"
							aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
							<div class="accordion-body">
								<div class="input-group mb-3">
									<div class="container text-center">
										<div class="row row-cols-1">
											<form action="JoinService" method="post">
												<div class="col">
													<input name="user_id" type="text" class="form-control"
														placeholder="아이디" aria-label="Username"
														aria-describedby="basic-addon1">
												</div>
												<div class="col">
													<input name="user_pw" type="password" class="form-control"
														placeholder="비밀번호" aria-label="Username"
														aria-describedby="basic-addon1">
												</div>
												<div class="col">
													<input name="user_name" type="text" class="form-control"
														placeholder="이름" aria-label="Username"
														aria-describedby="basic-addon1">
												</div>
												<div class="col">
													<input name="user_nick" type="text" class="form-control"
														placeholder="닉네임" aria-label="Username"
														aria-describedby="basic-addon1">
												</div>
												<div class="col">
													<input name="user_email" type="text" class="form-control"
														placeholder="이메일주소" aria-label="Username"
														aria-describedby="basic-addon1">
												</div>
												<div class="col">
													<select name="user_aog" class="form-select"
														aria-label="Default select example">
														<option selected>연령대</option>
														<option value="10">10</option>
														<option value="20">20</option>
														<option value="30">30</option>
														<option value="40">40</option>
														<option value="50">50</option>
														<option value="60">60</option>
													</select>
												</div>
												<div class="col">
													<div class="form-check">
														<input name="gender" class="form-check-input" type="radio"
															id="exampleRadios1" value="m"> <label
															class="form-check-label" for="exampleRadios1">남자</label>
													</div>
													<div class="form-check">
														<input name="gender" class="form-check-input" type="radio"
															id="exampleRadios2" value="f"> <label
															class="form-check-label" for="exampleRadios2">여자</label>
													</div>
												</div>
												<div class="col">
													<input name="yob" type="text" class="form-control"
														placeholder="출생연도" aria-label="Username"
														aria-describedby="basic-addon1">
												</div>
												<div class="col">
													<input name="phone" type="text" class="form-control"
														placeholder="휴대전화번호" aria-label="Username"
														aria-describedby="basic-addon1">
												</div>
										</div>
									</div>
								</div>
								<div class="d-grid">
									<input type="submit" value="JOIN">
								</div>
						</form>
					</div>
				</div>
			</div>

		</div>

	</section>
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
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
