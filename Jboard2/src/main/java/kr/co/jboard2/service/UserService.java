package kr.co.jboard2.service;

import java.util.Properties;
import java.util.concurrent.ThreadLocalRandom;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.dao.UserDAO;
import kr.co.jboard2.vo.TermsVO;
import kr.co.jboard2.vo.UserVO;

public enum UserService {
	
	INSTANCE;
	private UserDAO dao;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private UserService() {
		dao = new UserDAO();
	}
	
	public void insertUser(UserVO vo) {
		dao.insertUser(vo);
	}
	public TermsVO selectTerms() {
		return dao.selectTerms();
	}
	public int selectCountUid(String uid) {
		return dao.selectCountUid(uid);
	}
	public int selectCountNick(String nick) {
		return dao.selectCountNick(nick);
	}
	public UserVO selectUser(String uid, String pass) {
		return dao.selectUser(uid, pass);
	}
	public UserVO selectUserForFindId(String name, String email) {
		return dao.selectUserForFindId(name, email);
	}
	public UserVO selectUserForFindPw(String uid, String email) {
		return dao.selectUserForFindPw(uid, email);
	}
	public UserVO selectUserBySessId(String sessId) {
		return dao.selectUserBySessId(sessId);
	}
	
	public void selectUsers() {}
	public void updateUser() {}
	public int updateUserPassword(String uid, String pass) {
		return dao.updateUserPassword(uid, pass);
	}
	
	public void updateUserForSession(String uid, String sessId) {
		dao.updateUserForSession(uid, sessId);
	}
	public void updateUserForSessLimitDate(String sessId) {
		dao.updateUserForSessLimitDate(sessId);
	}
	public void updateUserForSessionOut(String uid) {
		dao.updateUserForSessionOut(uid);
	}
	
	
	public void deleteUser() {}
	

	public int[] sendEmailCode(String receiver) {
		
		// 인증코드 생성
		int code = ThreadLocalRandom.current().nextInt(100000, 1000000);
		
		// 기본정보
		String sender = "chhak0503@gmail.com";
		String password = "ubqyyhrbehqxvawu";
		
		String title = "Jboard2 인증코드 입니다.";
		String content = "<h1>인증코드는 "+code+" 입니다.</h1>";
		
		// Gmail SMTP 서버설정
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, password);
			}
		});
				
		// 메일발송
		Message message = new MimeMessage(session);
		int status = 0;
		
		try {
			logger.debug("메일 전송 시작...");
			message.setFrom(new InternetAddress(sender, "관리자", "UTF-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			message.setSubject(title);
			message.setContent(content, "text/html;charset=utf-8");
			Transport.send(message);
			
			status = 1;
			
		}catch (Exception e) {
			e.printStackTrace();
			status = 0;
			logger.error("메일 전송 실패...");
		}
		
		logger.debug("메일 전송 성공...");
		
		int result[] = {status, code};
		
		return result;
	}
	
	
	
}
