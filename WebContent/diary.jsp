<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, bean.*, java.util.*"%>
 <jsp:useBean id="memMgr" class="dao.MemberMgr" />

<%  request.setCharacterEncoding("UTF-8");
   String pageNo = request.getParameter("pageNo");


%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Back packers</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
 
   <!-- popup -->
<script>
    function dcheck(){       // 팝업창 열기 함수
        //window.open(html파일,target,option...);
        window.open('popup.jsp','_blank','width=350,height=200');
       //window.open.location('popup.jsp?contentid=' + param,'_blank','width=350,height=200');
    }    
</script>

<style>
div.img {
       
    border: 0px solid #0000ff;
    height: 300px;
    width: 320px;
    float: left;
    text-align: center;
}   

div.img img {
    display: inline;
    
    border: 1px solid #ffffff;
}

div.img a:hover img {
    border: 0px solid #0000ff;
}

div.desc {
  text-align: center;
  font-weight: normal;
  width: 300px;
 
}
</style>
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="firstpage.jsp">Backpackers</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                
                <li class="dropdown">
                 <% 
         
		            String member_id = (String)session.getAttribute("idKey");
		         
		            if(member_id != null){
		               RegisterBean regBean = memMgr.memberMyRead(member_id);
		               
		               //String member_pw = regBean.getMember_pw();
		               String member_name = regBean.getMember_name();
		         %>
         
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <%=member_name %><b class="caret"></b></a>
                     <%
				         }else{
				     %>
                    <script type="text/javascript">
						alert("logout...");
						location.href = 'logout.jsp';
					</script>
                  <%
		            }
		         %>  
		                    
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i>Profile</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-envelope"></i>Inbox</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i>Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="logout.jsp"><i class="fa fa-fw fa-power-off"></i>Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li>
                        <a href="planyourtrip.jsp"><i class="fa fa-fw fa-dashboard"></i>Plan your trip</a>
                    </li>
                    <li>
                         <a href="attraction.jsp"><i class="fa fa-fw fa-bar-chart-o"></i>Attraction</a>
                    </li>
                    <li>
                        <a href="accommodation.jsp"><i class="fa fa-fw fa-table"></i>Accommodation</a>
                    </li>
                    <li>
                        <a href="shopping.jsp"><i class="fa fa-fw fa-edit"></i>Shopping</a>
                    </li>
                    <li>
                        <a href="food.jsp"><i class="fa fa-fw fa-desktop"></i>Food</a>
                    </li>
                    <li>
                     <li class="active">
                        <a href="diary.jsp"><i class="fa fa-fw fa-wrench"></i>Diary</a>
                    </li>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Diary
                        </h1>
                        <!-- 
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Dashboard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> Forms
                            </li>
                        </ol>
                         -->
                    </div>
                </div>
                
          <script>
        if (window.XMLHttpRequest)
        {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
        }
      else
        {// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
       //for(pageNo=1;pageNo<11;pageNo++){
         
        xmlhttp.open("GET","http://api.visitkorea.or.kr/openapi/service/rest/EngService/areaBasedList?ServiceKey=1EUls2nDhEdmwi9bF8O56vjnt9XW0B%2Fdq3ctZF2KW7oMHnC9UH6qVnWRLPCWddmBRyzFH0kDUsuKqDMqlG%2FsHA%3D%3D&contentTypeId=76&areaCode=1&arrange=B&listYN=Y&pageNo=<%=pageNo%>&numOfRows=12&MobileOS=ETC&MobileApp=Tour",false);
       
      xmlhttp.send();
      xmlDoc=xmlhttp.responseXML; 
      //document.write("aaaab")}
      //document.write("<table>");
      //document.write("<tr>");
      var x=xmlDoc.getElementsByTagName("item");
      var b=xmlDoc.getElementsByTagName("body");
            
      for (i=0;i<x.length;i++)
      { document.write("<div class='img'>")
      //document.write("<td>");
   
      //document.write("<a href='./attraction_view.jsp?contentid=" + x[i].getElementsByTagName("contentid")[0].childNodes[0].nodeValue + "'>");
      //document.write(x[i].getElementsByTagName("title")[0].childNodes[0].nodeValue);
      //document.write("</a></td><td>");
      
      //document.write("</td><td>");
      //document.write("<div>");
      
      document.write("<a href='./attraction_view.jsp?contentid=" + x[i].getElementsByTagName("contentid")[0].childNodes[0].nodeValue +"'>");
      
      var img_length = x[i].getElementsByTagName("firstimage") ;
      if (img_length.length==0 ){
         document.write("<img src='./img/no_images.jpg' border=0 width=270 height=220>");
      } else {
      document.write("<img src='");
      document.write(x[i].getElementsByTagName("firstimage")[0].childNodes[0].nodeValue);
      document.write("' width=300 height=220/> ");
      }
      //document.write("<br>");
      document.write("<div class='desc'>");
      document.write(x[i].getElementsByTagName("title")[0].childNodes[0].nodeValue);
      document.write("</div>");
      document.write("</a>");
      //document.write("<div>");
      //var img_length = x[i].getElementsByTagName("firstimage") ;
      //if (img_length.length==0 ){
      //   document.write("<img src='./img/no_images.jpg' border=0>");
      //} else {
      //document.write("<img src='");
      //document.write(x[i].getElementsByTagName("firstimage")[0].childNodes[0].nodeValue);
      //document.write("' width=200 /> ");
      //}
      //document.write("</td><td>");
   
      document.write("<a href='./memo.jsp?contentid="+ x[i].getElementsByTagName("contentid")[0].childNodes[0].nodeValue +"'>");
      
      document.write('<INPUT type="button" class="button" value="memo"/>');
      
      document.write("</a>");
      
      
      
      //document.write('<INPUT type="button" class="button" value="clip" onClick="dcheck();">');
      document.write("</div>");
         
      //document.write("</td>");
      
      }
       
       
      //page 
      //var x = xmlDoc.getElementsByTagName("totalCount"); 
      //var y = xmlDoc.getElementsByTagName("numOfRows"); 
      //var z = x/y
      //for (i=1;i<=z;i++){
    // document.write("<a href='/attraction.html?pageNo="+xmlDoc.getElementsByTagName("pageNo")[0].firstChild.nodeValue + "'>");
      // document.write("12345"); 
        //document.write(xmlDoc.getElementsByTagName("pageNo")[0].firstChild.nodeValue);
            
            
           
        //}
            
         //   if (xmlDoc.getElementsByTagName("pageNo")[0].firstChild[0].nodeValue=="<%=pageNo%>") {
               
            //   document.write("page"); 
         //   }
            
      //}
      //document.write("</tr>");
      //document.write("</table>");
       
                     
                    

      </script>
      
      
      </div>
            <!-- /.container-fluid -->
 
<!-- Pagination -->

<script>

function calc(x,y,op){
   var result;
   switch(op){
   case "/":
      result=x/y;
      break;
   }
   return result;
}
</script>
<script>
document.write("<div class='row text-center'>");
document.write("<div class='col-lg-12'>");
document.write("<ul class='pagination'>");
document.write("<li>");
document.write("<a href='#'>&laquo;</a>");               
document.write("</li>");             
                   // <a href="#">&laquo;</a>
        
        //var x = xmlDoc.getElementsByTagName("totalCount"); 
      //var y = xmlDoc.getElementsByTagName("numOfRows"); 
      a = xmlDoc.getElementsByTagName("totalCount")[0].firstChild.nodeValue;
       b = xmlDoc.getElementsByTagName("numOfRows")[0].firstChild.nodeValue;
       //div = parseInt;
      //a = 10;
      //b = 2;
      //c = parseInt(a);
      //d = parseInt(b);
      z = calc(a,b,"/");
       f = parseInt(z)+1;
       //document.write("<br>"+f+"<br>");
            // pageNo = request.getParameter("pageNo");       
                  // if (x[i].getElementsByTagName("pageNo")[0].childNodes[0].nodeValue=="<%=pageNo%>"){
                   
            for(pageNo=1;pageNo<=f;pageNo++){
            document.write("<li>");
            document.write("<a href='./diary.jsp?pageNo="+[pageNo] + "'>"+[pageNo]+"</a>"); }
            document.write("</li>");
            //document.write("1111aaaaa");} 
            //document.write("</a>");
            document.write("<li>");
document.write("<a href='#'>&raquo;</a>");               
document.write("</li>");  
            document.write(" </ul>");  
            document.write(" </div>"); 
            document.write(" </div"); 
             //</div>
         //</div>
            </script>  
                      
      

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
      
      
      
                <!-- /.row -->
   <!-- 
                <div class="row">
                    <div class="col-lg-6">

                        <form role="form">

                            <div class="form-group">
                                <label>Text Input</label>
                                <input class="form-control">
                                <p class="help-block">Example block-level help text here.</p>
                            </div>

                            <div class="form-group">
                                <label>Text Input with Placeholder</label>
                                <input class="form-control" placeholder="Enter text">
                            </div>

                            <div class="form-group">
                                <label>Static Control</label>
                                <p class="form-control-static">email@example.com</p>
                            </div>

                            <div class="form-group">
                                <label>File input</label>
                                <input type="file">
                            </div>

                            <div class="form-group">
                                <label>Text area</label>
                                <textarea class="form-control" rows="3"></textarea>
                            </div>

                            <div class="form-group">
                                <label>Checkboxes</label>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" value="">Checkbox 1
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" value="">Checkbox 2
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" value="">Checkbox 3
                                    </label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Inline Checkboxes</label>
                                <label class="checkbox-inline">
                                    <input type="checkbox">1
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox">2
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox">3
                                </label>
                            </div>

                            <div class="form-group">
                                <label>Radio Buttons</label>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>Radio 1
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">Radio 2
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios3" value="option3">Radio 3
                                    </label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Inline Radio Buttons</label>
                                <label class="radio-inline">
                                    <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline1" value="option1" checked>1
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline2" value="option2">2
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline3" value="option3">3
                                </label>
                            </div>

                            <div class="form-group">
                                <label>Selects</label>
                                <select class="form-control">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Multiple Selects</label>
                                <select multiple class="form-control">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>

                            <button type="submit" class="btn btn-default">Submit Button</button>
                            <button type="reset" class="btn btn-default">Reset Button</button>

                        </form>

                    </div>
                    <div class="col-lg-6">
                        <h1>Disabled Form States</h1>

                        <form role="form">

                            <fieldset disabled>

                                <div class="form-group">
                                    <label for="disabledSelect">Disabled input</label>
                                    <input class="form-control" id="disabledInput" type="text" placeholder="Disabled input" disabled>
                                </div>

                                <div class="form-group">
                                    <label for="disabledSelect">Disabled select menu</label>
                                    <select id="disabledSelect" class="form-control">
                                        <option>Disabled select</option>
                                    </select>
                                </div>

                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox">Disabled Checkbox
                                    </label>
                                </div>

                                <button type="submit" class="btn btn-primary">Disabled Button</button>

                            </fieldset>

                        </form>

                        <h1>Form Validation</h1>

                        <form role="form">

                            <div class="form-group has-success">
                                <label class="control-label" for="inputSuccess">Input with success</label>
                                <input type="text" class="form-control" id="inputSuccess">
                            </div>

                            <div class="form-group has-warning">
                                <label class="control-label" for="inputWarning">Input with warning</label>
                                <input type="text" class="form-control" id="inputWarning">
                            </div>

                            <div class="form-group has-error">
                                <label class="control-label" for="inputError">Input with error</label>
                                <input type="text" class="form-control" id="inputError">
                            </div>

                        </form>

                        <h1>Input Groups</h1>

                        <form role="form">

                            <div class="form-group input-group">
                                <span class="input-group-addon">@</span>
                                <input type="text" class="form-control" placeholder="Username">
                            </div>

                            <div class="form-group input-group">
                                <input type="text" class="form-control">
                                <span class="input-group-addon">.00</span>
                            </div>

                            <div class="form-group input-group">
                                <span class="input-group-addon"><i class="fa fa-eur"></i></span>
                                <input type="text" class="form-control" placeholder="Font Awesome Icon">
                            </div>

                            <div class="form-group input-group">
                                <span class="input-group-addon">$</span>
                                <input type="text" class="form-control">
                                <span class="input-group-addon">.00</span>
                            </div>

                            <div class="form-group input-group">
                                <input type="text" class="form-control">
                                <span class="input-group-btn"><button class="btn btn-default" type="button"><i class="fa fa-search"></i></button></span>
                            </div>

                        </form>

                        <p>For complete documentation, please visit <a href="http://getbootstrap.com/css/#forms">Bootstrap's Form Documentation</a>.</p>

                    </div>
                </div>
                <!-- /.row -->

            
</body>

</html>