package day3;
/* 
 * �����ڸ� ������� �ʴ� ��� �μ��� ���� �����ڰ�
 * �ڵ����� ��������ϴ�. => ����Ʈ ������
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
		System.out.println("���� : "+title);
		System.out.println("���� : "+writer);
	}
}


public class Constructor2 {

	public static void main(String[] args) {
		Book2 b = new Book2("C�� ���̴� �׸�å", "ANK");
		b.print();
		
		Book2 b2 = new Book2(b);
		// ������ Ŭ������ ������Ʈ�� �μ��� �޾Ƽ� 
		// �����ϴ� �ʵ忡 ���� �����ϴ� �����ڸ� ���� �����ڶ�� ��
		b2.print();
		b2.title = "������ ���� ����";
		b2.print();
	}

}
