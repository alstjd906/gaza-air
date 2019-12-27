package kr.gaza.myapp.information;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InformationController {
	@RequestMapping("/JSP/serviceinfo/{var}")
	public String infoPage(@PathVariable String var) {
		return "JSP/serviceinfo/info_" + var;
	}
}
