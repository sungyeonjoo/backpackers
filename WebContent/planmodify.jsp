<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="bean.*, java.util.*"%>
 <jsp:useBean id="memMgr" class="dao.MemberMgr" />
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->  
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->  
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  

<head>
<meta charset="utf-8" />
    <title>plan</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" type="text/css" href="css/planbootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />

    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">

<div class="page-header">
 
    <h1>Plan List <small>Backpacker Plan List</small>
    
     </h1>
     
</div>

<!-- Feature List - START -->
<a href="planyourtrip.jsp" id="new" class="btn btn-success lower">plan your new trip</a>
<div class="container" id="cnt1">
 
    <div class="row feature">
        <div class="col-md-4">
            <div>
                <img src="" alt="Texto Alternativo" class=" img-circle img-thumbnail">
                <h2>Admin Portal</h2>
                
                <a href="planyourtrip.jsp" class="btn btn-success lower">See Feature details</a>
            </div>
        </div>

        <div class="col-md-4">
            <div>
                <img src="" alt="Texto Alternativo" class="img-circle img-thumbnail">
                <h2>Project Portfolio</h2>
                
                <a href="planyourtrip.jsp" class="btn btn-success lower">See Feature details</a>
            </div>
        </div>

        <div class="col-md-4">
            <div>
                <img src="" alt="Texto Alternativo" class="img-circle img-thumbnail">
                <h2>Personal Website</h2>
                <p>
                
                   
                </p>
                <a href="planyourtrip.jsp" class="btn btn-success lower">See Feature details</a>
            </div>
        </div>
    </div>
   
</div>

 


<style>
 #cnt1 {            
     background-color:rgb(245, 245, 220);
     width:90%;
     margin-bottom:70px;
 }
  
 .feature{
     padding: 20px 0;
    text-align: center;
 }
 .feature > div > div{
    padding: 10px;
    border: 1px solid transparent;
    border-radius: 4px;
    transition: 0.2s;
 }
 .feature > div:hover > div{
    margin-top: -10px;
    border: 1px solid rgb(128, 128, 128);
    box-shadow: rgba(0, 0, 0, 0.1) 0px 5px 5px 5px;
    background: rgba(232, 215, 215, 0.10);
    transition: 0.3s;
 }
 
 #new{
 position: relative;
 z-index:99999;
 margin-left:80%;
 bottom: 10px;
 background-color: rgb(216, 191, 216);
 border-color: rgb(216, 191, 216);
 color: rgb(0, 0, 0);
 
 font-size: 15px;
 }
</style>

<!-- Feature List - END -->

</div>
<script>

   function get_plan_list(){
      var mb_srl = $('#my_top').attr('data');
      $.ajax({
         type: "POST",
         url: "/api/plan/get_plan_list",
         data: {"member_srl": mb_srl},
         success: function(data) {
            console.log(data);
            var html = '';

            $.each(data.response_data, function(key, val) {
               //console.log(val.tour_day);
               if(val.tour_day >1){
                  t_night = Number(val.tour_day) - 1;
                  td_txt = t_night+'박 '+val.tour_day+'일';
               }else{
                  td_txt =  val.tour_day+'일';
               }

               if(val.is_complete == '1'){                  
                  html += '<a href="/mypage/et_0428853001426441116?type=plan_sub&gdb_srl='+val.pn_srl+'" class="box" '+plan_margin+'>';
                                    html += '<div class="btn_del" onclick="del_plan('+val.pn_srl+')"><img src="/res/img/mypage/common/btn_delete.png" alt=""></div>';
                                    html += '<div class="plan_hidden_btn">상세일정 보기</div>';
                  html += '<div class="plan_bg"><div class="plan_bg_inner"><span>'+td_txt+'</span>&nbsp;'+val.pn_title+'</div></div>';
                  html += '<img src="'+val.cover_img_url+'" alt="" class="plan_img"></a>';
               }else{
                                    html += '<a href="/plan/workspace?pn_srl='+val.pn_srl+'" class="box">';
                                                      html += '<div class="btn_del" onclick="del_plan('+val.pn_srl+')"><img src="/res/img/mypage/common/btn_delete.png" alt=""></div>';
                                    
                  html += '<img src="/res/img/mypage/plan/plan_nocomplete.png" alt="" class="no_complete">';
                                    html += '<div class="plan_hidden_btn">일정편집</div>';
                                    
                  html += '<div class="plan_bg"><div class="plan_bg_inner"><span>'+td_txt+'</span>&nbsp;'+val.pn_title+'</div></div>';
                  html += '<img src="'+val.cover_img_url+'" alt="" class="plan_img">';
               
                  html += '</a>';
            
                  
               }

               
               $('#content .plan_inner').html(html);
               //console.log('aaaaaaa');
               
            });
               if(html == ''){
                  html += '<div id="no_result_box" style="display: block;"><img src="/res/img/common/no_result_icon.png"><div class="no_result_text">아직 작성하신 여행일정이 없습니다.</div></div>';
                  $('#loading_box').html(html);
                  //$('#loading_box').hide();
               }
         },
         error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
         }
      });

   }
$(document).on('click', ".btn_del", function(e) { 
    e.stopPropagation();
    e.preventDefault();
    
});


   function del_plan(pn_srl){
      if (confirm("일정을 삭제하시겠습니까?") == true){    //확인
        
         $.ajax({
         type: "POST",
         url: "/api/plan/del_plan_info",
         data: {"pn_srl": pn_srl},
         success: function(data) {
            get_plan_list();
         }
         });
      }else{   //취소
          return;
      }   
   }
</script>   

</body>
</html>