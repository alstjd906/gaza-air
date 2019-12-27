package kr.gaza.myapp.flight.schedule;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ScheduleController {
	@Autowired
	SqlSession sqlSession;
	//로그인 페이지로 이동.
	@RequestMapping("/JSP/flight/schedule/routeMap")
	public String loginView() {
		
		return "JSP/flight/schedule/routeMap";
	}
}
