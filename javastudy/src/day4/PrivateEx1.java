package day4;
/* 
 * private ���� ������
 * �ʵ�� �޼ҵ�� �ٸ� ������Ʈ�� ���� ���� �� ����.
 * 
 * ���������ڸ� �̿��ؼ� Ŭ������ �� ����� ������ ������ �� ����
 * ** private�� ���� ����� �ٸ� ������Ʈ���� �̿��� �� ���� ��
 * */
class X{
	private int a;
	
	int getA() {
		return a;
	}
}
class Y{
	void print() {
		X x = new X();
		System.out.println(x.getA()); // �� �޼���� private �� �ƴϱ� ������ �̿� ����
		// ���� �޼��带 �̿��ؼ� �ȿ� �ִ� a ����� �̿밡�� -> 0��µ�
		
		//x.a = 4; a�ʵ�� private�� ������ ����̱� ������ �ٸ� ������Ʈ���� 
		// �̿� �� �� ����
	}
}

public class PrivateEx1 {

	public static void main(String[] args) {
		Y y = new Y();
		y.print();

	}

}

