<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String pg = request.getParameter("pg");
	
	// 게시물 목록 처리 관련 변수 선언
	int limitStart = 0;
	int currentPage = 1;
	int total = 0;
	int lastPageNum = 0;
	int pageGroupCurrent = 1;
	int pageGroupStart = 1;
	int pageGroupEnd = 0;
	int pageStartNum = 0;
	
	// 게시물 DAO 객체 가져오기
 	ArticleDAO dao = ArticleDAO.getInstance();
 	
 	// 전체 게시물 갯수 구하기
 	total = dao.selectCountTotal();
 	
 	// 페이지 마지막 번호 계산
 	if(total % 10 == 0){
 		lastPageNum = (total / 10);
 	}else{
 		lastPageNum = (total / 10) + 1; 		
 	}
 	
 	// 현재 페이지 게시물 limit 시작값 계산
 	if(pg != null){
 		currentPage = Integer.parseInt(pg);
 	}
 	
	limitStart = (currentPage - 1) * 10;
 	
	// 페이지 그룹 계산
	pageGroupCurrent = (int)Math.ceil(currentPage / 10.0);
	pageGroupStart = (pageGroupCurrent - 1) * 10 + 1;
	pageGroupEnd = pageGroupCurrent * 10;
	
	if(pageGroupEnd > lastPageNum){
		pageGroupEnd = lastPageNum;
	}
	
	// 페이지 시작 번호 계산
	pageStartNum = total - limitStart;
	
 	// 현재 페이지 게시물 가져오기
 	List<ArticleBean> articles = dao.selectArticles(limitStart);
	
%>
<%@ include file="./_header.jsp" %>
<main id="board">
    <section class="list">
        <table border="0">
            <caption>글목록</caption>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>날짜</th>
                <th>조회</th>
            </tr>
            <% for(ArticleBean article : articles){ %>
            <tr>
                <td><%= pageStartNum-- %></td>
                <td><a href="/Jboard1/view.jsp?no=<%= article.getNo() %>&pg=<%= currentPage %>"><%= article.getTitle() %>[<%= article.getComment() %>]</a></td>
                <td><%= article.getNick() %></td>
                <td><%= article.getRdate().substring(2, 10) %></td>
                <td><%= article.getHit() %></td>
            </tr>
            <% } %>
        </table>

        <div class="page">
        	<% if(pageGroupStart > 1){ %>
            <a href="/Jboard1/list.jsp?pg=<%= pageGroupStart - 1 %>" class="prev">이전</a>
            <% } %>
            <% for(int i=pageGroupStart ; i<=pageGroupEnd ; i++){ %>
            <a href="/Jboard1/list.jsp?pg=<%= i %>" class="num <%= (currentPage == i)?"current":"off" %>"><%= i %></a>
            <% } %>
            <% if(pageGroupEnd < lastPageNum){ %>
            <a href="/Jboard1/list.jsp?pg=<%= pageGroupEnd + 1 %>" class="next">다음</a>
            <% } %>
        </div>

        <a href="/Jboard1/write.jsp" class="btn btnWrite">글쓰기</a>
        
    </section>
</main>
<%@ include file="./_footer.jsp" %>        
        