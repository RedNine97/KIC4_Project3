package member;

public class U_MemLoginDTO {
	private String loginid;//회원로그인의 회원아이디
	private String loginpwd;//회원로그인의 비밀번호
	
	//Setter Method
	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}
	public void setLoginpwd(String loginpwd) {
		this.loginpwd = loginpwd;
	}
	
	//Getter Method
	public String getLoginid() {
		return loginid;
	}
	public String getLoginpwd() {
		return loginpwd;
	}
	
	
}
