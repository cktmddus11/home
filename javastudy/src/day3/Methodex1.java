package day3;
/* 
 * 메소드의 정의 - 클래스의 멤버인 메소드에 대해 이해하고 정의하는 방법알기
 * - 메소드란 ? 
 * 준 값들을 지시대로 처리한 후 결과를 출력하는 것
 * - 처리할 재료 : 인수(파라미터)
 * - 결과값  : 반환값(리턴값)
 *
 * */

class A {
	
	// 메소드 정의 
	int add(int a, int b) {
		int x;
		x = a + b;
		return x;
	}
	// 메소드 호출하기 - 동일한 오브젝트 내의 메소드를 호출하고 실행하는 방법
	void a (int x) {
		System.out.println("인수는 : "+x);
	}
	void b() {
		a(4);
	}
	
	
	
}
//반환값의 이용
class Calc{
	int add(int a, int b) {
		return a + b;
	}
	void print() {
		int c;
		c = add(8, 6);
		System.out.println(c);
	}
}


public class Methodex1 {
	
	public static void main(String[] args) {
		A a = new A();
		a.b();
		
		Calc c = new Calc();
		c.print();
		
	}
}