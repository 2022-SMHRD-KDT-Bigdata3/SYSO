<%@page import="com.smhrd.model.tb_srVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.tb_user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>TEAM SYSO - Study cafe with calendar</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap Icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <!-- SimpleLightbox plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />

    </head>
    <body id="page-top">
    <!-- 세션에 사용자정보 가져오기 -->
	<%
	tb_user info = (tb_user)session.getAttribute("info");
	%>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="main.html#page-top">SYSO</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link" href="main.html#page-top">홈</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                              스터디 카페
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="studyCafe.jsp#page-top">나의 스터디모임</a></li>
                                <li><a class="dropdown-item" href="studyCafe.jsp#searchRoom">스터디모임 찾기</a></li>
                                <li><a class="dropdown-item" href="studyCafe.jsp#makeRoom">스터디모임 만들기</a></li>
                            </ul>
                          </li>
                        <li class="nav-item"><a class="nav-link" href="mainPage.jsp#page-top">나의 일정</a></li>
                        <!-- 세션의 아이디값 확인 -->
					<%if (info!=null){ %>
					<li class="nav-item"><a class="nav-link"
						href="mainPage.jsp#page-top"><%=info.getUser_id()%>님 환영합니다</a></li>
					<%}else{ %>
					<h3>현재 아이디값 못찾음</h3><%} %>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Back to top button -->
        <button type="button" class="btn btn-danger btn-floating btn-lg" id="btn-back-to-top">
            <i class="fi fi-br-angle-small-up"></i>
        </button>
        <!-- header-->
        <header class="masthead">
            <div class="container px-4 px-lg-5 h-100">
                <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
                    <div class="container text-center">
                        <div class="row">
                          <div class="col align-self-center">
                            <h2 class="text-white font-weight-bold">검색 결과</h2>
                            <hr class="divider" />
                            
                          </div>
                      </div>
                    </div>
                </div>
            </div>
        </header>
        
               <!-- 스터디모임 찾기-->
        <section class="page-section" id="searchRoom">
            <div class="container px-4 px-lg-5">
                <h2 class="text-center mt-0">검색결과</h2>
                <hr class="divider" />
            </div>
            <div class="container px-4 px-lg-5">
                <div class="container text-center">
                    <div class="d-flex justify-content-center">
       <%ArrayList<tb_srVO>list = (ArrayList<tb_srVO>)request.getAttribute("searchList"); %>
        <div id="portfolio">
            <div class="container-fluid p-0">
                <div class="row g-0">
                    <%for(int i=0;i<list.size();i++){%>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box"title="Project Name">
                            <img class="img-fluid" src="assets/img/portfolio/thumbnails/1.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50"><%=list.get(i).getSr_start_date() %></div>
                                <div class="project-name"><%=list.get(i).getSr_name() %></div>
                                <ul></ul>
                                <button type="button" class="btn btn-outline-light">가입</button>
                            </div>
                        </a>
                    </div>
                    <%} %>
                </div>
            </div>
        </div>
                          
                    </div>
                  </div>
            </div>
        </section>

        
        
        <!-- 스터디모임생성-->
	<section class="page-section bg-dark text-white" id="makeRoom">
		<div class="container px-4 px-lg-5 text-center">
			<h2 class="mb-4">원하는 스터디모임을 만드세요</h2>
			<a class="btn btn-light btn-xl" href="makeStudy.jsp">스터디모임
				만들기</a>
		</div>
	</section>

        <!-- Footer-->
        <footer class="bg-light py-5">
            <div class="container px-4 px-lg-5"><div class="small text-center text-muted">Copyright &copy; 2023 - TEAM syso</div></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- SimpleLightbox plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>