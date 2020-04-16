package spitter.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//컨트롤러
//메서드에 @RequestMapping => 컨트롤러가 처리하게 될 요청의 종류를 정의

@Controller // @ComponentScan가 자동으로 HomeController을 선택하여
// 스프링 컨텍스트에서 빈으로 선언
public class HomeController {
	// value : 요청 패스, method : http 메소드
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String home() {
		return "home"; // String 타입의 home리턴
		// => 렌더링 할 뷰 이름
	}// => 컨트롤러의 뷰이름을 리턴받은 DispatcherServlet가 
	// 뷰 리졸버에게 논리적인 뷰의 이름으로 실제 뷰를 결정하도록 요청함
}
