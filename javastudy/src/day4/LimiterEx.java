package day4;
/* 
 * ���� ���� ������
 * - final, static
 * 
 * final : �ʵ峪 Ŭ������ ���̴� ������. 
 * �ʵ�� ���� ������ �� ���� �ǰ�
 * Ŭ������ ����� �� ���� �ȴ�.
 * 
 * static : �ʵ峪 �޼ҵ忡 ���̴� ������
 * ���� Ŭ�������� ������ ������Ʈ���� static�� ���� �ʵ��� ���� ������
 * 
 * 
 * */
final class Animal2{ // ����� �Ұ���
	
}
class A{
	static int b = 5;
}
public class LimiterEx {

	public static void main(String[] args) {
		final int a = 3; // �������� �Ұ���
		
		//a = 3; //The final local variable a cannot be assigned
		System.out.println(a);
		
		A aa = new A();
		aa.b = 3;
		System.out.println(aa.b);
		
		A bb = new A();
		bb.b = 4;
		System.out.println(bb.b);
		System.out.println(aa.b); // static�� �ٿ��� ������
		// ���� Ŭ�������� �������� ������Ʈ���� static�� ���� �ʵ�� ���� 
		// ���� �����Ѵ�.
		
		A.b = 3; // static�� ���� ����� 
		// A aa = new A() �� ���� ������Ʈ�� �������� �ʰ�
		// ����� �� ����
		// �̶� ������Ʈ ���� �ƴ� Ŭ���������� ������
		System.out.println(bb.b);
		System.out.println(aa.b);
		
		
		
	}

}



