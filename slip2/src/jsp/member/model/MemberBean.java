package jsp.member.model;

public class MemberBean {
	private int id;
	private String passwd;
	private String dept;
	private String name;
	
	public int getId() {return id;}
	public void setId(int id) {this.id=id;}	
		
	public String getName() {return name;}
	public void setName(String name) {this.name=name;}
	
	public String getPasswd() {return passwd;}
	public void setPasswd(String passwd) {this.passwd=passwd;}

	
	public String getDept() {return dept;}
	public void setDept(String dept) {this.dept=dept;}
}