package day4;
/* 
 * �������̵��̶� ?
 * - ���� �𷡽��� �޼ҵ�� ����Ŭ�������� �ٽ� ������ �� ����
 * 
 * ** ��ӵ� �޼���� ������ �̸�, ������ �μ��� ������ �޼ҵ带 �����Ͽ�
 * �޼ҵ带 ���� ���� ��
 * 
 * */

class Greeting{
	void bye() {
		System.out.println("good bye");
	}
}
class Insa extends Greeting{
	void bye() {
		System.out.println("�������̵� �� �޼���");
	}
	void byeEnglish() {
		super.bye(); // super�� �̿��ؼ� ����Ŭ�����ȿ���
		// ����Ŭ������ �ʵ�� �޼ҵ带 ������ �� ����
	}
}

public class OverridingEx1 {

	public static void main(String[] args) {
		Greeting g = new Greeting();
		g.bye();
		
		
		Insa insa  = new Insa();
		insa.bye(); // �������̵� �� �޼��尡 ȣ���

		/* �������Ƶ������� �޼ҵ��� �����ڸ� ������ �� ����
		 * �� ������ ���Ѱ��� ���ϰԴ��� �� ����?
		 * public protected default private
		 * ��                                                  ��*/
		insa.byeEnglish();
		
	}

}
