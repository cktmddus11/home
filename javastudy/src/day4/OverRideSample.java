package day4;
// �������̵��� Ȯ��
class SuperZ{
	Number num() {
		return null;
	}
}
class SubX2 extends SuperZ{
	Double num() {
		return new Double(10);
	}//��ȯ���� ���� ����� �޼ҵ��� ��ȯ���� ���� ����ũ���� �̾����
}

public class OverRideSample {

	public static void main(String[] args) {
		SubX2 xx = new SubX2();
		System.out.println(xx.num());

	}

}
