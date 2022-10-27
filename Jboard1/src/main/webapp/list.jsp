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
	int limitStart = 0;
	int total = 0;
	int lastPageNum = 0;
	
 	ArticleDAO dao = ArticleDAO.getInstance();
 	
 	total = dao.selectCountTotal();
 	
 	if(total % 10 == 0){
 		lastPageNum = (total / 10);
 	}else{
 		lastPageNum = (total / 10) + 1; 		
 	}
 	
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
                <td><%= article.getNo() %></td>
                <td><a href="/Jboard1/view.jsp"><%= article.getTitle() %>[<%= article.getComment() %>]</a></td>
                <td><%= article.getNick() %></td>
                <td><%= article.getRdate().substring(2, 10) %></td>
                <td><%= article.getHit() %></td>
            </tr>
            <% } %>
        </table>

        <div class="page">
            <a href="#" class="prev">이전</a>
            <% for(int i=1 ; i<=lastPageNum ; i++){ %>
            <a href="#" class="num"><%= i %></a>
            <% } %>
            <a href="#" class="next">다음</a>
        </div>

        <a href="/Jboard1/write.jsp" class="btn btnWrite">글쓰기</a>
        
    </section>
</main>
<%@ include file="./_footer.jsp" %>        
        