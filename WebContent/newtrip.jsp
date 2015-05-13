<%@ page language="java" import="java.sql.*,java.util.*,java.text.*,bean.*, java.io.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <jsp:useBean id="memMgr" class="dao.MemberMgr" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" />
    <title>plan your new trip</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" type="text/css" href="css/register.min.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />

    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/register.min.js"></script>
    <script type="text/javascript">
    var datefield=document.createElement("input")
    datefield.setAttribute("type", "date")
    if (datefield.type!="date"){ //if browser doesn't support input type="date", load files for jQuery UI Date Picker
        document.write('<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />\n')
        document.write('<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"><\/script>\n')
        document.write('<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"><\/script>\n') 
    }
	if (datefield.type!="date"){ //if browser doesn't support input type="date", initialize date picker widget:
	    jQuery(function($){ //on document.ready
	        $('#startday').datepicker();
	    })
	}
	if (datefield.type!="date"){ //if browser doesn't support input type="date", initialize date picker widget:
    jQuery(function($){ //on document.ready
        $('#endday').datepicker();
   		 })
	}
</script>
    <style>
   #container1 {
       background-size: cover;
   }
   .centered-form {
       margin-top: 200px;
       margin-bottom: 200px;
   }
   .centered-form .panel {
       background: rgba(255, 255, 255, 0.8);
       box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
   }
	</style>
</head>
<body>
<script language="javascript">
function plan_save()
{
  var tr= document.trip;
  if(tr.plan_title.value =="")
  {
  alert("Input Plan title.");
  tr.plan_title.focus();
  }
  else if(tr.plan_st.value=="")
{
 alert("Input plan start day");
 tr.plan_st.focus();
}
  else if(tr.plan_end.value=="")
  {
   alert("Input plan end day");
   tr.plan_end.focus();
  }
  else if(confirm("Do you want to plan your trip?"))
  {
	  tr.action="newtripok.jsp";
	  tr.submit();
  }

}    

function go_cancel()
{
document.location.href("firstpage.jsp"); 
}

</script>
<div class="container">
<!-- Form  -->
<form name="trip" method="post">
 <div class="container" id="container1">
        <div class="row centered-form">
            <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center"> new plan </h3>
                    </div>
                    
                    <div class="panel-body">
                           <div class="form-group">
                           <%@ include file="dbconnector.jsp" %>
                           <%
							    String sql = "select count(*)+001 as COUNT from plan";
							    Statement stmt = conn.createStatement();
						        ResultSet rs = stmt.executeQuery(sql);
									rs.next() ;
									String COUNT =rs.getString("COUNT");
							%>
						 		 <input type="hidden" name="plan_code" class="form-control input-sm" value="plan<%=COUNT%>"> 
                                                      
                                <input type="text" name="plan_title" class="form-control input-sm" placeholder="plan title">
                            </div>
                         	 <div class="form-group">
                                start day<input type="date" name="plan_st"class="form-control input-sm" placeholder="start day">
                    		 </div>
               		  		 <div class="form-group">
                                end day<input type="date" name="plan_end" class="form-control input-sm" placeholder="end day">
                   			</div>
                     <% 
	         		 String member_id = (String)session.getAttribute("idKey");
		         	 if(member_id != null){
		               RegisterBean regBean = memMgr.memberMyRead(member_id);
		               //String member_pw = regBean.getMember_pw();
		               //String member_name = regBean.getMember_name();
		       		%>
                  	<input type="hidden" name="member_id" id="member_id" class="form-control input-sm" value="<%=member_id%>">
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
					<%
					String sql2 = "select plan.*, timestampdiff(day,plan_st, plan_end)as PERIOD from plan;";
					Statement stmt2 = conn.createStatement();
					ResultSet rs2 = stmt2.executeQuery(sql2);
					rs2.next();
					String PERIOD =rs2.getString("PERIOD");
					%>
		 <input type="text" name="plan_period" class="form-control input-sm" value="<%=PERIOD%>">
		 <%
								rs.close();
								rs2.close();
								stmt.close();
								stmt2.close();
								conn.close();
								%>  
        <input type="button" value="new plan start" class="btn btn-info btn-block" onclick="javascript:plan_save();">
	        </div>
           </div>
          </div>
        </div>
    </div>
</form>
</div>
</body>
</html>

   								