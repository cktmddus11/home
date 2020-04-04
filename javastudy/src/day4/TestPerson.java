package day4;

class Person{
	private String name;
	
	void setName(String n) {
		name = n;
	}
	String getName() {
		return name;
	}
}
class Girl extends Person{
	void print() {
		System.out.println(getName()+"양");
	}
	
	// 1번 ex)
	/*void print() {
		System.out.println(name+"양");
		// name필드는 부모클래스에서 상속이 가능한 멤버이지만 private 로 제한되어있기 문에
		// 서브 클래스로 상속이 불가능하다!!!
	}*/
}
//** private 멤버는 1. 서브클래스로 계승되거나 2. 다른 오브젝트에서 이용할 수없음

public class TestPerson {
	public static void main(String[] args) {
		Girl nara = new Girl();
		nara.setName("나라");
		nara.print();
		
		// 2번 ex)
		Person p = new Person();
		//p.name = "나라"; 다른 오브젝트에서 이용할 수없음
		p.setName("승연");
		// p.print(); 부모는 자식의 멤버를 이용할 수없음
		System.out.println(p.getName());
	}
}