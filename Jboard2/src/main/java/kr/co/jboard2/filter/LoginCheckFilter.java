package kr.co.jboard2.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.vo.UserVO;

@WebFilter("/*")
public class LoginCheckFilter implements Filter {

	Logger logger = LoggerFactory.getLogger(this.getClass());
		
	private List<String> uriList;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
		uriList = new ArrayList<>();
		uriList.add("/list.do");
		uriList.add("/write.do");
		uriList.add("/modify.do");
		uriList.add("/view.do");
	}
	
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		logger.info("LoginCheckFilter doFilter...");
		
		HttpServletRequest req = (HttpServletRequest) request;
		
		String uri = req.getRequestURI();
		logger.debug("uri : " + uri);
		
		if(uriList.contains(uri)) {
			
			logger.debug("here1...");
			HttpSession sess = req.getSession();
			UserVO sessUser = (UserVO)sess.getAttribute("sessUser");
			
			if(sessUser == null) {
				logger.debug("here2...");
				((HttpServletResponse) response).sendRedirect("/Jboard2/user/login.do");
				return;
			}
		}
		
		chain.doFilter(request, response);
	}

}
