package kr.gaza.myapp.flight.schedule;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ScheduleController {
	@Autowired
	SqlSession sqlSession;
	//�α��� �������� �̵�.
	@RequestMapping("/JSP/flight/schedule/routeMap")
	public String loginView() {
		
		return "JSP/flight/schedule/routeMap";
	}
}
