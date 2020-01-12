package day2;
/*
클래스 : 데이터와 처리동작을 모은것
자바는 복수의 클래스가 조하하여 이루어짐
** 재조합, 재사용

부품(물건 = 객체)별로 프로그램을 만드는 개념 : 객체지향
자바 : 객체지향 언어
Object Oriented Language

객체지향 : 데이터와 이를 처리하는 기능이 하나로 이루어져있는 
객체를 모델링하고 이들간에 관계를 정의하는것

==========
클래스는 설계도와 같은것으로 설계도를 기초하여 실체를 만들어야사용할 수있음
=> 오브젝트(객체)
실체화 하는 작업을 
=> 오브젝트(객체) 생성 OR 인스턴스화한다.

인스턴스 : 추상화 개념 또는 클래스객체를 실체화한것


*/
class Book{ // 클래스
	int price; // 필드
	int num;
	String title; 
	
	int sum() { // 메서드
		return price * num;  
	}
	// 필드, 메서드 => 클래스 멤버
}


public class ClassEx {
	
	public static void main(String[] args) {
		// 하나의 클래스에서 오브젝트 여러개 생성 할 수 있음
		Book book = new Book(); // 인스턴스 화
//    클래스명  오브젝트명 new 연산자로 오브젝트 생성
		Book book2 = new Book();
		book.price = 1300;
		book2.price = 2000;

	}

}

