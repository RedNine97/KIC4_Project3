function writeSave(){
	
	if(document.writeform.subject.value==""){
	  alert("제목을 입력하십시요.");
	  document.writeform.subject.focus();
	  return false;
	}
	
	if(document.writeform.eventstart.value==""){
	  alert("시작일을 입력하십시요.");
	  document.writeform.content.focus();
	  return false;
	}
	if(document.writeform.eventend.value==""){
	  alert("종료일을 입력하십시요.");
	  document.writeform.content.focus();
	  return false;
	}
        
	if(document.writeform.passwd.value==""){
	  alert(" 비밀번호를 입력하십시요.");
	  document.writeform.passwd.focus();
	  return false;
	}
	
	if(document.writeform.pwd_check.value==""){
	  alert(" 관리자 비밀번호를 입력하십시요.");
	  document.writeform.pwd_check.focus();
	  return false;
	}
 }    
 
 function deleteSave(){
	if(document.delForm.passwd.value==""){
	  alert(" 삭제 전 최종 확인 : 관리자 비밀번호를 입력하십시요.");
	  document.delForm.passwd.focus();
	  return false;
	}
	
}

