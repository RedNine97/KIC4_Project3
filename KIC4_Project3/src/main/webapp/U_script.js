  $(function(){
	//pwd찾기 인증코드 버튼
	$("#scPwdBotton").on("click", function(){
	    var memname =document.getElementById("memname_search");
		var memnameDb =document.getElementById("memnameDb");
		var email=document.getElementById("email_search");
		var emailDb=document.getElementById("emailDb");
		
		//id로 검색한 DB에 저장되어 있는 이름이 사용자가 입력한 값과 다르다면
	    if(memname.value != memnameDb.value){
			$('#searchname_error2').show();
			return false;
		}else{
			$('#searchname_error2').hide();
		}
		
		//id로 검색한 DB에 저장되어 있는 이메일이 사용자가 입력한 값과 다르다면
		if(email.value != emailDb.value){
			$('#searchemail_error3').show();
			return false;
		}else{
			$('#searchemail_error3').hide();
		}
	
		return SearchCheck();
	});
	//id찾기 인증코드 버튼
	$("#shIdButton").on("click", function(){
		return SearchCheck();
	});
	
	//아이디&비밀번호 찾기 검사
	function SearchCheck(){//memname,email
		let email = $("#email_search").val();
		let memname = $("#memname_search").val();
		let reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		
		if(email !="" && reg_email.test(email)){
	   		$.ajax({
			url: "U_EmailSend.shop",
			type: "post",
			data: {"email" : email,"memname":memname},
			beforeSend: function(){
				$('#searchemail_error').hide();
				$('#searchname_error').hide();
				$('#searchemail').show();
			},
			success: function(key){
				$('#searchemail').hide();
				alert("인증번호를 발송했습니다.\n인증번호가 오지 않으면 입력하신 정보가 회원정보와 일치하는지 확인해주세요.");
	    		//alert("response : "+key.replace(/\s/g,''));//전달받는 데이터 확인
				$("#randomKey").val(key.replace(/\s/g,''));
				},
				error: function(){
					$('#searchemail').hide();
					alert("메일발송 실패!");
				}
			});
		}else{
	   		alert("이메일을 정확히 기입해주세요.");
		}
		return true;
	}
	//회원가입
	//function inputCheck() {
	$("#inputCheck").on("click", function(){
      var regId = /^[a-zA-Z0-9]{4,12}$/;// id
	        
			if($('#mem_id').val() == ""){
				$('#mem_id').focus();
				$('#required_id').removeClass("hidden")
				return false;
			}else{//한글자라도 입력한 경우
				$('#required_id').addClass("hidden")
			}
			
			//아이디 영어 대소문자 확인(한글X)
	        if(!regId.test($('#mem_id').val())){
				$('#mem_id').focus();
	            $('#mem_id_empty').removeClass("hidden")
				 return false;
	        }else {
				$('#mem_id_empty').addClass("hidden")
			}
			
			//2.pwd 입력체크
			if($('#mem_passwd').val() == ""){
				$('#mem_passwd').focus();
				return false;
			}else{//한글자라도 입력한 경우
			}
			
			//3.repwd 입력체크
			if($('#mem_repasswd').val() == ""){
				$('#mem_repasswd').focus();
				return false;
			}else{//한글자라도 입력한 경우
			}
			
			if($('#mem_passwd').val() != $('#mem_repasswd').val()){
			$('#mem_passwd').focus();
				return false;
			}else{//틀릴경우
			}
			
			//비밀번호 길이 안맞으면
			if($('#mem_passwd').val().length <4){
				$('#mem_passwd').focus();
				return false;
			}else if($('#mem_repasswd').val().length <4){
				$('#mem_repasswd').focus();
				return false;
			}
			
			//4. 닉네임
			if($('#mem_nick').val() == ""){
				$('#mem_nick').focus();
				$('#required_nick').removeClass("hidden")
				return false;
			}else{//한글자라도 입력한 경우
				$('#required_nick').addClass("hidden")
			}
			
			//5. 이름
			if($('#mem_name').val() == ""){
				$('#mem_name').focus();
				$('#required_name').removeClass("hidden")
				return false;
			}else{//한글자라도 입력한 경우
				$('#required_name').addClass("hidden")
			}
			
			//생년월일
			 if(!$("#mem_birthday").val()){
		        $("#birthday_length").removeClass("hidden")
		        return false;
		      }else{
		        $("#birthday_length").addClass("hidden")
		      }
		     
			//이메일
			if($('#mem_email').val()==""){
				$('#mem_email').focus();
				$('#required_email').removeClass("hidden")
				return false;
			}else{//한글자라도 입력한 경우
				$('#required_email').addClass("hidden")
			}
			var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
			if(!reg_email.test($('#mem_email').val())) {
				$('#em_x').removeClass("hidden")
				return false;
			}else{//한글자라도 입력한 경우
				$('#em_x').addClass("hidden")
			}
			
			//휴대전화
			 if($("#mem_phone").val().length<8){
		        $('#mem_phone').focus();
		        $("#phone_length").removeClass("hidden")
		        return false;
		      }else{
		        $("#phone_length").addClass("hidden")
		      }
		      
			//우편번호
			if($('#mem_zipcode').val()==""){
				$('#mem_zipcode').focus();
				$('#required_zipcode').removeClass("hidden")
				return false;
			}else{//한글자라도 입력한 경우
				$('#required_zipcode').addClass("hidden")
			}
			
			//주소
			if($('#mem_address').val()==""){
				$('#mem_address').focus();
				$('#required_address').removeClass("hidden")
				return false;
			}else{//한글자라도 입력한 경우
				$('#required_address').addClass("hidden")
			}
			
			alert("잠깐! ID중복확인을 하셔야 원활한 회원가입을 진행하실 수 있습니다.")
			//다 입력했다면 document.form객체명.submit()
			//=>action='register.jsp'
			$('#regForm').attr('action','U_RegisterProc.shop').submit();
			return true;//전송이 가능하게 설정
    })
	$("#mem_email").keyup (function () {
		if($("#mem_email").val()){
			$('#required_email').addClass("hidden")
			$('#em_x').addClass("hidden")
		}
	})
});

function lengthCheck() {      
      if($("#mem_birthday").val()=="연도-월-일"){
        $("#birthday_length").removeClass("hidden")
      }else{
        $("#birthday_length").addClass("hidden")
      }
    }
    
//아이디 찾기페이지
function searchidCheck() {
	var memname =document.getElementById("memname_search");
	var email=document.getElementById("email_search");
	var userkey=document.getElementById("userkey");
	var randomKey=document.getElementById("randomKey");
	
	var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	//이름
	if(memname.value==""){
		memname.focus();
		$('#searchname_error').show();
		return false;
	}else{//한글자라도 입력한 경우
		$('#searchname_error').hide();
	}
	
	//이메일
	if(email.value==""){
		email.focus();
		$('#searchemail_error').show();
		return false;
	}else{//한글자라도 입력한 경우
		$('#searchemail_error').hide();
	}
	if(!reg_email.test(email.value)) {
		$('#searchemail_error2').show();
		return false;
	}else{//한글자라도 입력한 경우
		$('#searchemail_error2').hide();
	}
	
	var engNum = /^[a-zA-Z0-9]*$/;//영어+숫자(정규식)
	//인증코드 유효성 검사
	if(userkey.value=="" || !engNum.test(userkey.value) || userkey.value.length <8){
		$('#key').show();
		return false;
	}else if(randomKey.value!==userkey.value && userkey.value.length >= 8){
		alert("이메일로 발송된 인증코드와 일치하지 않습니다.");
		return false;
	}else{
		$('#key').hide();
	}
	
	document.SearchId.submit();
	return true;//전송이 가능하게 설정
}

//비밀번호 찾기 - 아이디 유효성검사
function searchpwdCheck() {
	var regmemid=/[ㄱ-힣~!@#$%^&*()_+|<>?:{}=,.`'";\-\/\[\]\\ ]/gi;
	var memid =document.getElementById("pwd_mem_id");
	
	//아이디
	if(memid.value=="" || regmemid.test(memid.value)){
		memid.focus();
		alert("아이디를 정확하게 입력해 주세요");
		return false;
	}
	
	document.SearchPwd.submit();
	return true;//전송이 가능하게 설정
}

//비밀번호 찾기 - 이메일 보내기
function searchpwd2Check() {
	var memname =document.getElementById("memname_search");
	var email=document.getElementById("email_search");
	var userkey=document.getElementById("userkey");
	var randomKey=document.getElementById("randomKey");
	
	var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	//이름
	if(memname.value==""){
		memname.focus();
		$('#searchname_error').show();
		return false;
	}else{//한글자라도 입력한 경우
		$('#searchname_error').hide();
	}
	
	//이메일
	if(email.value==""){
		email.focus();
		$('#searchemail_error').show();
		return false;
	}else{//한글자라도 입력한 경우
		$('#searchemail_error').hide();
	}
	
	if(!reg_email.test(email.value)) {
		$('#searchemail_error2').show();
		return false;
	}else{
		$('#searchemail_error2').hide();
	}
	
	var engNum = /^[a-zA-Z0-9]*$/;//영어+숫자(정규식)
	//인증코드 유효성 검사
	if(userkey.value=="" || !engNum.test(userkey.value) || userkey.value.length <8){
		$('#key').show();
		return false;
	}else if(randomKey.value!==userkey.value && userkey.value.length >= 8){
		alert("이메일로 발송된 인증코드와 일치하지 않습니다.");
		return false;
	}else{
		$('#key').hide();
	}
	
	document.SearchPwdProc.submit();
	return true;//전송이 가능하게 설정
}
//비밀번호 변경
function searchUpdateCheck(){
	var pwd =document.getElementById("mem_passwd");
	var repwd =document.getElementById("mem_repasswd");
	
	if(pwd.value==""){
		pwd.focus();
		return false;
	}
	
	if(repwd.value==""){
		repwd.focus();
		return false;
	}
	
	document.SearchPwdUpdate.submit();
	return true;//전송이 가능하게 설정
}

//로그인페이지
function loginCheck(){//로그인페이지 에러메세지(아이디, 비밀번호)
  if(mem_id.value==""){
    document.getElementById("error_message").innerHTML='<p class="text-justify text-sm text-red-500 mb-3">아이디를 입력해주세요.</p>'
  return false;
  }
  if(mem_pass.value==""){
    document.getElementById("error_message").innerHTML='<p class="text-justify text-sm text-red-500 mb-3">비밀번호를 입력해주세요.</p>'
  return false;
  }
  document.login.submit();
  
}

$(document).ready(() => {
	$("#mem_id,#mem_pass").on("keydown keyup", (function(e){
		if (e.keyCode == 13){
			return  loginCheck();
		}
	}))
})


function checkCapsLock(event){//CapsLock 경고메세지
  if(event.getModifierState("CapsLock")) {
    document.getElementById("error_message").innerHTML='<p class="text-justify text-sm text-red-500 mb-3">CapsLock이 켜져 있습니다.</p>'
  }else{//CapsLock을 껐을 경우 바로 없애기 위해
    document.getElementById("error_message").innerHTML
      = ""
  }
}

//회원가입 페이지
    $(document).ready(() => {
      $("#mem_passwd").keyup (function () {
        if ($("#mem_passwd").val() != "") {
          if ($("#mem_passwd").val().length < 4) {//4글자미만(조건식 간략화)
            $("#con_passwd").removeClass("hidden");
          } else {
            $("#con_passwd").addClass("hidden");
          }
          $("#required_passwd").addClass("hidden");
        }
      });
    })

    
    function ps_eq(){ 
      let pw1=$("#mem_passwd").val();
      let pw2=$("#mem_repasswd").val();

      if(pw1!="" && pw2!=""){
        if(pw1==pw2 && pw2.length>=4){//비밀번호 일치
          $("#ps_o").removeClass("hidden");
          $("#ps_x").addClass("hidden");
          
        }else if(pw1!=pw2 && pw2.length>=4){//비밀번호 불일치
          $("#ps_x").removeClass("hidden");
          $("#ps_o").addClass("hidden");
        }else if(pw2.length<4){//비밀번호 확인란이 4글자 미만일때
          $("#ps_x").addClass("hidden");
          $("#ps_o").addClass("hidden");     
        } 
      }else{
        $("#ps_x").addClass("hidden");
        $("#ps_o").addClass("hidden");
        $('#required_repasswd').addClass("hidden")
		$('#required_passwd').addClass("hidden")
      }return [$("#required_passwd").addClass("hidden"),
        $("#required_repasswd").addClass("hidden")];
        /* 주의:줄 맞춘다고 리턴 바로 뒤에 엔터치지 말것 */
    }

    let rtc ="propertychange change keyup paste input";
    $(document).ready(() => {$("#mem_repasswd, #mem_passwd").on(rtc, ps_eq);})

    /*$(document).ready(() => {$("#mem_email").on(rtc,function(){       
        if($("#mem_email").val()!=""){        
          if($("#mem_email").val().match("@")){//@ 쓰면
            $("#em_x").addClass("hidden");
          }else{//@ 안쓰면          
            $("#em_x").removeClass("hidden");
          } 
          return $("#required_email").addClass("hidden"); 
        }
        
      });
    })*/

    $('#mem_id').keyup(function(){
      $(this).val(($(this).val().replace(/[ㄱ-힣~!@#$%^&*()_+|<>?:{}=,.`'";\-\/\[\]\\ ]/gi,'')));
    });

    function isNum(){
      $(this).val($(this).val().replace(/[^0-9]/g, ''));
    }
    /* 숫자만 입력하는 부분은 아이디 입력에서 했던 방식과 같은 방법을 사용할수도 있으나 다른 방식으로도 적용함 */
    
    //id중복확인 검사 체크
function idCheck(memid){
	if($("#mem_id").val()==""){
		$("#mem_id_empty").removeClass("hidden");
		document.regForm.memid.focus();
	}else{//입력했다면, jsp파일에게 매개변수를 전달
		$("#mem_id_empty").addClass("hidden");
		url="U_IdCheck.shop?memid="+memid;
   		window.open(url,"post","width=350,height=200,left=900,top=100");
	}
}

function kakaoLogin() {
		var CLIENT_ID = "68b5d62555197f364178583e0abab8a1";//Redirect URI key
		var REDIRECT_URI =  "http://localhost:8090/KIC4_Project3/U_kakaoToken.shop";//Redirect URI 경로
		var KAKAO_AUTH_URL = "https://kauth.kakao.com/oauth/authorize?client_id="+CLIENT_ID+"&redirect_uri="+REDIRECT_URI+"&response_type=code";
		window.location.href = KAKAO_AUTH_URL;
}

function kakaoLogout() {
		var CLIENT_ID = "68b5d62555197f364178583e0abab8a1";//Redirect URI key
		var logout_redirect_uri =  "http://localhost:8090/KIC4_Project3/U_LoginPage.shop";//Redirect URI 경로
		var KAKAO_AUTH_URL = "https://kauth.kakao.com/oauth/logout?client_id="+CLIENT_ID+"&logout_redirect_uri="+logout_redirect_uri;
		window.location.href = KAKAO_AUTH_URL;
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
 url="U_ZipCheck.shop?check=y";
 window.open(url,"post","toolbar=no,width=500,height=400,left=900,top=100,directories=no,status=yes,scrollbars=yes,menubar=no");
}