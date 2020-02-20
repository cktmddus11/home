package day4;
/* 
 * 오버라이딩이란 ?
 * - 슈퍼 쿨래스의 메소드는 서브클래스에서 다시 정의할 수 있음
 * 
 * ** 상속된 메서드와 동일한 이름, 동일한 인수를 가지는 메소드를 정의하여
 * 메소드를 덮어 쓰는 것
 * 
 * */

class Greeting{
	void bye() {
		System.out.println("good bye");
	}
}
class Insa extends Greeting{
	void bye() {
		System.out.println("오버라이딩 된 메서드");
	}
	void byeEnglish() {
		super.bye(); // super을 이용해서 서브클래스안에서
		// 슈퍼클래스의 필드와 메소드를 참조할 수 있음
	}
}

public class OverridingEx1 {

	public static void main(String[] args) {
		Greeting g = new Greeting();
		g.bye();
		
		
		Insa insa  = new Insa();
		insa.bye(); // 오버라이딩 된 메서드가 호출됨

		/* 오버리아딩에서는 메소드의 수식자를 변경할 수 있음
		 * 단 제한이 약한것을 강하게는할 수 없음?
		 * public protected default private
		 * 약                                                  강*/
		insa.byeEnglish();
		
	}

}