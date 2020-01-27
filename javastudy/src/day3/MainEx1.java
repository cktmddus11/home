package day3;

class Eat{
	void print1() {
		System.out.println("E");
	}
	void print2() {
		System.out.println("A");
	}
	void print3() {
		System.out.println("T");
	}
}


public class MainEx1 {

	// 메소드의 수식자  반환값형          커맨드라인 이수
	public static void main(String[] args) { // 프로그램을 실행할 떄 최초로 호출되는 메소드로 
		// 하나의 클래스에 한개만 기술할 수 있음
		// 프로그램의 시작점
		Eat eat = new Eat();
		eat.print1();
		eat.print2();
		eat.print3();

	}

}
