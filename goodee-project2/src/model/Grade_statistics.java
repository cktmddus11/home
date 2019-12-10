package model;

public class Grade_statistics {
	private String mem_id; 
	private String semester_code;
	private double grade_avg;
	private int sum_credit;
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
	public double getGrade_avg() {
		return grade_avg;
	}
	public void setGrade_avg(double grade_avg) {
		this.grade_avg = grade_avg;
	}
	public int getSum_credit() {
		return sum_credit;
	}
	public void setSum_credit(int sum_credit) {
		this.sum_credit = sum_credit;
	}
	@Override
	public String toString() {
		return "Grade_statistics [mem_id=" + mem_id + ", semester_code=" + semester_code + ", grade_avg=" + grade_avg
				+ ", sum_credit=" + sum_credit + "]";
	}
	
	
	
	
}
