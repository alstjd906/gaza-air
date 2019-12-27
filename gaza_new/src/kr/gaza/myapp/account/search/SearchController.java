package kr.gaza.myapp.account.search;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.gaza.myapp.account.member.MemberInterface;
import kr.gaza.myapp.account.member.MemberVO;

@Controller
public class SearchController {
	@Autowired
	SqlSession sqlSession;
	//아이디 찾기 페이지 이동.
	@RequestMapping("/JSP/account/search/idsearch")
	public ModelAndView idSearchView() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("JSP/account/search/idsearch");
		return mav;
	}
	//아이디 찾기 ajax
	@RequestMapping(value="/JSP/account/search/idSearchOk", method=RequestMethod.POST, produces="application/text;charset=UTF-8")
	@ResponseBody
	public String idSearchOk(@RequestParam("lastName") String lastName, @RequestParam("firstName") String firstName,
			@RequestParam("year") String year, @RequestParam("month") String month, @RequestParam("day") String day,
			@RequestParam("emailAddress") String eAddr, @RequestParam("emailDomain") String eDomain,
			@RequestParam("emailDomainText") String eDomainText, HttpServletRequest req) {
		
		MemberInterface dao = sqlSession.getMapper(MemberInterface.class);
		MemberVO vo = new MemberVO();
		vo.setLastNameKor(lastName);
		vo.setFirstNameKor(firstName);
		vo.setBirthDay(year+"/"+month+"/"+day);
		if(eDomain.equals("")) {
			vo.setEmail(eAddr+"@"+eDomainText);
		}else {
			vo.setEmail(eAddr+"@"+eDomain);
		}
		String id = dao.findId(vo);
		
		if(id != null) {
			String host = "smtp.naver.com";
			
			final String username = "gaza_air";
			final String password = "goott2019";
			int port = 465;
			
			String recipient = vo.getEmail();
			String subject = "[GAZA AIR] 고객님께서 요청하신 아이디를 발송했습니다.";
			String body = "<h1>가자에어 아이디 찾기 안내</h1><hr/><h3><b style='color:#36f'>"+vo.getMemberNameKor()+"님,</b> 안녕하세요!</h3>"
						+ "<p>회원님께서 찾으신 아이디는 <b style='font-size:2em;color:#36f;'>"+id+"</b>입니다.<br/>"
						+ "아이디 찾기를 요청하지 않으셨다면 비밀번호를 변경하시기 바랍니다.<br/><br/>감사합니다.<br/>가자에어 고객 지원팀</p>";
			
			Properties props = System.getProperties();
			
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", port);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.trust", host);
			
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				String un = username;
				String pw = password;
				protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
					return new javax.mail.PasswordAuthentication(un, pw);
				}
			});
			
			Message mimeMessage = new MimeMessage(session);
			try {
				mimeMessage.setFrom(new InternetAddress("gaza_air@naver.com"));
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
				
				mimeMessage.setSubject(subject);
				mimeMessage.setContent(body, "text/html;charset=UTF-8");
				Transport.send(mimeMessage);
			} catch (AddressException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
		return id;
	}
	//비밀번호 찾기 페이지 이동.
	@RequestMapping("/JSP/account/search/pwsearch")
	public ModelAndView pwSearchView() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("JSP/account/search/pwsearch");
		return mav;
	}
	
	//비밀번호 찾기 ajax
	@RequestMapping(value="/JSP/account/search/pwSearchOk", method=RequestMethod.POST, produces="application/text;charset=UTF-8")
	@ResponseBody
	public String idSearchOk(@RequestParam("memberId") String memberId, @RequestParam("lastName") String lastName, 
			@RequestParam("firstName") String firstName, @RequestParam("year") String year, 
			@RequestParam("month") String month, @RequestParam("day") String day,
			@RequestParam("emailAddress") String eAddr, @RequestParam("emailDomain") String eDomain,
			@RequestParam("emailDomainText") String eDomainText, HttpServletRequest req) {
		
		MemberInterface dao = sqlSession.getMapper(MemberInterface.class);
		MemberVO vo = new MemberVO();
		vo.setMemberId(memberId);
		vo.setLastNameKor(lastName);
		vo.setFirstNameKor(firstName);
		vo.setBirthDay(year+"/"+month+"/"+day);
		if(eDomain.equals("")) {
			vo.setEmail(eAddr+"@"+eDomainText);
		}else {
			vo.setEmail(eAddr+"@"+eDomain);
		}
		String pwd = dao.findPw(vo);
		//검색된 비밀번호가 있으면
		if(pwd != null) {
			//임시 비밀번호 생성.
			char[] charSet = new char[] {
					'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 
					'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
			};
			StringBuffer sb = new StringBuffer();
			int idx=0;
			for(int i=0; i<10; i++) {
				idx = (int)(charSet.length * Math.random());
				sb.append(charSet[idx]);
			}
			String oldPwd = pwd;
			pwd = sb.toString();
			
			//임시 비밀번호로 DB업데이트
			int cnt = dao.updatePassword(vo.getMemberId(), oldPwd, pwd);
			if(cnt>0) {//비밀번호 업데이트 완료되면
				String host = "smtp.naver.com";
				
				final String username = "gaza_air";
				final String password = "goott2019";
				int port = 465;
				
				String recipient = vo.getEmail();
				String subject = "[GAZA AIR] 고객님께서 요청하신 임시 비밀번호를 발송했습니다.";
				String body = "<h1>가자에어 임시 비밀번호 발송 안내</h1><hr/><h3><b style='color:#36f'>"+vo.getMemberNameKor()+"님,</b> 안녕하세요!</h3>"
							+ "<p>회원님의 임시 비밀번호는 <b style='font-size:2em;color:#36f;'>"+pwd+"</b>입니다.<br/>"
							+ "임시 비밀번호를 요청하지 않으셨다면 비밀번호를 변경하시기 바랍니다.<br/><br/>감사합니다.<br/>가자에어 고객 지원팀</p>";
				
				Properties props = System.getProperties();
				
				props.put("mail.smtp.host", host);
				props.put("mail.smtp.port", port);
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.ssl.enable", "true");
				props.put("mail.smtp.trust", host);
				
				Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
					String un = username;
					String pw = password;
					protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
						return new javax.mail.PasswordAuthentication(un, pw);
					}
				});
				
				Message mimeMessage = new MimeMessage(session);
				try {
					mimeMessage.setFrom(new InternetAddress("gaza_air@naver.com"));
					mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
					
					mimeMessage.setSubject(subject);
					mimeMessage.setContent(body, "text/html;charset=UTF-8");
					Transport.send(mimeMessage);
				} catch (AddressException e) {
					e.printStackTrace();
				} catch (MessagingException e) {
					e.printStackTrace();
				}
			}
		}else {
			System.out.println("임시 비밀번호 업데이트 실패...");
		}
		return pwd;
	}
}
