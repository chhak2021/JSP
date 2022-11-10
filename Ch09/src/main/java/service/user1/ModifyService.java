package service.user1;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ModifyService implements CommonService {

	private static ModifyService instance = new ModifyService();
	public static ModifyService getInstance() {
		return instance;
	}
	private ModifyService() {}
	
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		return "/user1/modify.jsp";
	}

}
