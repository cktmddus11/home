package day4;
// 오버라이드의 확정
class SuperZ{
	Number num() {
		return null;
	}
}
class SubX2 extends SuperZ{
	Double num() {
		return new Double(10);
	}//반환값의 형은 상속한 메소드의 반환값의 형이 서브크래스 이어야함
}

public class OverRideSample {

	public static void main(String[] args) {
		SubX2 xx = new SubX2();
		System.out.println(xx.num());

	}

}