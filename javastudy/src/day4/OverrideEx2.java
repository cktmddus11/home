package day4;
/* �������̵��� Ȯ�� : ��ȯ���� ���� ������ ��ġ ���� �ʴ��� 
 * �������̵� �� �� ����
 * 
 * - ��, ��ȯ���� ���� ����� �޼����� ��ȯ���� ���� ����Ŭ�������� ��
 * 
 * */
class Superz{
	Object getName() {
		return new String("SuperZ");
	}
}
class SubX extends Superz{
	@Override
	String getName() {
		return new String("SubX");
	}//�������̵��� ���� Ŭ������ ��ȯ���� String
	// �θ�Ŭ������ ��ȯ���� Object�� 
	// String �� Object�� ���� Ŭ�����̹Ƿ� ��ȯ���� �ٸ��� 
	// �������̵� �����ϴ�
}

public class OverrideEx2 {

	public static void main(String[] args) {
		SubX xx = new SubX();
		System.out.println(xx.getName());
		
	}

}

