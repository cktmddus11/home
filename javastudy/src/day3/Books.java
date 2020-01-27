package day3;
// 인수가 있는 생성자
class Book{
	int price;
	int num = 0;
	String title;
	
	Book(String t, int p){
		title = t;
		price = p;
	}
	Book(String t){
		title = t;
	}
	void print() {
		System.out.println("제 목 : "+title);
		System.out.println("가 격 : "+price);
		System.out.println("주문 수량 : "+num);
		System.out.println("합계 금액 :"+price * num);
	}
}


public class Books {

	public static void main(String[] args) {
		Book book = new Book("C가 보이는 그림책 ", 12000);
		book.num = 10;
		book.print();
		
		Book book1 = new Book("생성자에 인수가 한개밖에 없는거");
		book1.print();
		
	}

}
