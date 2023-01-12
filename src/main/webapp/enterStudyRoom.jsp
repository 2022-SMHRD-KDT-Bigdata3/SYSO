<%@page import="com.smhrd.model.tb_mysrVO"%>
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
<link href='main.css'rel='stylesheet'></link>
<script src='main.js'></script>
<!-- fullcalendar -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.css">
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.js"></script>
    
    
        <script type="text/javascript">
        var obj;
            document.addEventListener('DOMContentLoaded', function () {
                var calendarEl = document.getElementById('calendar');
                var calendar = new FullCalendar.Calendar(calendarEl, {
                    timeZone: 'UTC',
                    initialView: 'dayGridMonth', // 홈페이지에서 다른 형태의 view를 확인할  수 있다.
                    events:[ // 일정 데이터 추가 , DB의 event를 가져오려면 JSON 형식으로 변환해 events에 넣어주면된다.
                        {
                            title:'일정',
                            start:'2021-05-26 00:00:00',
                            end:'2021-05-27 24:00:00' 
                            // color 값을 추가해 색상도 변경 가능 자세한 내용은 하단의 사이트 참조
                        }
                    ], footerToolbar: {
                        right: 'addEventButton' // headerToolbar에 버튼을 추가
                    }, customButtons: {
                        addEventButton: { // 추가한 버튼 설정
                            text : "일정 추가",  // 버튼 내용
                            click : function(){ // 버튼 클릭 시 이벤트 추가
                                $("#calendarModal").modal("show"); // modal 나타내기
    
                                $("#addCalendar").on("click",function(){  // modal의 추가 버튼 클릭 시
                                    var user_id = $("#hiddenid").val();
                                    var content = $("#calendar_content").val();
                                    var start_date = $("#calendar_start_date").val();
                                    var end_date = $("#calendar_end_date").val();
                                    
                                    //내용 입력 여부 확인
                                    if(content == null || content == ""){
                                        alert("내용을 입력하세요.");
                                    }else if(start_date == "" || end_date ==""){
                                        alert("날짜를 입력하세요.");
                                    }else if(new Date(end_date)- new Date(start_date) < 0){ // date 타입으로 변경 후 확인
                                        alert("종료일이 시작일보다 먼저입니다.");
                                    }else{ // 정상적인 입력 시
                                        var obj = {
                                    		"user_id" : user_id,
                                            "title" : content,
                                            "start" : start_date,
                                            "end" : end_date
                                        }//전송할 객체 생성
    
                                        console.log(obj); //서버로 해당 객체를 전달해서 DB 연동 가능
                                    }
                                });
                            }
                        }
                    },
                    editable: true, // false로 변경 시 draggable 작동 x 
                    displayEventTime: false // 시간 표시 x
                });
                calendar.render();
            });
            
            

</script>

</head>
<body id="page-top">
	<!-- 세션에 사용자정보 가져오기 -->
	<%
	tb_user info = (tb_user) session.getAttribute("info");
	tb_mysrVO mysr_info = (tb_mysrVO) session.getAttribute("mysr_info"); 
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
							<li><a class="dropdown-item"
								href="studyCafe.jsp#masthead">나의 스터디모임</a></li>
							<li><a class="dropdown-item"
								href="studyCafe.jsp#searchRoom">스터디모임 찾기</a></li>
							<li><a class="dropdown-item"
								href="studyCafe.jsp#makeRoom">스터디모임 만들기</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link"
						href="mainPage.jsp#page-top">나의 일정</a></li>
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
	<button type="button" class="btn btn-danger btn-floating btn-lg"
		id="btn-back-to-top">
		<i class="fi fi-br-angle-small-up"></i>
	</button>
	<!-- header-->
	<header class="masthead">
		<div class="container px-4 px-lg-5 h-100">
			<div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
				<div class="container text-center">
                        <div class="row">
                          <div class="col align-self-center">
                            <h2 class="text-white font-weight-bold"><%=mysr_info.getSr_name()%></h2>
                            <hr class="divider" />
                          </div>        
                        </div><!--end title-->
                        <div class="container text-center"><!--캘린더, 출결,메모를 나눌 영역-->
                            <div class="row">
                              <div class="col-8">
                                  <!--캘린더 영역 시작-->
                                  <div class="card">
                                      <div class="card-body">
                                           <div id="calendarBox">
                                              <div id="calendar"></div>
                                          </div>
          
                      <!-- modal 추가 -->
                      <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                      aria-hidden="true">
                      <div class="modal-dialog" role="document">
                          <div class="modal-content">
                              <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel">일정을 입력하세요.</h5>
                                  <button type="button" id="sprintSettingModalClose"class="close" data-dismiss="modal" aria-label="Close">
                                      <span aria-hidden="true">&times;</span>
                                  </button>
                              </div>
                              <div class="modal-body">
                                  <div class="form-group">
                                      <input type="hidden" name="user_id"  id ="hiddenid" value="<%=info.getUser_id()%>"/>
                                      <label for="taskId" class="col-form-label">일정 내용</label>
                                      <input type="text" class="form-control" id="calendar_content" name="calendar_content">
                                      <label for="taskId" class="col-form-label">시작 날짜</label>
                                      <input type="date" class="form-control" id="calendar_start_date" name="calendar_start_date">
                                      <label for="taskId" class="col-form-label">종료 날짜</label>
                                      <input type="date" class="form-control" id="calendar_end_date" name="calendar_end_date">
                                  </div>
                              </div>
                              <div class="modal-footer">
                                  <button type="button" class="btn btn-warning" id="addCalendar">추가</button>
                                  <button type="button" class="btn btn-secondary" data-dismiss="modal"
                                      id="sprintSettingModalClose">취소</button>
                              </div>
                  
                          </div>
                      </div>
                  </div>
                                      </div>
                                  </div><!--캘린더 영역끝-->
                              </div>
                              <div class="col-4">
                                <div class="row">
                                    <div class="col">
                                        <div class="card" style="width: 18rem;">
                                            <div class="card-header">
                                                <h5>출결현황</h5>
                                            </div>
                                            <ul class="list-group list-group-flush">
                                              <li class="list-group-item">스터디원 A</li>
                                              <li class="list-group-item">스터디원 B</li>
                                              <li class="list-group-item">스터디원 C</li>
                                              <li class="list-group-item">스터디원 D</li>
                                            </ul>
                                            <div class="card-footer" >
                                                <div class="d-grid gap-2 col-6 mx-auto">
                                                    <button class="btn btn-primary" type="button">출석하기</button>
                                                  </div>
                                            </div>
                                         </div>
                                    </div>
                                </div>
                                <ul></ul>
                                <div class="row">
                                    <div class="col">
                                        <div class="card" style="width: 18rem;">
                                            <div class="card-header">
                                                <h5>메모</h5>
                                            </div>
                                            <div class="card-body">
                                                This is some text within a card body.
                                                This is some text within a card body.
                                                This is some text within a card body.
                                                This is some text within a card body.
                                                This is some text within a card body.
                                                This is some text within a card body.
                                              </div>
                                            <div class="card-footer">
                                                <div class="input-group input-group-sm mb-3">
                                                    <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                                    <button type="button" class="btn btn-primary btn-sm">게시</button>
                                                  </div>
                                            </div>
                                          </div>
                                    </div>
                                </div>
                              </div>
                            </div>
                          </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- 작성된 게시글 목록 출력?-->
        <section class="page-section" id="services">
            <div class="container px-4 px-lg-5">
                <h2 class="text-center mt-0">게시판</h2>
                <hr class="divider" />
                <div class="row gx-4 gx-lg-5">
                    <table class="table table-dark table-hover">
                        <tr>
                            <td>작성자</td>
                            <td>글제목</td>
                            <td>작성날짜</td>
                        </tr>
                        <tr>
                            <td>작성자</td>
                            <td>글제목</td>
                            <td>작성날짜</td>
                        </tr>
                        <tr>
                            <td>작성자</td>
                            <td>글제목</td>
                            <td>작성날짜</td>
                        </tr>
                      </table>
                </div>
            </div>
        </section>
        <!-- 게시글 작성-->
        <section class="page-section bg-dark text-white">
            <div class="container px-4 px-lg-5 text-center">
                <h3 class="text-white mt-0">글 작성하기</h3>
                        <hr class="divider divider-light" />
                        <!--<p class="text-white-75 mb-4">Start Bootstrap has everything you need to get your new website up and running in no time! Choose one of our open source, free to download, and easy to use themes! No strings attached!</p>-->
                        <div class="card text-end">
                            <div class="card-header">
                                <div class="mb-3">
                                    <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="제목">
                                  </div>
                            </div>
                            <div class="card-body">
                                <div class="mb-3">
                                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="내용"></textarea>
                                  </div>
                            </div>
                            <div class="card-footer ">
                                <a href="#" class="btn btn-primary">게시하기</a>
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

	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>


    
</body>
</html>
