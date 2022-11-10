package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServiceImpl implements CommonService {
	
	private static HelloServiceImpl instance = new HelloServiceImpl();
	public static HelloServiceImpl getInstance() {
		return instance;
	}
	private HelloServiceImpl() {}

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		return "/hello.jsp";
	}
	
}
