package spittr.web;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

// 테스트 1 => 메서드 리턴값검사
public class HomeControllerTest {
	@Test
	public void testHomePage() throws Exception{
		HomeController controller = new HomeController();
		assertEquals("home", controller.home());
	}
}
