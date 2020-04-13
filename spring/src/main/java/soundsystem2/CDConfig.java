package soundsystem2;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration // CD 설정파일
public class CDConfig {
	@Bean
	public CompactDisc compactDisc() {
		return new SgtPeppers();
	}
}
