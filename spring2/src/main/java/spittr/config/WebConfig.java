package spittr.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc // Spring MVC 활성화
@ComponentScan("spitter.web") //component-scanning 활성화
// 해당 패키지에 있는 @Controller 애노테이션이 붙은 컴포넌트를 찾음
// => 내부에 명시적인 컨트롤러 선언을 할 필요 없음
public class WebConfig extends WebMvcConfigurerAdapter{
	// 정적 콘텐츠 처리 설정
	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver resolver = 
				new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views"); // prefix : 접두사
		resolver.setSuffix(".jsp"); // suffix : 접미사
		resolver.setExposeContextBeansAsAttributes(true);
		return resolver;
	}
	// WebMvcConfigurerAdapter를 상속받아 구현해서 오버라이딩한 메서드
	// 정적 콘텐츠 처리 설정
	@Override
	public void configureDefaultServletHandling(
			DefaultServletHandlerConfigurer configurer) {
		configurer.enable(); 
		// DispatcherServlet 이 고정적인 리소스들에 대한 요청을 자신이 직접 처리하지
		// 않고 서블릿 컨테이너의 디폴트 서블릿 전달을 요청한다. 
	}
	
}
