package day5;

/* 추상메소드 : 처리내용을 기술하지 않고 호출하는 방법만 정의한 메소드 
 * 추상클래스 : 추상 메소드를 가진 클래스  
 * 
 * *** 추상 클래스의 오브젝트는 생성할 수 없음 *** new로 생성 불가능
 * *** 상속받은 추상 메소드를 오버라이딩함 
 * */
abstract class Animal{ // 추상클래스
	String name;
	abstract void cry(); // 추상메서드
	
	void move() {
		
	}
}
class Cat extends Animal{

	@Override
	void cry() {
		// 상속받은 추상메서드 오버라이딩
		System.out.println("야옹");
		
	}
	
}
////////////////////////////////
abstract class Calc1{
	int a;
	int b;
	abstract void answer(); // 추상메서드
	
	void setData(int m, int n) {
		a = m;
		b = n;
	}
}
class Plus extends Calc1{
	@Override
	void answer() {
		System.out.println(a +","+b+"="+(a+b));
	}	
}

public class Calculation {
	public static void main(String[] args) {
		Plus plus = new Plus();  // 추상클래스는 자손 클래스의 객체화를 통해서 간접적인 객체화가 가능하다
		plus.setData(27,  32);
		plus.answer();
	}
}
