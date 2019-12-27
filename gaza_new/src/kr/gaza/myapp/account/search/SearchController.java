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
	//���̵� ã�� ������ �̵�.
	@RequestMapping("/JSP/account/search/idsearch")
	public ModelAndView idSearchView() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("JSP/account/search/idsearch");
		return mav;
	}
	//���̵� ã�� ajax
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
			String subject = "[GAZA AIR] ���Բ��� ��û�Ͻ� ���̵� �߼��߽��ϴ�.";
			String body = "<h1>���ڿ��� ���̵� ã�� �ȳ�</h1><hr/><h3><b style='color:#36f'>"+vo.getMemberNameKor()+"��,</b> �ȳ��ϼ���!</h3>"
						+ "<p>ȸ���Բ��� ã���� ���̵�� <b style='font-size:2em;color:#36f;'>"+id+"</b>�Դϴ�.<br/>"
						+ "���̵� ã�⸦ ��û���� �����̴ٸ� ��й�ȣ�� �����Ͻñ� �ٶ��ϴ�.<br/><br/>�����մϴ�.<br/>���ڿ��� �� ������</p>";
			
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
	//��й�ȣ ã�� ������ �̵�.
	@RequestMapping("/JSP/account/search/pwsearch")
	public ModelAndView pwSearchView() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("JSP/account/search/pwsearch");
		return mav;
	}
	
	//��й�ȣ ã�� ajax
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
		//�˻��� ��й�ȣ�� ������
		if(pwd != null) {
			//�ӽ� ��й�ȣ ����.
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
			
			//�ӽ� ��й�ȣ�� DB������Ʈ
			int cnt = dao.updatePassword(vo.getMemberId(), oldPwd, pwd);
			if(cnt>0) {//��й�ȣ ������Ʈ �Ϸ�Ǹ�
				String host = "smtp.naver.com";
				
				final String username = "gaza_air";
				final String password = "goott2019";
				int port = 465;
				
				String recipient = vo.getEmail();
				String subject = "[GAZA AIR] ���Բ��� ��û�Ͻ� �ӽ� ��й�ȣ�� �߼��߽��ϴ�.";
				String body = "<h1>���ڿ��� �ӽ� ��й�ȣ �߼� �ȳ�</h1><hr/><h3><b style='color:#36f'>"+vo.getMemberNameKor()+"��,</b> �ȳ��ϼ���!</h3>"
							+ "<p>ȸ������ �ӽ� ��й�ȣ�� <b style='font-size:2em;color:#36f;'>"+pwd+"</b>�Դϴ�.<br/>"
							+ "�ӽ� ��й�ȣ�� ��û���� �����̴ٸ� ��й�ȣ�� �����Ͻñ� �ٶ��ϴ�.<br/><br/>�����մϴ�.<br/>���ڿ��� �� ������</p>";
				
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
			System.out.println("�ӽ� ��й�ȣ ������Ʈ ����...");
		}
		return pwd;
	}
}
