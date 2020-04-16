package spittr.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
// DispatcherServlet java code
// AbstractAnnotationConfigDispatcherServletInitializer를 사용한
// web.xml의 대안
public class SpittrWebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer{
	// ContextLoaderListener가 생성한 애플리케이션 컨텍스트를 설정하는데 사용
	// RootConfig 루트 설정
	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class<?>[] { RootConfig.class};
	}
	// DispatcherServlet 의 애플리케이션 컨텍스트에 대한 핀들을 정의
	// DispatcherServlet 의 정의
	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class<?>[] { WebConfig.class};
	}
	// DispatcherServlet이 매핑되기 위한 하나 혹은 여러개 패스 지정
	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" }; 
	}

	
}
