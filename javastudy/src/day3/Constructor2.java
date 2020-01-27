package day3;
/* 
 * 생성자를 기술하지 않는 경우 인수가 없는 생성자가
 * 자동으로 만들어집니다. => 디폴트 생성자
 * 
 * */
class Book2{
	String title;
	String writer;
	
	Book2(String t, String w){
		title = t;
		writer = w;
	}
	Book2(Book2 copy){
		title = copy.title;
		writer = copy.writer;
	}
	void print() {
		System.out.println("제목 : "+title);
		System.out.println("저자 : "+writer);
	}
}


public class Constructor2 {

	public static void main(String[] args) {
		Book2 b = new Book2("C가 보이는 그림책", "ANK");
		b.print();
		
		Book2 b2 = new Book2(b);
		// 동일한 클래스의 오브젝트를 인수로 받아서 
		// 대응하는 필드에 값을 대입하는 생성자를 복제 생성자라고 함
		b2.print();
		b2.title = "복제된 값을 수정";
		b2.print();
	}

}
