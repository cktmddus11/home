package model;


public class Member {
	private String mem_id;
	private String mem_password;
	private String mem_name;
	private String mem_birth;
	private int school_num; //학교 번호
	private String mem_dept;
	private String mem_nickname;
	private String school; // 이름
	private int score;
	private String mem_img;
	
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_password() {
		return mem_password;
	}
	public void setMem_password(String mem_password) {
		this.mem_password = mem_password;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_birth() {
		return mem_birth;
	}
	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}
	public int getMem_school() {
		return school_num;
	}
	public void setMem_school(int mem_school) {
		this.school_num = mem_school;
	}
	public String getMem_dept() {
		return mem_dept;
	}
	public void setMem_dept(String mem_dept) {
		this.mem_dept = mem_dept;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getSchool_num() {
		return school_num;
	}
	public void setSchool_num(int school_num) {
		this.school_num = school_num;
	}

	public String getMem_img() {
		return mem_img;
	}
	public void setMem_img(String mem_img) {
		this.mem_img = mem_img;
	}
	@Override
	public String toString() {
		return "Member [mem_id=" + mem_id + ", mem_password=" + mem_password + ", mem_name=" + mem_name + ", mem_birth="
				+ mem_birth + ", school_num=" + school_num + ", mem_dept=" + mem_dept + ", mem_nickname=" + mem_nickname
				+ ", school=" + school + ", score=" + score + ", mem_img=" + mem_img + "]";
	}
	
	
	
	
	
	
	
}
