package kr.co.jboard2.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.service.ArticleService;
import kr.co.jboard2.vo.ArticleVO;

@WebServlet("/list.do")
public class ListController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private ArticleService service = ArticleService.INSTANCE;	
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("ListController...");
		
		String pg = req.getParameter("pg");
		String search = req.getParameter("search");
		
		logger.debug("here1");
		
		// 현재 페이지 번호
		int currentPage = service.getCurrentPage(pg);
		logger.debug("here2");
		
		// 전체 게시물 갯수 
		int total = service.selectCountTotal(search);
		logger.debug("here3");
		
		// 마지막 페이지 번호
		int lastPageNum = service.getLastPageNum(total);
		logger.debug("here4");
		
		// 페이지 그룹 start, end 번호
		int[] result = service.getPageGroupNum(currentPage, lastPageNum);
		logger.debug("here5");
		
		// 페이지 시작번호
		int pageStartNum = service.getPageStartNum(total, currentPage);
		logger.debug("here6");
		
		// 시작 인덱스
		int start = service.getStartNum(currentPage);
		logger.debug("here7");
		
		// 글 가져오기
		List<ArticleVO> articles = null;
				
		if(search == null) {
			logger.debug("here8");
			articles = service.selectArticles(start);
		}else {
			logger.debug("here9");
			articles = service.selectArticlesByKeyword(search, start);
		}
		
		req.setAttribute("articles", articles);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("pageGroupStart", result[0]);
		req.setAttribute("pageGroupEnd", result[1]);
		req.setAttribute("pageStartNum", pageStartNum+1);
		req.setAttribute("search", search);
		
		logger.debug("here10");
		RequestDispatcher dispatcher = req.getRequestDispatcher("/list.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}