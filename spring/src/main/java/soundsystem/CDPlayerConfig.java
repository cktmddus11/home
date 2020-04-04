package soundsystem;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration // 설정 클래스로부터 식별 
//@ComponentScan // 컴포넌트 스캐닝을 가능케함
public class CDPlayerConfig {
	// 동일한 설정 클래스에서 CompactDisc 빈에 의존하게됨
	/*@Bean
	public CompactDisc sgtPeppers() {
		return new SgtPeppers();
	}
	@Bean 
	public CDPlayer cdPlayer() {
		return new CDPlayer(sgtPeppers());
	}*/
	// 동일한 설정 클래스에서 CompactDisc 빈에 의존 안하게
	/*@Bean 
	public CDPlayer cdPlayer(CompactDisc compactDisc) {
		return new CDPlayer(compactDisc);
	}*/
	@Bean
	public CompactDisc sgtPeppers() {
		return new SgtPeppers();
	}//
	
	
	
}
