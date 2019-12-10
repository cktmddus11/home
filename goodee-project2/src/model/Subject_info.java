package model;

import java.util.Date;

public class Subject_info {
	private int subject_no;
	private String subject;
	private String professor;
	private String room;
	private int credit;
	private String semester;
	// 강의평
	private int grade_info;
	private int homework_info;
	private double score;
	private String eval_text;
	private String mem_id;
	private int attendance_info;
	private Date eval_date;
	
	
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public Date getEval_date() {
		return eval_date;
	}
	public void setEval_date(Date eval_date) {
		this.eval_date = eval_date;
	}
	public int getSubject_no() {
		return subject_no;
	}
	public void setSubject_no(int subject_no) {
		this.subject_no = subject_no;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getProfessor() {
		return professor;
	}
	public void setProfessor(String professor) {
		this.professor = professor;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public int getCredit() {
		return credit;
	}
	public void setCredit(int credit) {
		this.credit = credit;
	}
	

	// 강의평
	public int getGrade_info() {
		return grade_info;
	}
	public void setGrade_info(int grade_info) {
		this.grade_info = grade_info;
	}
	public int getHomework_info() {
		return homework_info;
	}
	public void setHomework_info(int homework_info) {
		this.homework_info = homework_info;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public String getEval_text() {
		return eval_text;
	}
	public void setEval_text(String eval_text) {
		this.eval_text = eval_text;
	}
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	public int getAttendance_info() {
		return attendance_info;
	}
	public void setAttendance_info(int attendance_info) {
		this.attendance_info = attendance_info;
	}
	@Override
	public String toString() {
		return "Subject_info [subject_no=" + subject_no + ", subject=" + subject + ", professor=" + professor
				+ ", room=" + room + ", credit=" + credit + ", semester=" + semester + ", grade_info=" + grade_info
				+ ", homework_info=" + homework_info + ", score=" + score + ", eval_text=" + eval_text + ", mem_id="
				+ mem_id + ", attendance_info=" + attendance_info + ", eval_date=" + eval_date + "]";
	}
	
	
	
}
