//회원테이블에 데이터를 저장할 수 있도록 설계

package member;

import java.sql.Date;
import java.sql.Timestamp;

public class U_RegisterDTO
{
  //멤버변수선언
	private String memid; //회원아이디
	private String grade;//등급이름 -> DB 디폴트 "실버"
	private String memname;//회원이름
	private String birthday;//생년월일 -> Date
	private String email;//이메일
	private String mphone;//휴대전화
	private String nickname;//닉네임
	private Timestamp enrolldate;//회원가입일 -> Date
	private Timestamp deletedate=null;//회원탈퇴일 -> Date
	private String delflag;//회원탈퇴여부 -> DB 디폴트 "N"
	private String pwd;//비밀번호
	private String addr;//주소
	private String zipcode;//우편번호

	//Setter Method
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public void setMemname(String memname) {
		this.memname = memname;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public void setEnrolldate(Timestamp enrolldate) {
		this.enrolldate = enrolldate;
	}
	public void setDeletedate(Timestamp deletedate) {
		this.deletedate = deletedate;
	}
	public void setDelflag(String delflag) {
			this.delflag = delflag;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	
	//Getter Method
	public String getMemid() {
		return memid;
	}
	public String getGrade() {
		return grade;
	}
	public String getMemname() {
		return memname;
	}
	public String getBirthday() {
		return birthday;
	}
	public String getEmail() {
		return email;
	}
	public String getMphone() {
		return mphone;
	}
	public String getNickname() {
		return nickname;
	}
	public Timestamp getEnrolldate() {
		return enrolldate;
	}
	public Timestamp getDeletedate() {
		return deletedate;
	}
	public String getDelflag() {
		return delflag;
	}
	public String getPwd() {
		return pwd;
	}
	public String getAddr() {
		return addr;
	}
	public String getZipcode() {
		return zipcode;
	}
	
}