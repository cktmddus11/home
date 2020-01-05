package controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;



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
		String kimage = null;
		// �������� īī������ �������� Get properties
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		
		kemail = kakao_account.path("email").asText();
		kname = properties.path("nickname").asText();
		kimage = properties.path("profile_image").asText();
		kgender = kakao_account.path("gender").asText();
		kbirthday = kakao_account.path("birthday").asText();
		kage = kakao_account.path("age_range").asText();
		session.setAttribute("kemail", kemail);
		session.setAttribute("kname", kname);
		session.setAttribute("kimage", kimage);
		session.setAttribute("kgender", kgender);
		session.setAttribute("kbirthday", kbirthday);
		session.setAttribute("kage", kage);
		//���ǿ� ��ū ����
		session.setAttribute("access_Token", accessToken);
		mav.setViewName("user/login");
		return mav;
	}
	@RequestMapping("logout") // value="/logout
	public String logout(HttpSession session) {
		KakaoController.kakaoLogout((String) session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("kemail");
		return "user/loginForm"; // ../index�� �̵�
	}
	
	
	
	
	
	
	
	
	
	
	
}
