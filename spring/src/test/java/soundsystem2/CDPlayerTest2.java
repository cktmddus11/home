package soundsystem2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes=SoundSystemConfig.class)
public class CDPlayerTest2 {
	/*@Rule
	public final SystemOutRule log = 
		new SystemOutRule().enableLog();*/
	
	@Autowired
	private CompactDisc cd;
	
	@Autowired
	private MediaPlayer player;
	
	@Test
	public void cdShouldNotBeNull() {
		assertNotNull(cd);
	}
	@Test
	public void play() {
		player.play();
	}
	
	/*@Test
	public void play() {
		player.play();
		assertEquals("Playing Sgt.Pepper's Lonely Hearts Club Band"+" by The Beatles\n", log.getLog());
	}*/
}
