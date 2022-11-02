package kr.co.jboard1.dao;

import kr.co.jboard1.bean.TermsBean;
import kr.co.jboard1.bean.UserBean;
import kr.co.jboard1.db.DBHelper;
import kr.co.jboard1.db.Sql;

public class UserDAO extends DBHelper {

	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	private UserDAO() {}
	
	// 기본 CRUD
	public void insertUser(UserBean ub) {
		try{
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.INSERT_USER);
			psmt.setString(1, ub.getUid());
			psmt.setString(2, ub.getPass());
			psmt.setString(3, ub.getName());
			psmt.setString(4, ub.getNick());
			psmt.setString(5, ub.getEmail());
			psmt.setString(6, ub.getHp());
			psmt.setString(7, ub.getZip());
			psmt.setString(8, ub.getAddr1());
			psmt.setString(9, ub.getAddr2());
			psmt.setString(10, ub.getRegip());
			psmt.executeUpdate();
			close();			
		}catch(Exception e){
			e.printStackTrace();
		}		
	}
	
	public TermsBean selectTerms() {
		
		TermsBean tb = null;
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_TERMS);
			if(rs.next()) {
				tb = new TermsBean();
				tb.setTerms(rs.getString(1));
				tb.setPrivacy(rs.getString(2));
			}
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return tb;		
	}
	
	public UserBean selectUser(String uid, String pass) {
		UserBean ub = null;
		
		try{
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_USER);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			rs = psmt.executeQuery();
			if(rs.next()){
				ub = new UserBean();
				ub.setUid(rs.getString(1));
				ub.setPass(rs.getString(2));
				ub.setName(rs.getString(3));
				ub.setNick(rs.getString(4));
				ub.setEmail(rs.getString(5));
				ub.setHp(rs.getString(6));
				ub.setGrade(rs.getInt(7));
				ub.setZip(rs.getString(8));
				ub.setAddr1(rs.getString(9));
				ub.setAddr2(rs.getString(10));
				ub.setRegip(rs.getString(11));
				ub.setRdate(rs.getString(12));			
			}
			close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return ub;
	}
	
	public int selectCountNick(String nick) {
		int result = 0;
		
		try{
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_COUNT_NICK);
			psmt.setString(1, nick);
			
			rs = psmt.executeQuery();
			
			if(rs.next()){
				result = rs.getInt(1);
			}
			close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int selectCountUid(String uid) {
		int result = 0;
		
		try{
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_COUNT_UID);
			psmt.setString(1, uid);
			
			rs = psmt.executeQuery();
			
			if(rs.next()){
				result = rs.getInt(1);
			}
			close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	public void selectUsers() {}
	public void updateUser() {}
	public void deleteUser() {}
	
}
