package model;

public class Subject_info3 {
	private String mem_id;
	private int subject_no;
	private String mem_grade;
	private String semester_code;
	private String subject;
	
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getSemester_code() {
		return semester_code;
	}
	public void setSemester_code(String semester_code) {
		this.semester_code = semester_code;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getSubject_no() {
		return subject_no;
	}
	public void setSubject_no(int subject_no) {
		this.subject_no = subject_no;
	}
	public String getMem_grade() {
		return mem_grade;
	}
	public void setMem_grade(String mem_grade) {
		this.mem_grade = mem_grade;
	}
	@Override
	public String toString() {
		return "Subject_info3 [mem_id=" + mem_id + ", subject_no=" + subject_no + ", mem_grade=" + mem_grade
				+ ", semester_code=" + semester_code + ", subject=" + subject + "]";
	}
	
}
