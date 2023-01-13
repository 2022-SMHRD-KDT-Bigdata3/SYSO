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

				<form action="makestudy">
					<div class="card ">
						<div class="card-body">
							<div class="container text-start">
								<div class="row">
									<div class="col">
										<input type="text" name="sr_name" class="form-control"
											placeholder="스터디 이름">
									</div>
									<ul></ul>	
										<select name="sb_num" class="form-select"
											aria-label="Default select example">
											<option selected>시험과목</option>
											<option value="정보처리기사">정보처리기사</option>
											<option value="컴퓨터활용능력">컴퓨터활용능력</option>
											<option value="한국사능력검정시험">한국사능력검정시험</option>
											<option value="토익">토익</option>
											<option value="지게차 운전기능사">지게차 운전기능사</option>
											<option value="건축기사">건축기사</option>
											<option value="한식조리기능사">한식조리기능사</option>
											<option value="전기기사">전기기사</option>
											<option value="용접기능사">용접기능사</option>
											<option value="직업상담사">직업상담사 2급</option>										
										</select>
									</div>
                                	<ul></ul>
									<div class="col">
										<div class="form-check form-check-inline">
											<input name="sr_gender" class="form-check-input"
												type="checkbox" id="inlineCheckbox1" value="m"> <label
												class="form-check-label" for="inlineCheckbox1">남자</label>
										</div>
										<div class="form-check form-check-inline">
											<input name="sr_gender" class="form-check-input"
												type="checkbox" id="inlineCheckbox2" value="f"> <label
												class="form-check-label" for="inlineCheckbox2">여자</label>
										</div>
										<div class="form-check form-check-inline">
											<input name="sr_gender" class="form-check-input"
												type="checkbox" id="inlineCheckbox2" value="f"> <label
												class="form-check-label" for="inlineCheckbox2">모두</label>
										</div>
									</div>
									<ul></ul>
									<div class="col">
										<div class="form-check form-check-inline">
											<input name="sr_aog" class="form-check-input" type="checkbox"
												id="inlineCheckbox1" value="10"> <label
												class="form-check-label" for="inlineCheckbox1">10대</label>
										</div>
										<div class="form-check form-check-inline">
											<input name="sr_aog" class="form-check-input" type="checkbox"
												id="inlineCheckbox2" value="20"> <label
												class="form-check-label" for="inlineCheckbox2">20대</label>
										</div>
										<div class="form-check form-check-inline">
											<input name="sr_aog" class="form-check-input" type="checkbox"
												id="inlineCheckbox1" value="30"> <label
												class="form-check-label" for="inlineCheckbox1">30대</label>
										</div>
										<div class="form-check form-check-inline">
											<input name="sr_aog" class="form-check-input" type="checkbox"
												id="inlineCheckbox2" value="40"> <label
												class="form-check-label" for="inlineCheckbox2">40대</label>
										</div>
										<div class="form-check form-check-inline">
											<input name="sr_aog" class="form-check-input" type="checkbox"
												id="inlineCheckbox1" value="50"> <label
												class="form-check-label" for="inlineCheckbox1">50대</label>
										</div>
										<div class="form-check form-check-inline">
											<input name="sr_aog" class="form-check-input" type="checkbox"
												id="inlineCheckbox2" value="60"> <label
												class="form-check-label" for="inlineCheckbox2">60대</label>
										</div>
									</div>
									<ul></ul>
									<div class="col">
										<select name="location" class="form-select"
											aria-label="Default select example">
											<option selected>응시지역</option>
											<option value="Seoul">서울</option>
											<option value="Incheon">인천</option>
											<option value="Gyeonggi">경기</option>
											<option value="Gangwon">강원</option>
											<option value="Chungnam">충남</option>
											<option value="Chungbuk">충북</option>
											<option value="Daejeon">대전</option>
											<option value="Jeonbuk">전북</option>
											<option value="Jeonnam">전남</option>
											<option value="Gwangju">광주</option>
											<option value="Gyeongnam">경남</option>
											<option value="Kyeongbuk">경북</option>
											<option value="Busan">부산</option>
											<option value="Daegu">대구</option>
											<option value="Ulsan">울산</option>
											<option value="Jeju">제주</option>
										</select>
									</div>
									<ul></ul>
									<div class="col">
										<input type="number" min="1" name="sr_capacity"
											class="form-control" placeholder="허용인원수">
									</div>
									<ul></ul>
								</div>

							</div>
							<div class="card-footer">
								<div class="d-grid gap-2">
									<input type="hidden" name="user_id" id="hiddenid" value="<%=info.getUser_id()%>" />
									<button type="submit" class="btn btn-primary">만들기</button>

								</div>

							</div>
						</div>
					</div>
				</form>
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
