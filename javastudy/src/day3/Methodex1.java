package day3;
/* 
 * �޼ҵ��� ���� - Ŭ������ ����� �޼ҵ忡 ���� �����ϰ� �����ϴ� ����˱�
 * - �޼ҵ�� ? 
 * �� ������ ���ô�� ó���� �� ����� ����ϴ� ��
 * - ó���� ��� : �μ�(�Ķ����)
 * - �����  : ��ȯ��(���ϰ�)
 *
 * */

class A {
	
	// �޼ҵ� ���� 
	int add(int a, int b) {
		int x;
		x = a + b;
		return x;
	}
	// �޼ҵ� ȣ���ϱ� - ������ ������Ʈ ���� �޼ҵ带 ȣ���ϰ� �����ϴ� ���
	void a (int x) {
		System.out.println("�μ��� : "+x);
	}
	void b() {
		a(4);
	}
	
	
	
}
//��ȯ���� �̿�
class Calc{
	int add(int a, int b) {
		return a + b;
	}
	void print() {
		int c;
		c = add(8, 6);
		System.out.println(c);
	}
}


public class Methodex1 {
	
	public static void main(String[] args) {
		A a = new A();
		a.b();
		
		Calc c = new Calc();
		c.print();
		
	}
}
