package member;

import java.sql.Timestamp;//날짜와 시간을 설정할 때 사용하는 클래스 - 어디서? DB에서

public class E_BoardDTO {
	private int eventno;//입력x)게시물 번호
	private String managerid,subject,content,img_main,imgpath,imgpath2,eventstart,eventend,memid,pwd;//입력o)작성자,글제목,글내용,암호(관리자로 로그인했을 때만->글쓰기->글수정,글삭제)
	private Timestamp eventdate;//작성날짜
	private int readcount;//조회수=> 아무도 선택하지 않으면 0, default 0
	
	//Setter, Getter Method
	public int getEventno() {
		return eventno;
	}
	public void setEventno(int eventno) {
		this.eventno = eventno;
	}
	public String getManagerid() {
		return managerid;
	}
	public void setManagerid(String managerid) {
		this.managerid = managerid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getImg_main() {
		return img_main;
	}
	public void setImg_main(String img_main) {
		this.img_main = img_main;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public String getImgpath2() {
		return imgpath2;
	}
	public void setImgpath2(String imgpath2) {
		this.imgpath2 = imgpath2;
	}
	public String getEventstart() {
		return eventstart;
	}
	public void setEventstart(String eventstart) {
		this.eventstart = eventstart;
	}
	public String getEventend() {
		return eventend;
	}
	public void setEventend(String eventend) {
		this.eventend = eventend;
	}
	public Timestamp getEventdate() {
		return eventdate;
	}
	public void setEventdate(Timestamp eventdate) {
		this.eventdate = eventdate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	
}
