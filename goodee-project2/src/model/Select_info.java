package model;

public class Select_info {
	private String school;
	private String dept;
	private int school_num;
	
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public int getSchool_num() {
		return school_num;
	}
	public void setSchool_num(int school_num) {
		this.school_num = school_num;
	}
	@Override
	public String toString() {
		return "Select_info [school=" + school + ", dept=" + dept + ", school_num=" + school_num + "]";
	}
	
	
	
}
