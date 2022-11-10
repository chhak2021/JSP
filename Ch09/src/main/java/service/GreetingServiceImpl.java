package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GreetingServiceImpl implements CommonService {
	
	private static GreetingServiceImpl instance = new GreetingServiceImpl();
	public static GreetingServiceImpl getInstance() {
		return instance;
	}
	private GreetingServiceImpl() {}

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		return "/greeting.jsp";
	}
	
}
