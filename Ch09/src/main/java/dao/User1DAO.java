package dao;

import db.DBHelper;
import vo.User1VO;

public class User1DAO extends DBHelper {

	private static User1DAO instance = new User1DAO();
	public static User1DAO getInstance() {
		return instance;
	}
	private User1DAO() {}
	
	
	public void inserUser1(User1VO vo) {
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("insert into `user1` values (?,?,?,?)");
			psmt.setString(1, vo.getUid());
			psmt.setString(2, vo.getName());
			psmt.setString(3, vo.getHp());
			psmt.setInt(4, vo.getAge());
			psmt.executeUpdate();
			
			close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void selectUser1() {}
	public void selectUser1s() {}
	public void updateUser1() {}
	public void deleteUser1() {}
	
}
