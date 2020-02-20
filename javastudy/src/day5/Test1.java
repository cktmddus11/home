package day5;
/* 
 * 
 * 클래스 상속은 (객체의 재사용)이라는 장점뿐만 아니라
 * 코드의 중복을 줄임 => 코드의 간결성을 제공해 주는 객체지향적 언어의 장점과 특징으로 중요.
 * 상속은 이미 작성된 검증된 소프트웨어를 재사용하는 것으로 상속을 통하여 
 * 기존 클래스의 필드와 메소드를 재사용할 수 있습니다
 * 
 * */
class Study{
	String name; // 과목이름
	String teacher; // 과목 담임
	
	/*public Study(String name, String teacher) {
		this.name = name;
		this.teacher = teacher;
	}*/

	void printmsg() {
		System.out.println("과목이름 : "+name+"\t과목담임 : "+teacher);
	}
}
class Sub_Java extends Study{
	/*public Sub_Java(String name, String teacher) {
		super(name, teacher);
	}*/
}


public class Test1 {
	public static void main(String[] args) {
		//Sub_Java s = new Sub_Java("자바", "성안당");
		Sub_Java s = new Sub_Java();
		s.name = "자바";
		s.teacher = "성안당";
		s.printmsg();
	}
}
