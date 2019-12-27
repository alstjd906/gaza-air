package kr.gaza.myapp.board.noticeBoard;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	@Autowired
	SqlSession sqlSession;
	//공지사항 리스트 페이지로 이동.
	@RequestMapping("/JSP/board/noticeBoard/noticeBoard_list")
	public ModelAndView noticeBoardList(@RequestParam("pageNum") String pageNum, @RequestParam("tabType") int tabType) {
		
		NoticeBoardInterface dao = sqlSession.getMapper(NoticeBoardInterface.class);
		NoticeBoardVO vo = new NoticeBoardVO();
		
		int totalRecord = dao.noticeBoardTotalRecord(tabType);
		
		if(pageNum!=null && !pageNum.equals("")) {
			vo.setPageNum(Integer.parseInt(pageNum));
			vo.setTabType(tabType);
			vo.setTotalRecord(totalRecord);
		}
		List<NoticeBoardVO> lst;
		
		lst = dao.getAllRecord(vo.getTabType());
		ModelAndView mav = new ModelAndView();
		mav.addObject("tabType", tabType);
		mav.addObject("vo", vo);
		mav.addObject("lst", lst);
		mav.setViewName("JSP/board/noticeBoard/noticeBoard_list");
		return mav;
	}
	//공지사항 글 보기 페이지
	@RequestMapping("/JSP/board/noticeBoard/noticeBoard_view")
	public ModelAndView noticeDetailView(@RequestParam("noticeNum") int noticeNum, @RequestParam("pageNum") int pageNum,
			@RequestParam("tabType") int tabType, HttpServletRequest req, HttpServletResponse res) {
		NoticeBoardInterface dao = sqlSession.getMapper(NoticeBoardInterface.class);
		
		//쿠키에서 값 검색 후 조회수 증가
		Cookie cookies[] = req.getCookies();
		boolean viewed = false;
		for(int i=0; i<cookies.length; i++) {
			String name = cookies[i].getName();
			if(name.equals("notice"+noticeNum)) {//쿠키에 페이지가 있으면
				viewed = true;
				break;
			}
		}
		
		if(viewed==false) {
			Cookie c = new Cookie("notice"+noticeNum, "view");
			c.setMaxAge(60*60*24*30);
			res.addCookie(c);
			
			//조회수 증가
			dao.noticeHitUpdate(noticeNum);
		}
		
		NoticeBoardVO vo = new NoticeBoardVO();
		vo.setNoticeNum(noticeNum);
		vo.setPageNum(pageNum);
		
		NoticeBoardVO vo2 = dao.noticeBoardSelect(vo);
		vo = dao.noticeBoardGetPrevNext(tabType, noticeNum);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("JSP/board/noticeBoard/noticeBoard_view");
		mav.addObject("vo", vo2);
		mav.addObject("tabType", tabType);
		mav.addObject("prevNum", vo.getPrevNum());
		mav.addObject("prevSubject", vo.getPrevSubject());
		mav.addObject("nextNum", vo.getNextNum());
		mav.addObject("nextSubject", vo.getNextSubject());
		return mav;
	}
}
