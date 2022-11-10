package service.user1;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListService implements CommonService {

	private static ListService instance = new ListService();
	public static ListService getInstance() {
		return instance;
	}
	private ListService() {}
	
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		return "/user1/list.jsp";
	}

}
