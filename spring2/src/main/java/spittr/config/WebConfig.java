package spittr.config;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc // Spring MVC 활성화 <annotation-driven />
@ComponentScan(basePackages={"spittr.web", "ExcelEx.controller", "ExcelEx.service", "ExcelEx.dao"}) //component-scanning 활성화
// 해당 패키지에 있는 @Controller 애노테이션이 붙은 컴포넌트를 찾음
// => 내부에 명시적인 컨트롤러 선언을 할 필요 없음
//@ImportResource("classpath:dbstudy.xml")
public class WebConfig extends WebMvcConfigurerAdapter{
	// 정적 콘텐츠 처리 설정
	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver resolver = 
				new InternalResourceViewResolver();
		// 컨트롤러에서 리턴된 논리적인 뷰 이름으로 아래 경로에 있는
		// jsp를 렌더링 해줌
		resolver.setPrefix("/WEB-INF/views/"); // prefix : 접두사
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
	// ????
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
	    registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}
	// 메시지-소스 
	@Bean
	public MessageSource messageSource() {
		ResourceBundleMessageSource messageSource = 
				new ResourceBundleMessageSource();
		// ResourceBundleMessageSource - MessageSource인터페이스로 구현됨
		messageSource.setBasename("messages"); 
		// 기본 이름 - 메시지를 불러올 프로퍼티의 파일명
		// 클래스 패스 루트에 설정된 기본 이름으로 파일명 구함
		return messageSource();
	}
	
}
