package day3;
/* 
 * ������ : ������Ʈ ������ �Բ� �ڵ������� ȣ��Ǵ� Ư���� �޼ҵ�
 * 
 * */
class A1{
	int a, b, c;
	// �Ʒ� �⺻���� �����ڴ� �ڵ����� �������ֱ� ������ �Ƚᵵ��
	A1(){ // �����ڴ� Ŭ������� ������ �̸��� ����
		a = 0;
		b = 0;
		c = 0;
		// ��ȯ���� ����
	}
	@Override
	public String toString() {
		return "A1 [a=" + a + ", b=" + b + ", c=" + c + "]";
	}
	
}

public class Constructor {

	public static void main(String[] args) {
	
		A1 a = new A1(); // ������Ʈ ���� = �������� ȣ��
		System.out.println(a);
	}

}
