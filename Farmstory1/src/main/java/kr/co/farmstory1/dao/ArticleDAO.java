package kr.co.farmstory1.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<ArticleBean> selectArticles(String cate, int start) {
		
		List<ArticleBean> articles = new ArrayList<>();
		
		try {
			logger.info("selectArticles...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ARTICLES);
			psmt.setString(1, cate);
			psmt.setInt(2, start);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ArticleBean ab = new ArticleBean();
				ab.setNo(rs.getInt(1));
				ab.setParent(rs.getInt(2));
				ab.setComment(rs.getInt(3));
				ab.setCate(rs.getString(4));
				ab.setTitle(rs.getString(5));
				ab.setContent(rs.getString(6));
				ab.setFile(rs.getInt(7));
				ab.setHit(rs.getInt(8));
				ab.setUid(rs.getString(9));
				ab.setRegip(rs.getString(10));
				ab.setRdate(rs.getString(11));
				ab.setNick(rs.getString(12));
						
				articles.add(ab);
			}
			
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return articles;
	}
	
	public List<ArticleBean> selectLatests(String cate1, String cate2, String cate3) {
		
		Map<String, List<ArticleBean>> maps = new HashMap<>();
		List<ArticleBean> latests = new ArrayList<>();
		
		try {
			logger.info("selectLatests...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_LATESTS);
			psmt.setString(1, cate1);
			psmt.setString(2, cate2);
			psmt.setString(3, cate3);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ArticleBean ab = new ArticleBean();
				ab.setNo(rs.getInt(1));
				ab.setTitle(rs.getString(2));
				ab.setRdate(rs.getString(3).substring(2, 10));
				
				latests.add(ab);
			}
			
			close();
			
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return latests;
	}
	
	public synchronized List<ArticleBean> selectLatests(String cate) {
		
		List<ArticleBean> latests = new ArrayList<>();
		
		try {
			logger.info("selectLatests(String)...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_LATEST);
			psmt.setString(1, cate);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ArticleBean ab = new ArticleBean();
				ab.setNo(rs.getInt(1));
				ab.setTitle(rs.getString(2));
				ab.setRdate(rs.getString(3).substring(2, 10));
				
				latests.add(ab);
			}
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		logger.info("latests size : " + latests.size());
		
		return latests;
	}
	
	public int selectCountTotal(String cate) {
		
		int total = 0;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_COUNT_TOTAL);
			psmt.setString(1, cate);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
			close();		
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return total;		
	}
	public void updateArticle() {}
	public void deleteArticle() {}

}













