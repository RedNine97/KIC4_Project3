/**
 * 로그인/회원가입 유효성검사 jQuery
    작성자:강홍구
    작성날짜:2023.03.07
 */
function loginCheck() {
	//<input type="button" id="btnSend" value="전송">
	
		var id = document.getElementById("id")
        var pwd = document.getElementById("pwd")
		//1.id 입력체크
		//var id=$('#id').val();
        var regId = /^[a-zA-Z0-9]{4,12}$/;// id
		if(id.value == ""){
			$('#id_error').show();
			return false;
		}else{//한글자라도 입력한 경우
			$('#id_error').hide();
		}
		//아이디 영어 대소문자 확인(한글X)
        if(!regId.test(id.value)){
            $('#id_error1').show();
			 return false;
        }else {
			$('#id_error1').hide();
		}
		//2.pwd 입력체크
		var pwd=$('#pwd').val();
		if(pwd.length < 4){
			$('#pwd_error').show();
			return false;
		}else{//한글자라도 입력한 경우
			$('#pwd_error').hide();
		}
		
		//다 입력했다면 document.form객체명.submit()
		//=>action='register.jsp'
		$('#login').attr('action','U_LoginPageProc.shop').submit();
		return true;//전송이 가능하게 설정
	}

function registerCheck() {
			//다입력했는지 검증
			var mid = document.getElementById("memid");
	        var mpwd = document.getElementById("mem_passwd");
	        var mrepwd = document.getElementById("mem_repasswd");
	        var nickname=document.getElementById("mem_nick");
	        var memname=document.getElementById("mem_name");
	        var birthday=document.getElementById("mem_birthday");
	        var email=document.getElementById("mem_email");
	        var mphone=document.getElementById("mem_phone");
	        var zipcode=document.getElementById("zipcode_error");
	        var address=document.getElementById("mem_address");
	        
			//1.id 입력체크
			//var id=$('#id').val();
	        var regId = /^[a-zA-Z0-9]{4,12}$/;// id
	        
			if(mid.value == ""){
				mid.focus();
				$('#memid_error').show();
				return false;
			}else{//한글자라도 입력한 경우
				$('#memid_error').hide();
			}
			//아이디 영어 대소문자 확인(한글X)
	        if(!regId.test(mid.value)){
				mid.focus();
	            $('#nickname_error').show();
				 return false;
	        }else {
				$('#nickname_error').hide();
			}
			//중복체크 클릭했으면 지워라
			
			
			//2.pwd 입력체크
			if(mpwd.value == ""){
				mpwd.focus();
				$('#mempwd_error').show();
				return false;
			}else{//한글자라도 입력한 경우
				$('#mempwd_error').hide();
			}
			
			//3.repwd 입력체크
			if(mrepwd.value == ""){
				mrepwd.focus();
				$('#memrepwd_error').show();
				return false;
			}else{//한글자라도 입력한 경우
				$('#memrepwd_error').hide();
			}
			
			//4. 닉네임
			if(nickname.value == ""){
				nickname.focus();
				$('#nickname_error').show();
				return false;
			}else{//한글자라도 입력한 경우
				$('#nickname_error').hide();
			}
			
			//5. 이름
			if(memname.value == ""){
				memname.focus();
				$('#memname_error').show();
				return false;
			}else{//한글자라도 입력한 경우
				$('#memname_error').hide();
			}
			
			//생년월일
			if(!birthday.value){
				$('#birthday_error').show();
				return false;
			}else{//한글자라도 입력한 경우
				$('#birthday_error').hide();
			}
			
			//이메일
			if(email.value==""){
				email.focus();
				$('#email_error').show();
				return false;
			}else{//한글자라도 입력한 경우
				$('#email_error').hide();
			}
			var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
			if(!reg_email.test(email.value)) {
				$('#email_error1').show();
				return false;
			}else{//한글자라도 입력한 경우
				$('#email_error1').hide();
			}
			
			//휴대전화
			if(mphone.value==""){
				mphone.focus();
				$('#mphone_error').show();
				return false;
			}else{//한글자라도 입력한 경우
				$('#mphone_error').hide();
			}
			
			//우편번호
			if(zipcode.value==""){
				zipcode.focus();
				$('#zipcode_error').show();
				return false;
			}else{//한글자라도 입력한 경우
				$('#zipcode_error').hide();
			}
			
			//주소
			if(address.value==""){
				$('#addr_error').show();
				return false;
			}else{//한글자라도 입력한 경우
				$('#addr_error').hide();
			}
			
			//다 입력했다면 document.form객체명.submit()
			//=>action='register.jsp'
			$('#regForm').attr('action','U_RegisterProc.shop').submit();
			return true;//전송이 가능하게 설정
}

//id중복확인 검사 체크
function idCheck(memid){
	if(memid==""){
		$("#memid_error1").removeClass("hidden");
		document.regForm.memid.focus();
	}else{//입력했다면, jsp파일에게 매개변수를 전달
		$("#memid_error1").addClass("hidden");
		url="U_IdCheck.shop?memid="+memid;
   		window.open(url,"post","width=350,height=200,left=900,top=100");
	}
}

  function dongCheck(){
          if(document.zipForm.area3.value==""){
                 alert("동이름을 입력하세요");
                document.zipForm.area3.focus();
                   return;
                   }
       document.zipForm.submit();//U_ZipCheck.jsp  
   }
 
  function sendAddress(zipcode,area1,area2,area3,area4){
	 var addr=area1+" "+area2+" "+area3+" "+area4;
	  opener.document.regForm.zipcode.value=zipcode;
	  opener.document.regForm.addr.value=addr;
   	  self.close();
  }
  
//우편번호창을 열 수 있도록 함수호출
function zipCheck(){
 url="U_ZipCheck.jsp?check=y";
 window.open(url,"post","toolbar=no,width=500,height=400,left=900,top=100,directories=no,status=yes,scrollbars=yes,menubar=no");
}
