package day4;
/* 
 * super : 서브클래스안에서 super라는 말을 사용하면
 * 슈퍼클래스의 필드와 메서드를 참조할 수 있음
 * 
 * */
class Animal{
	String name;
	int age;
	
	void printPet() {
		System.out.println("이름 : "+name);
		System.out.println("나이 : "+age);
	}
}
class Cat extends Animal{
	String variety;
	
	// 상속받은 메서드를 오버라이딩
	@Override
	void printPet() {
		super.printPet(); // super을 사용하여 부모클래스의 
		// 멤버를(메소드를) 참조
		System.out.println("종류 : "+variety);
		
	}
}
public class Pet {

	public static void main(String[] args) {
		Cat cat = new Cat();
		cat.name = "양순이";
		cat.age=5;
		cat.variety = "페르시안";
		cat.printPet();

	}

}
