package controller;


import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;

import exception.LoginException;



@Controller 
@RequestMapping("user")
public class UserController {
	@RequestMapping("loginForm")
	public ModelAndView loginForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		/* �׾Ʒ� ���� URL�� �����ϱ� ���Ͽ� getAuthorizationUrl�� ȣ�� */
		// īī�� �α��� ȭ���̷� �̵��ϴ� �ּҰ� �����ϴ� �Լ� ȣ��
		String kakaoUrl = KakaoController.getAuthorizationUrl(session);

		/* ������ ���� URL�� View�� ���� */
		mav.setViewName("user/loginForm");
		// īī�� �α���
		mav.addObject("kakao_url", kakaoUrl);

		return mav;
	}// end memberLoginForm()
	
	@RequestMapping("login")
	public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		// ������� node�� �����
		JsonNode node = KakaoController.getAccessToken(code);
		// accessToken�� ������� �α����� ��� ������ �������
		JsonNode accessToken = node.get("access_token");
		// ������� ����
		JsonNode userInfo = KakaoController.getKakaoUserInfo(accessToken);
		System.out.println(userInfo);
		String kemail = null;
		String kname = null;
		String kgender = null;
		String kbirthday = null;
		String kage = null;
		String kimage1 = null;
		String kimage2 = null;
		// �������� īī������ �������� Get properties
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		JsonNode jsonprofile = kakao_account.path("profile");
		
		
		kemail = kakao_account.path("email").asText();
		kname = properties.path("nickname").asText();
		kimage1 = jsonprofile.path("thumbnail_image_url").asText();
		kimage2 = jsonprofile.path("profile_image_url").asText();
		kgender = kakao_account.path("gender").asText();
		kbirthday = kakao_account.path("birthday").asText();
		kage = kakao_account.path("age_range").asText();
		session.setAttribute("kemail", kemail);
		session.setAttribute("kname", kname);
		session.setAttribute("kimage1", kimage1);
		session.setAttribute("kimage2", kimage2);
		session.setAttribute("kgender", kgender);
		session.setAttribute("kbirthday", kbirthday);
		session.setAttribute("kage", kage);
		//���ǿ� ��ū ����
		session.setAttribute("access_Token", accessToken);
		mav.setViewName("user/login");
		return mav;
	}
	@RequestMapping("logout") // value="/logout
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			JsonNode node = KakaoController.kakaoLogout(session.getAttribute("access_Token").toString());
			System.out.println("�α��� �� ��ȯ�Ǵ� ���̵� : " + node.get("id"));
		}catch(Exception e) {
			throw new LoginException("�̹� �α׾ƿ��� �����Դϴ�", "loginForm.store");
		}
		session.invalidate();
		mav.setViewName("redirect:loginForm.store");
		return mav;
	}
	
	@RequestMapping("updateForm") //���� �����ϱ�
	public String kakaoupdateform(HttpSession session) {
		
		//KakaoController.kakaoupdate(accessToken);
		return "user/updateForm";
	}
	
	@PostMapping("update")
	public String kakaoupdate(String nickname, String gender, HttpSession session) throws UnsupportedEncodingException {
		System.out.println(session.getAttribute("access_Token").toString());
		JsonNode accessToken = KakaoController.getAccessToken(session.getAttribute("access_Token").toString());
		//JsonNode accessToken = node.get("access_token");
		JsonNode userid = KakaoController.kakaoupdate(nickname, gender, accessToken);
		System.out.println("������ ����� ���̵� : "+userid.get("id"));
		return "redirect:loginForm.store";
	}
	
	
	
	
	
	
	
	
	
	
}