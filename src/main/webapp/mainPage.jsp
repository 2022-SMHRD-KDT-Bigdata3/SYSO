<%@page import="com.smhrd.model.tb_calVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.tb_calDAO"%>
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
<!-- fullcalendar -->
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.css">
<script type="text/javascript"
   src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.js"></script>


<script type="text/javascript">
        var obj;
        var calendar = null; 
 //       var allEvent = null; 
 //      allEvent = loadingEvent(); 
        
            document.addEventListener('DOMContentLoaded', function () {
                var calendarEl = document.getElementById('calendar');
                calendar = new FullCalendar.Calendar(calendarEl, {
                    timeZone: 'UTC',
                    initialView: 'dayGridMonth', // 홈페이지에서 다른 형태의 view를 확인할  수 있다.
                    events:function(info, successCallback, failureCallback){
                        $.ajax({
                            url: 'calget',
                            dataType: 'json',
                            success: 
                                function(result) {          
                                    var events = [];                                   
                                    if(result!=null){                                        
                                            $.each(result, function(index, element) {
                                                var startdate=element.start1;
                                               var enddate=element.end1;
                                   
                                           
                                             if(enddate==null){
                                                 enddate=element.startdate;
                                             }                                             
                                        //     var startdate=moment(element.start1).format('YYYY-MM-DD');
                                        //     var enddate=moment(end1).format('YYYY-MM-DD');                                                                              
                                             events.push({
                                            	 		title: element.title,
                                                        start: startdate,
                                                        end: enddate                                                 
                                              }); //.push()                                          
                                        }); //.each()                                        
                                        console.log(events);                                        
                                    }//if end                           
                                    successCallback(events);                               
                                }//success: function end                          
                     }); //ajax end
                 }, 
                  footerToolbar: {
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
                                        $.ajax({
                                           url : "caladd",
                                           type : "post",
                                           data : {
                                              "user_id" : user_id,
                                                "title" : content,
                                                "start" : start_date,
                                                "end" : end_date
                                            },
                                            //dataType : "json",
                                            success : function(data){
                                               console.log(data);
                                            },
                                            error : function(){ alert("error"); }                                           
                                        });
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
            
      function allSave(){
               //전체 이벤트 데이터를 추출 할 수 있어야 한다.
               var allEvent = calendar.getEvents();
               console.log(allEvent)
               
               var events = new Array();
               for(var i=0; i<allEvent.length; i++){
                  var obj = new Object();   
                  obj.title =  allEvent[i]._def.title; //이벤트 명칭
                  obj.allDay = allEvent[i]._def.allDay; //하루종일의 이벤트인지 확인하는 불리언
                  obj.start =   allEvent[i]._instance.range.start;
                  obj.end = allEvent[i]._instance.range.end;                 
                  events.push(obj);                 
               } 
               var jsondata = JSON.stringify(events);
               console.log(jsondata)
               
               savedata(jsondata);
            }
      
      // 이벤트 불러오기
   /*   function loadingEvent(){
         var return_value = null;
         
         $.ajax({
              type : 'POST',
              url : '',
              data : {};,
              dataType : 'JSON',
              async : false,
              success : function(data){
                 return_value = data; 
                },
                error : function(){ 
                   alert("error"); }         
              })   
              return return_value;
      } */
      
      
            //추출된 이벤트 데이터를 서버에 넘기기 
        function savedata(jsondata){
               $.ajax({
                  type : 'POST',
                  url : 'caladd',
                  data : {"alldata" : jsondata},
                  dataType : 'text',
                  async : false,
                  success : function(data){
                       console.log(data);
                       alert("정상적으로 실행됨");
                    },
                    error : function(){ 
                       alert("error"); }         
                  })   
                  }  
            
       
        
            
<%
Gson gson = new Gson();
String content = (String)session.getAttribute("content");
System.out.println(content);

String result = gson.toJson(content);
System.out.println(result);
%>
</script>

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
            	   //디비확인용 콘솔확인
               tb_calDAO dao = new tb_calDAO();
               ArrayList<tb_calVO> list = dao.eventSelect(info.getUser_id());
               for (int i = 0; i < list.size(); i++) {
                   System.out.println(list.get(i).toString());
               }
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
               <h2 class="text-white font-weight-bold">사용자의 일정</h2>
               <hr class="divider" />
            </div>
            <div class="col-lg-8 align-self-baseline">
               <!--캘린더가 들어가는 자리-->
               <div class="card">
                  <div class="card-body">

                     <div id="calendarBox">
                        <div id="calendar"></div>
                     </div>
                     <!-- modal 추가 -->
                     <div class="modal fade" id="calendarModal" tabindex="-1"
                        role="dialog" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog" role="document">
                           <div class="modal-content">
                              <div class="modal-header">
                                 <h5 class="modal-title" id="exampleModalLabel">일정을
                                    입력하세요.</h5>
                                 <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                 </button>
                              </div>
                              <div class="modal-body">
                                 <div class="form-group">
                                    <input type="hidden" name="user_id" id="hiddenid"
                                       value="<%=info.getUser_id()%>" /> <input type="hidden"
                                       name="title" id="title" /> <input type="hidden"
                                       name="start" id="start" /> <input type="hidden"
                                       name="end" id="end" /> <label for="taskId"
                                       class="col-form-label">일정 내용</label> <input type="text"
                                       class="form-control" id="calendar_content"
                                       name="calendar_content"> <label for="taskId"
                                       class="col-form-label">시작 날짜</label> <input type="date"
                                       class="form-control" id="calendar_start_date"
                                       name="calendar_start_date"> <label for="taskId"
                                       class="col-form-label">종료 날짜</label> <input type="date"
                                       class="form-control" id="calendar_end_date"
                                       name="calendar_end_date">
                                 </div>
                              </div>
                              <div class="modal-footer">
                                 <button type="button" class="btn btn-warning"
                                    id="addCalendar" onclick="javascript:allSave(); " onclick="javescripe:loadingEvent();">추가</button>
                                 <button type="button" class="btn btn-secondary"
                                    data-dismiss="modal" id="sprintSettingModalClose">취소</button>
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

   <!-- 스터디모임 추천-->
   <section class="page-section" id="services">
      <div class="container px-4 px-lg-5">
         <h2 class="text-center mt-0">추천 스터디</h2>
         <hr class="divider" />
      </div>
   </section>
   <div id="portfolio">
      <div class="container-fluid p-0">
         <div class="row g-0">
            <div class="col-lg-4 col-sm-6">
               <a class="portfolio-box" href="assets/img/portfolio/fullsize/1.jpg"
                  title="Project Name"> <img class="img-fluid"
                  src="assets/img/portfolio/thumbnails/1.jpg" alt="..." />
                  <div class="portfolio-box-caption">
                     <div class="project-category text-white-50">Category</div>
                     <div class="project-name">Project Name</div>
                     <ul></ul>
                     <button type="button" class="btn btn-outline-light">가입</button>
                  </div>
               </a>
            </div>
            <div class="col-lg-4 col-sm-6">
               <a class="portfolio-box" href="assets/img/portfolio/fullsize/2.jpg"
                  title="Project Name"> <img class="img-fluid"
                  src="assets/img/portfolio/thumbnails/2.jpg" alt="..." />
                  <div class="portfolio-box-caption">
                     <div class="project-category text-white-50">Category</div>
                     <div class="project-name">Project Name</div>
                     <ul></ul>
                     <button type="button" class="btn btn-outline-light">가입</button>
                  </div>
               </a>
            </div>
            <div class="col-lg-4 col-sm-6">
               <a class="portfolio-box" href="assets/img/portfolio/fullsize/3.jpg"
                  title="Project Name"> <img class="img-fluid"
                  src="assets/img/portfolio/thumbnails/3.jpg" alt="..." />
                  <div class="portfolio-box-caption">
                     <div class="project-category text-white-50">Category</div>
                     <div class="project-name">Project Name</div>
                     <ul></ul>
                     <button type="button" class="btn btn-outline-light">가입</button>
                  </div>
               </a>
            </div>
            <div class="col-lg-4 col-sm-6">
               <a class="portfolio-box" href="assets/img/portfolio/fullsize/4.jpg"
                  title="Project Name"> <img class="img-fluid"
                  src="assets/img/portfolio/thumbnails/4.jpg" alt="..." />

                  <div class="portfolio-box-caption">
                     <div class="project-category text-white-50">Category</div>
                     <div class="project-name">Project Name</div>
                     <ul></ul>
                     <button type="button" class="btn btn-outline-light">가입</button>
                  </div>
               </a>
            </div>
            <div class="col-lg-4 col-sm-6">
               <a class="portfolio-box" href="assets/img/portfolio/fullsize/5.jpg"
                  title="Project Name"> <img class="img-fluid"
                  src="assets/img/portfolio/thumbnails/5.jpg" alt="..." />
                  <div class="portfolio-box-caption">
                     <div class="project-category text-white-50">Category</div>
                     <div class="project-name">Project Name</div>
                     <ul></ul>
                     <button type="button" class="btn btn-outline-light">가입</button>
                  </div>
               </a>
            </div>
            <div class="col-lg-4 col-sm-6">
               <a class="portfolio-box" href="assets/img/portfolio/fullsize/6.jpg"
                  title="Project Name"> <img class="img-fluid"
                  src="assets/img/portfolio/thumbnails/6.jpg" alt="..." />
                  <div class="portfolio-box-caption p-3">
                     <div class="project-category text-white-50">Category</div>
                     <div class="project-name">Project Name</div>
                     <ul></ul>
                     <button type="button" class="btn btn-outline-light">가입</button>
                  </div>
               </a>
            </div>
         </div>
      </div>
   </div>
   <!-- 스터디모임생성-->
   <!-- 스터디 -->
   <section class="page-section bg-dark text-white">
      <div class="container px-4 px-lg-5 text-center">
         <h2 class="mb-4">원하는 스터디모임을 만드세요</h2>
         <a class="btn btn-light btn-xl" href="makeStudy.jsp">스터디모임 만들기</a>
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