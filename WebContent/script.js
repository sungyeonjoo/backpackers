function checkId(member_id){
	var member_id = document.joinForm.member_id;
	
	if(member_id==""){
		alert("아이디를 입력해 주세요");
		member_id.focus();		
	}else{
		var url = "idcheck.jsp?member_id="+member_id;
		window.open(url, "post","width=500,height=500");
	}
	
}

function win_close(){
	self.close();
}

function inputCheck(){
	var frm = document.joinForm;
	
	if(frm.member_id.value==""){
		alert("아이디를 입력해주세요");
		frm.member_id.focus();
		return;
	}
	if(frm.member_pw.value==""){
		alert("비밀번호를 입력해주세요");
		frm.member_pw.focus();
		return;
	}
	if(frm.member_pwconfirm.value ==""){
		alert("비밀번호 확인을 입력해주세요.");
		frm.member_pwconfirm.focus();
		return;
	}
	if(frm.member_pw.value != frm.member_pwconfirm.value){
		alert("비밀번호가 일치하지 않습니다.");
		frm.member_pwconfirm.focus();
		return;		
	}
	if(frm.member_name.value == ""){
		alert("이름을 입력해주세요.");
		frm.member_name.focus();
		return;		
	}
	
	var str = frm.member_id.value;
	var atPos = str.indexOf('@');
	var atLastPos = str.lastIndexOf('@');
	var dotPos = str.indexOf('.');
	var spacePos = str.indexOf(' ');
	var commaPos = str.indexOf(',');
	var eMailSize = str.length;
	
	if(atPos > 1 && atPos == atLastPos && dotPos >3 && spacePos == -1 && commaPos == -1 && atPos+1 < dotPos && dotPos +1 < eMailSize){
		
	}else{
		alert("잘못된 이메일 형식입니다.");
		frm.member_id.focus();
		return;
	}
	
	frm.submit();
}

