package day3;
/* 상속의 정의
 * 
 * 서브클래스를 정의하는 방법 - extends
 */
class Animal {
	String name;
	int age;
	
	void print() {
		
	}
}
class Cat2 extends Animal{
	int birth;
}

public class InheritanceEx2 {
	public static void main(String[] args) {
		Cat2 cat = new Cat2();
		//cat.age;
		//cat.name;
		//cat.print();
		//=======위 부모꺼 === 아래 본인(서브클래스) 멤버
		//cat.birth;
		// *** 서브클래스의 오브젝트는 슈퍼클래스의 멤버를 이용할 수 있음
		

	}

}
