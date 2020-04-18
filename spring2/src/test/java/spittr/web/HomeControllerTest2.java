package spittr.web;

import org.junit.Test;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
/* 
 * MockMvc 란
웹 애플리케이션을 애플리케이션 서버에 배포하지 않고도
 스프링 MVC의 동작을 재현할 수 있는 클래스
 * 
 * */
// 테스트2 => / 에 get요청을 발생시켜 결과 뷰 이름이 입력한 값과 같은지 비교
public class HomeControllerTest2 {
	@Test
	public void testHomePage() throws Exception {
		HomeController controller = new  HomeController();
		MockMvc mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
		mockMvc.perform(get("/")).andExpect(view().name("home"));
	}
}
