package soundsystem;

import java.util.List;

public class BlankDisc implements CompactDisc {
	private String title;
	private String artist;
	private List<String> tracks;
	
	/*public BlankDisc(String title, String artist, List<String> tracks) {
		this.title = title;
		this.artist = artist;
		this.tracks = tracks;
	}*/
	public void setTitle(String title) {
		this.title = title;
	}
	public void setArtist(String artist ) {
		this.artist = artist;
	}
	public void setTrack(List<String> tracks) {
		this.tracks = tracks;
	}
	
	// 모든 트랙 출력
	public void play() {
		System.out.println("Playing "+title+" by "+artist);
		for(String track : tracks) {
			System.out.println("-Track : "+track);
		}
	}
	// 개별 트랙 출력
	public void playTrack(int trackNumber) {
		System.out.println(trackNumber+":"+tracks.get(trackNumber));
	}

}
