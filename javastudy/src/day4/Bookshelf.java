package day4;
// ����� ����
// ����Ŭ������ �����ϴ� ��� 

class Book{
	String title; // ����
	String genre; // �帣
	
	void printBook() {
		System.out.println("���� : "+title);
		System.out.println("�帣 : "+genre);
	}
}
class Novel extends Book{
	String writer; // �۰�
	
	void printNov() {
		printBook();
		System.out.println("���� :"+writer);
	}
}
class Magazine extends Book{
	int day;
	
	void printMsg() {
		printBook();
		System.out.println("�߸��� :"+day+"��");
	}
}


public class Bookshelf {
	public static void main(String[] args) {
		Novel nov = new Novel();
		nov.title = "�����";
		nov.genre="��������";
		nov.writer="�踸��";
		
		Magazine mag = new Magazine();
		mag.title = "���� �ڹ� �׸�å";
		mag.genre="��ǻ��";
		mag.day = 20;
		
		
		nov.printNov();
		System.out.println();
		mag.printMsg();
		
		
		
	}
}

