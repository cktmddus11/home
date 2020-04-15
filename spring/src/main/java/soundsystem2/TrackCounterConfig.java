package soundsystem2;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

import soundsystem.BlankDisc;
import soundsystem.CompactDisc;

@Configuration
@EnableAspectJAutoProxy // AspectJ 오토 프록싱 활성화
public class TrackCounterConfig {
	
	@Bean
	public CompactDisc sgtPeppers() {
		BlankDisc cd = new BlankDisc();
		cd.setTitle("Sgt. Peppers's Lonely Hearts Clup Band");
		cd.setArtist("The Beatles");
		
		List<String> tracks = new ArrayList<String>();
		tracks.add("Sgt. Pepper's Lonely Hearts Club Band");
		tracks.add("With a Little Help from My Friends");
		tracks.add("Lucy in the Sky with Diamonds");
		cd.setTrack(tracks);
		return cd;
	}
	
	@Bean
	public TrackCounter trackCounter() {
		return new TrackCounter();
	}
	
	
}
