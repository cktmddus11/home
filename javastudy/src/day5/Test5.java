package day5;

//문제 4
// 1) 변수 a 를 수식자에서 final을 사용하여 정의한 것과 사용하지 않고 정의한것 
// => 상속이 불가능하거나 가능하거나 => 클래스일때
// => 값을 변경가능하거나 아니거나 => 변수일때 

// 2) 변수 b 를 수식자 static을 사용하여 정의한 것과 사용하지 않고 정의한것 
//  static - 메소드 또는 변수에 붙임
// => 오브젝트명으로 접근해야하거나  
//    클래스명으로 접근 가능하거나
// 	  같은 클래스내에서 값을 공유하거나 아니거나

// 문제 5
class Super2{
	void printmsg() {
		System.out.println("상위 클래스입니다.");
	}
}
class Sub2 extends Super2{
	// 상위 클래스의 메서드를 오버라이딩
	@Override
	void printmsg() {
		super.printmsg(); // 상위클래스의 메서드를 참조
		System.out.println("서브클래스입니다.");
	}
}


public class Test5 {
	public static void main(String[] args) {
		Sub2 sub = new Sub2();
		sub.printmsg(); // => 상위클래스입니다. 출력후 서브클래스입니다 출력
	}
}
