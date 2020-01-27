package day4;
/* 
 * private 접근 제한자
 * 필드와 메소드는 다른 오브젝트로 부터 숨길 수 있음.
 * 
 * 접근제한자를 이용해서 클래스와 그 멤버의 성질을 지정할 수 있음
 * ** private을 붙인 멤버는 다른 오브젝트에서 이용할 수 없게 됨
 * */
class X{
	private int a;
	
	int getA() {
		return a;
	}
}
class Y{
	void print() {
		X x = new X();
		System.out.println(x.getA()); // 이 메서드는 private 가 아니기 때문에 이용 가능
		// 따라서 메서드를 이용해서 안에 있는 a 멤버를 이용가능 -> 0출력됨
		
		//x.a = 4; a필드는 private로 지정된 멤버이기 때문에 다른 오브젝트에서 
		// 이용 할 수 없음
	}
}

public class PrivateEx1 {

	public static void main(String[] args) {
		Y y = new Y();
		y.print();

	}

}

