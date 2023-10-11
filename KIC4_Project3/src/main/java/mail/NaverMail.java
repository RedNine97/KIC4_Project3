package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class NaverMail extends Authenticator {
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		//네이버 이메일 아이디, 네이버 비밀번호
		return new PasswordAuthentication("reverrednine97@naver.com", "enddl970221*");
	}
}
