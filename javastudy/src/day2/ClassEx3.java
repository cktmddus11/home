package day2;
/* 
 * 클래스의 멤버인 필드를 정의하고 참조와 대입
 * 
 * */
class X{
	// 필드 : 클래스 안에 변수
	int a = 4; // => 초기값 생략하면 디폴트값으로 초기화됨
//  형    필드명
	//a = 2;// 같은 오브젝트 내의 필드를 대입
	// 같은 오브젝트 내의 필드를 참조
	int b = a + 2;
	
}
public class ClassEx3 {
	public static void main(String[] args) {
		X x = new X();
		x.a = 5; // 다른 오브젝트를 대입
		
		int b = x.a + 2; // 다른 오브젝트를 참조
	}
}
