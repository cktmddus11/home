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

	// �޼ҵ��� ������  ��ȯ����          Ŀ�ǵ���� �̼�
	public static void main(String[] args) { // ���α׷��� ������ �� ���ʷ� ȣ��Ǵ� �޼ҵ�� 
		// �ϳ��� Ŭ������ �Ѱ��� ����� �� ����
		// ���α׷��� ������
		Eat eat = new Eat();
		eat.print1();
		eat.print2();
		eat.print3();

	}

}
