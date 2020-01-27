package day3;
/* 
 * 오버로드란
 * - 하나의 클래스 내에 
 * 인수의 개수나 형이 다른
 *  동일한 이름의 메소드를 
 *  여러개 정의하는것 
 * 
 * */
public class OverloadEx1 {
	static int add(int a, int b) {
		return a + b;
	}
	static int add(int a) {
		return a + 1;
	}
	static double add(double a, double b) {
		return a + b;
	}
	public static void main(String[] args) {
		// 오버로드 된 메소드 호출하기 
		//  ** 메소드를 호출할 때 주어진 인수에 따라 인수의 수와 형이 대응하는 메소드가 호출됨
		System.out.println(add(5));
		System.out.println(add(3, 3));
		System.out.println(add(3.0, 3.0));
	}

}
