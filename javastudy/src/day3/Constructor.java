package day3;
/* 
 * 생성자 : 오브젝트 생성과 함께 자동적으로 호출되는 특수한 메소드
 * 
 * */
class A1{
	int a, b, c;
	// 아래 기본적인 생성자는 자동으로 생성해주기 때문에 안써도됨
	A1(){ // 생성자는 클래스명과 동일한 이름을 쓰고
		a = 0;
		b = 0;
		c = 0;
		// 반환값이 없다
	}
	@Override
	public String toString() {
		return "A1 [a=" + a + ", b=" + b + ", c=" + c + "]";
	}
	
}

public class Constructor {

	public static void main(String[] args) {
	
		A1 a = new A1(); // 오브젝트 생성 = 생성자의 호출
		System.out.println(a);
	}

}