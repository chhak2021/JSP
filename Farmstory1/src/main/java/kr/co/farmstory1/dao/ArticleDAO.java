package kr.co.farmstory1.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory1.bean.ArticleBean;
import kr.co.farmstory1.db.DBHelper;
import kr.co.farmstory1.db.Sql;

public class ArticleDAO extends DBHelper {
	
	private static ArticleDAO instance = new ArticleDAO();
	public static ArticleDAO getInstance() {
		return instance;
	}
	private ArticleDAO() {}
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int insertArticle(ArticleBean ab) {
		
		int parent = 0;
		
		try {
			logger.info("insertArticle...");
			
			conn = getConnection();
			conn.setAutoCommit(false);
			
			psmt = conn.prepareStatement(Sql.INSERT_ARTICLE);
			stmt = conn.createStatement();
			
			psmt.setString(1, ab.getCate());
			psmt.setString(2, ab.getTitle());
			psmt.setString(3, ab.getContent());
			psmt.setInt(4, ab.getFname() == null ? 0 : 1);
			psmt.setString(5, ab.getUid());
			psmt.setString(6, ab.getRegip());			
			psmt.executeUpdate();
			rs = stmt.executeQuery(Sql.SELECT_MAX_NO);
			
			conn.commit();
			
			if(rs.next()){
				parent = rs.getInt(1);
			}
			
			close();			
			
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return parent;
	}
	
	public void insertFile(int parent, String newName, String fname) {
		try{
			logger.info("insertFile...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.INSERT_FILE);
			psmt.setInt(1, parent);
			psmt.setString(2, newName);
			psmt.setString(3, fname);
			psmt.executeUpdate();
			close();
		}catch(Exception e){
			logger.error(e.getMessage());
		}
	}
	
	public void selectArticle() {}
	public void selectArticles() {}
	public void updateArticle() {}
	public void deleteArticle() {}

}
