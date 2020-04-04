package model;

import java.util.Date;

public class Board {
	//작성글 빈 클래스 
	private int num; // 글번호로 댓글이랑 조인
	private String mem_id;
	private String title;
	private String content;
	private String file;
	private Date regdate;
	private int readcnt;
	private String nickname;
	private int up;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	
	
	public int getUp() {
		return up;
	}
	public void setUp(int up) {
		this.up = up;
	}
	@Override
	public String toString() {
		return "Board [num=" + num + ", mem_id=" + mem_id + ", title=" + title + ", content=" + content + ", file="
				+ file + ", regdate=" + regdate + ", readcnt=" + readcnt + ", nickname=" + nickname + ", up=" + up
				+ "]";
	}
	
	
	
	
}
