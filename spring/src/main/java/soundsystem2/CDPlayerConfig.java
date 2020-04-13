package soundsystem2;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration // CD 플레이어 설정파일
@Import(CDConfig.class) // CD 설정파일 가져옴
public class CDPlayerConfig {
	@Bean
	public CDPlayer cdPlayer(CompactDisc compactDisc) {
		return new CDPlayer(compactDisc);
	}
	
}
