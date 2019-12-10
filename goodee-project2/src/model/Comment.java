package model;

import java.util.Date;

public class Comment {
	private int num;
	private String comment_id;
	private String content;
	private int comment_num;
	private String nickname;
	private Date comment_date;
	
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	@Override
	public String toString() {
		return "Comment [num=" + num + ", comment_id=" + comment_id + ", content=" + content + ", comment_num="
				+ comment_num + ", nickname=" + nickname + ", comment_date=" + comment_date + "]";
	}
	
	
	
	
	
}
