package model;

public class GradeInfo {
	private String mem_id;
	private String semester_code;
	private String subject;
	private String credit;
	private double grade;
	private int subject_no;
	
	public int getSubject_no() {
		return subject_no;
	}
	public void setSubject_no(int subject_no) {
		this.subject_no = subject_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getSemester_code() {
		return semester_code;
	}
	public void setSemester_code(String semester_code) {
		this.semester_code = semester_code;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "GradeInfo [mem_id=" + mem_id + ", semester_code=" + semester_code + ", subject=" + subject + ", credit="
				+ credit + ", grade=" + grade + ", subject_no=" + subject_no + "]";
	}
	
	
}
