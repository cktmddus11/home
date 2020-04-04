package day5;

// 2번
// private 란 : 접근제한자로서 멤버의 성질을 지정함
// private를 붙인 멤버는 다른 오브젝트에서 이용할 수 없음 => 메서드를 통해 멤버이용가능
// private를 붙인 멤버는 상속이 불가능함

/* 
 * 답 : 접근제한자인 private인 클래스의 필드와 메서드를 다른 오브젝트로 부터
 * 숨기기 위해서 사용.
 * private를 붙인 멤버는 다른 오브젝트에서 사용 불가능하고
 * 상속을 받은 클래스에서도 사용 불가능
 * 하지만 private가 아닌 메서드를 이용해서는 private멤버를 사용할 수 있음.
 * 
 * 
 * */



// 3번
class Super{
	private int a;
	private int b;
	void setVar(int c, int d) {
		a = c;
		b = d;
	}
	// getter생성 = private 멤버 이용하려고
	public int getA() {
		return a;
	}
	public int getB() {
		return b;
	}
	
}
class Sub extends Super{
	void printmsg() {
		//System.out.println("변수 a : "+a); // a
		//System.out.println("변수 b : "+b); // b 멤버 이용 불가능
		// -> private를 붙인 멤버는 상속이 불가능하기 때문에
		
		System.out.println("변수 a : "+getA()); // 메서드로 접근 가능
		System.out.println("변수 a : "+getB());
	}
}

public class Test2 {
	public static void main(String[] args) {
		Sub s = new Sub();
		s.setVar(3, 5);
		s.printmsg();
		
	}
}
