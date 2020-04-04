package model;

import java.util.Date;

public class Subject_info2 {
	private String mem_id;
	private int school_num;
	private String eval_text;
	private String dept;
	private String subject;
	private Date eval_date;
	private int subject_no;
	
	public int getSubject_no() {
		return subject_no;
	}
	public void setSubject_no(int subject_no) {
		this.subject_no = subject_no;
	}
	public Date getEval_date() {
		return eval_date;
	}
	public void setEval_date(Date eval_date) {
		this.eval_date = eval_date;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getSchool_num() {
		return school_num;
	}
	public void setSchool_num(int school_num) {
		this.school_num = school_num;
	}
	public String getEval_text() {
		return eval_text;
	}
	public void setEval_text(String eval_text) {
		this.eval_text = eval_text;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	@Override
	public String toString() {
		return "Subject_info2 [mem_id=" + mem_id + ", school_num=" + school_num + ", eval_text=" + eval_text + ", dept="
				+ dept + ", subject=" + subject + ", eval_date=" + eval_date + ", subject_no=" + subject_no + "]";
	}
	
	
	
}
