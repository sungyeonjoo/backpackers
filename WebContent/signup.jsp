<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>sign up</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" type="text/css" href="css/register.min.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />

    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/register.min.js"></script>
    <script type="text/javascript" src="script.js"></script>
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

<%@ page contentType="text/html; charset=utf-8" %>



</head>
<body>

<!-- 
<script>
function MM_setTextOfTextfield(objId,x,newText) { //v9.0
	  with (document){ if (getElementById){
	    var obj = getElementById(objId);} if (obj) obj.value = newText;
	  }
	}
	function MM_goToURL() { //v3.0
	  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
	  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
	}

function inputCheck(){
 var frm = document.joinForm;
 var member_name = document.form.member_name.value;
 var member_id = document.form.member_id.value;
 var member_pw = document.form.member_pw.value;
 if (member_name.length == 0 || member_name == null) {
	  alert("Enter your name.");
	  document.form.member_name.focus();
	  return;
	 }
 if (member_id.length == 0 || member_id == null) {
  alert("Enter your email address.");
  document.form.member_id.focus();
  return;
 }
 if (member_pw.length == 0 || member_pw == null) {
  alert("Enter your password.");
  document.form.member_pw.focus();
  return;
 }
 
	 
 document.form.submit();
}

</script>

 -->



<div class="container">
<!-- Registration Form - START -->
 <div class="container" id="container1">
        <div class="row centered-form">
            <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center"> Please sign up </h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="signupok.jsp" method="post">
                            <div class="form-group">
                                <input type="text" name="member_name" id="member_name" class="form-control input-sm" placeholder="Name" required>
                            </div>
                            <div class="form-group">
                                <input type="email" name="member_id" id="member_id" class="form-control input-sm" placeholder="Email Address" required>
                            </div>  
                            	
                            <div class="form-group">
                                        <input type="password" name="member_pw" id="member_pw" class="form-control input-sm" placeholder="Password" required>
                                    	<br/>
                                  <!--  <input type="password" name="member_pwconfirm" id="member_pwconfirm" class="form-control input-sm" placeholder="Confirm Password" required>  	 -->
                            </div>
                           
                            <input type="submit" value="sign up" class="btn btn-info btn-block" onClick="inputCheck()">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- Registration Form - END -->
</div>

<!-- 
	<script> 
		function writeCheck()
		  {
		   var form = document.writeform;
		   
		   if( !form.member_name.value )   // form 에 있는 name 값이 없을 때
		   {
		    alert( "이름을 적어주세요" ); // 경고창 띄움
		    form.member_name.focus();   // form 에 있는 name 위치로 이동
		    return;
		   }
		   
		   if( !form.member_pw.value )
		   {
		    alert( "비밀번호를 적어주세요" );
		    form.member_pw.focus();
		    return;
		   }
		   
		  if( !form.member_email.value )
		   {
		    alert( "EMAIL ADDRESS을 적어주세요" );
		    form.member_email.focus();
		    return;
		   }
		 
		 
		 
		  form.submit();
		  }
 </script>
 -->




</body>
</html>