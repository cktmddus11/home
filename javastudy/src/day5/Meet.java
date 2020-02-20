package day5;

/* 인터페이스 : 상속관계가 아닌 클래스에 기능을 제공하는 구조
 * *** 클래스와 비슷한 구조이지만 (정의와 추상 메소드만이 멤버)가 될 수 있음이 다름
 * *** 클래스에서 인터페이스를 이용하도록 하게 하는 것을 (인터페이스 구현)이라고 함
 *
 * - 인터페이스 그 자체로는 사용 불가능함
 * 인터페이스를 구현한 구현 클래스를 new 키워드를 이용해서 생성한 후 
 * 추상 메서드를 오버라이딩해야함
 * - 다중 구현이 가능함 
 * 
 * 
 * ** 추상클래스 인터페이스 공통점 - 반드시 무언가 위임해야 할 때 사용
 * 						- 직접적인 객체 생성 불가능(구현 클래스 또는 실체 클래스로 간접적인 객체 생성가능) 
 * 인터페이스는 메소드만을 호출하기 때문에 객체 내부 구조를 알 필요가 없다. 
 * 따라서 실행 내용과 리턴값을 다양화 할 수 있다. 
 * */
interface A{
	public static final int a = 2; // 상수
	public abstract void say();  // 추상 메서드
	// 인터페이스 정의에서는 수식자(public abstract)를 생략해도됨
	
	
}
class B implements A {
	public void say() {
		System.out.println("Hello");
	}
}
/////////////////////////////
interface Greet{
	void greet(); // 추상메서드 (public abstract) 생략
}
interface Talk{
	void talk();
}
class Morning implements Greet, Talk{

	@Override
	public void talk() {
		System.out.println("안녕하세요");
	}

	@Override
	public void greet() {
		System.out.println("날씨 좋네요");
	} // 다중구현 가능
	
}



public class Meet {
	public static void main(String[] args) {
		Morning morning = new Morning();
		morning.greet();
		morning.talk();
	}
}
