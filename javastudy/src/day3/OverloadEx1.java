package day3;
/* 
 * �����ε��
 * - �ϳ��� Ŭ���� ���� 
 * �μ��� ������ ���� �ٸ�
 *  ������ �̸��� �޼ҵ带 
 *  ������ �����ϴ°� 
 * 
 * */
public class OverloadEx1 {
	static int add(int a, int b) {
		return a + b;
	}
	static int add(int a) {
		return a + 1;
	}
	static double add(double a, double b) {
		return a + b;
	}
	public static void main(String[] args) {
		// �����ε� �� �޼ҵ� ȣ���ϱ� 
		//  ** �޼ҵ带 ȣ���� �� �־��� �μ��� ���� �μ��� ���� ���� �����ϴ� �޼ҵ尡 ȣ���
		System.out.println(add(5));
		System.out.println(add(3, 3));
		System.out.println(add(3.0, 3.0));
	}

}
