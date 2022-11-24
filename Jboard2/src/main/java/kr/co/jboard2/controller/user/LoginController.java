package kr.co.jboard2.controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jboard2.service.user.UserService;
import kr.co.jboard2.vo.UserVO;

@WebServlet("/user/login.do")
public class LoginController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private UserService service = UserService.INSTANCE;

	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String success = req.getParameter("success");
		req.setAttribute("success", success);
		
		HttpSession sess = req.getSession();
		
		// 자동 로그인 여부에 따라 로그인 처리
		Cookie[] cookies = req.getCookies();
		
		if(cookies != null) {
			
			for(Cookie cookie : cookies) {
				
				if(cookie.getName().equals("SESSID")) {
					
					String sessId = cookie.getValue();					
					UserVO vo = service.selectUserBySessId(sessId);
					
					if(vo != null) {
						// 로그인 처리
						sess.setAttribute("sessUser", vo);
						
						// 쿠기 만료일 연장
						cookie.setMaxAge(60*60*24*3);
						resp.addCookie(cookie);			
						
						// 데이터베이스 sessId 만료일 연장
						service.updateUserForSessLimitDate(sessId);
					}
				}
			}
		}
		
		UserVO sessUser = (UserVO)sess.getAttribute("sessUser");
		
		if(sessUser != null) {
			resp.sendRedirect("/Jboard2/list.do");
		}else {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/user/login.jsp");
			dispatcher.forward(req, resp);	
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uid  = req.getParameter("uid");
		String pass = req.getParameter("pass");
		String auto = req.getParameter("auto");
	
		UserVO vo = service.selectUser(uid, pass);
		
		if(vo != null) {
			// 회원이 맞을경우
			HttpSession sess = req.getSession();
			sess.setAttribute("sessUser", vo);
			
			if(auto != null) {
				
				String sessId = sess.getId();
				
				// 쿠키 생성
				Cookie cookie = new Cookie("SESSID", sessId);
				cookie.setPath("/");
				cookie.setMaxAge(60*60*24*3);
				resp.addCookie(cookie);
				
				// sessId 데이터베이스 저장
				service.updateUserForSession(uid, sessId);
			}
			resp.sendRedirect("/Jboard2/list.do");
			
		}else {
			// 회원이 아닌경우
			resp.sendRedirect("/Jboard2/user/login.do?success=100");
		}
		
	}
}
