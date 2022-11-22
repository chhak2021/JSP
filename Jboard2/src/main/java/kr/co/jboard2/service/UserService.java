package kr.co.jboard2.service;

import kr.co.jboard2.dao.UserDAO;
import kr.co.jboard2.vo.TermsVO;

public enum UserService {
	
	INSTANCE;
	private UserDAO dao;
	
	private UserService() {
		dao = new UserDAO();
	}
	
	public void insertUser() {}
	public TermsVO selectTerms() {
		return dao.selectTerms();
	}
	public void selectUser() {}
	public void selectUsers() {}
	public void updateUser() {}
	public void deleteUser() {}

}
