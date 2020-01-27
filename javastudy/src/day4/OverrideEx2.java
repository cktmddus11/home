package day4;
/* 오버라이드의 확장 : 반환값의 형이 완전히 일치 하지 않더라도 
 * 오버라이딩 할 수 있음
 * 
 * - 단, 반환값의 형은 상속한 메서드의 반환값의 형의 서브클래스여야 함
 * 
 * */
class Superz{
	Object getName() {
		return new String("SuperZ");
	}
}
class SubX extends Superz{
	@Override
	String getName() {
		return new String("SubX");
	}//오버라이딩한 서브 클래스의 반환형은 String
	// 부모클래스의 반환형은 Object로 
	// String 은 Object의 서브 클래스이므로 반환형이 다르게 
	// 오버라이드 가능하다
}

public class OverrideEx2 {

	public static void main(String[] args) {
		SubX xx = new SubX();
		System.out.println(xx.getName());
		
	}

}

