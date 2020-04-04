package soundsystem;

import org.springframework.stereotype.Component;

@Component // 클래스가 컴포넌트 클래스임을 나타내고
// 클래스를 빈으로 만들어야 함을 스프링에 단서로 제공
public class SgtPeppers implements CompactDisc {
	private String title ="Sgt. Pepper's Lonely Hearts Club Band";
	private String artist = "The Beatles";
	
	public void play() {
		System.out.println("Playing "+title+" by "+artist);
	}
}
