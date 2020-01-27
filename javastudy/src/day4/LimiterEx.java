package day4;
/* 
 * 여러 가지 제한자
 * - final, static
 * 
 * final : 필드나 클래스에 붙이는 제한자. 
 * 필드는 값을 변경할 수 없게 되고
 * 클래스는 상속할 수 없게 된다.
 * 
 * static : 필드나 메소드에 붙이는 제한자
 * 같은 클래스에서 생성된 오브젝트들은 static을 붙인 필드의 값을 공유함
 * 
 * 
 * */
final class Animal2{ // 상속이 불가능
	
}
class A{
	static int b = 5;
}
public class LimiterEx {

	public static void main(String[] args) {
		final int a = 3; // 값변경이 불가능
		
		//a = 3; //The final local variable a cannot be assigned
		System.out.println(a);
		
		A aa = new A();
		aa.b = 3;
		System.out.println(aa.b);
		
		A bb = new A();
		bb.b = 4;
		System.out.println(bb.b);
		System.out.println(aa.b); // static을 붙였기 때문에
		// 같은 클래스에서 생성도니 오브젝트들은 static을 붙인 필드와 같은 
		// 값을 공유한다.
		
		A.b = 3; // static을 붙인 멤버는 
		// A aa = new A() 와 같이 오브젝트를 생성하지 않고도
		// 사용할 수 있음
		// 이때 오브젝트 명이 아닌 클래스명으로 지정함
		System.out.println(bb.b);
		System.out.println(aa.b);
		
		
		
	}

}



