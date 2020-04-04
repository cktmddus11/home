package logic;

public class Kakaoupdate {
	private String nickname;
	private String gender;
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	@Override
	public String toString() {
		return "Kakaoupdate [nickname=" + nickname + ", gender=" + gender + "]";
	}
	
	
	
}
