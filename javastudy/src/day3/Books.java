package day3;
// �μ��� �ִ� ������
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
		System.out.println("�� �� : "+title);
		System.out.println("�� �� : "+price);
		System.out.println("�ֹ� ���� : "+num);
		System.out.println("�հ� �ݾ� :"+price * num);
	}
}


public class Books {

	public static void main(String[] args) {
		Book book = new Book("C�� ���̴� �׸�å ", 12000);
		book.num = 10;
		book.print();
		
		Book book1 = new Book("�����ڿ� �μ��� �Ѱ��ۿ� ���°�");
		book1.print();
		
	}

}
