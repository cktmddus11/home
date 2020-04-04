package soundsystem;

import java.util.List;

public class Discography {
	private String artist;
	private List<CompactDisc> list;
	
	public Discography(String artist, List<CompactDisc> cds) {
		this.artist = artist;
		this.list = cds;
	}
}
