<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="bean.*, java.util.*"%>
 <jsp:useBean id="memMgr" class="dao.MemberMgr" />
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->  
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->  
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
<head>
     <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content=""> 
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title>Backpacker first main page</title>
    
    <link rel="shortcut icon" href="favicon.ico">  
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,300italic,400italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'> 
    <!-- Global CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Plugins CSS -->    
    <link rel="stylesheet" href="font-awesome/css/font-awesome.css">
    
    <!-- first CSS -->  
    <link id="theme-style" rel="stylesheet" href="css/styles.css">
    
    
    
   
   <!-- HTML5 Shiv and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>
<body>
 <header id="header" class="header"> 
    <div class="navbar navbar-default navbar-fixed-top">
        <div class="container">
        <h1 class="logo pull-left">
                <a class="scrollto" href="firstpage.jsp">
                    <span class="logo-title">backpacker</span>
                </a>
            </h1>
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                
            </div>
            <div class="navbar-collapse collapse navbar-right scroll-me">
                <ul class="nav navbar-nav ">
                   <% 
         
            String member_id = (String)session.getAttribute("idKey");
         	
            if(member_id != null){
               RegisterBean regBean = memMgr.memberMyRead(member_id);
               
               //String member_pw = regBean.getMember_pw();
               String member_name = regBean.getMember_name();
         %>
          
                  <li class="nav-item"><a class="scrollto"><%=member_name %></a></li>
                  <li class="nav-item"><a class="scrollto" href="logout.jsp">logout</a></li>
            <%
         }else{
         %>
                 
                  <li class="nav-item"><a class="scrollto" href="login.jsp">sign in</a></li>
                     <li class="nav-item"><a class="scrollto" href="signup.jsp">sign up</a></li>
            <%
            }
         %>             
                </ul>
            </div>

        </div>
    </div>
     </header>
    <!-- NAVBAR CODE END -->
    
    <!-- ******PROMO****** -->
    <section id="promo" class="promo section offset-header">
        <div class="container text-center">
            <h2 class="title"><span class="highlight">backpacker</span></h2>
            <p class="intro">Be your own travel guide</p>
            <div class="btns">
             
            <div  style=display:inline;>
             <a href="plan.jsp"> 
                <div class="btn btn-cta-secondary">Plan your new trip</div>
                 </a>
          </div>         
                <a class="btn btn-cta-primary" href="planyourtrip.jsp" target="_blank">modify your plan</a>
            </div>
            </div>            
        </div><!--//container-->
       
    </section><!--//promo-->
    
    
    <!-- FOOTER SECTION END-->
    <!-- REQUIRED SCRIPTS FILES -->
    <!-- CORE JQUERY FILE -->
    <script src="assets/js/jquery-1.11.1.js"></script>
    <!-- REQUIRED BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.js"></script>
    <!-- BACKGROUND VIDEO PLUGIN  -->
    <script src="assets/js/jquery.mb.YTPlayer.js"></script>
    <!-- SCROLLING SCRIPTS PLUGIN  -->
    <script src="assets/js/jquery.easing.min.js"></script>
    <!-- CUSTOM SCRIPTS   -->
    <script src="assets/js/custom.js"></script>

</body>

</html>