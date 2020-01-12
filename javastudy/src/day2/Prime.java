package day2;

public class Prime {

	public static void main(String[] args) {
		int max = 100; // �Ҽ��� ã�� ����
		boolean[] a = new boolean[max]; // �Ҽ����� �ƴ��� �Ǻ�
		
		// �迭�� �ʱ�ȭ
		for(int i = 0;i<max;i++) {
			a[i] = true;
		}
		
		// �Ҽ��ΰ� �ƴѰ� �Ǵ�
		for(int i = 2;i<max;i++) {
			if(a[i -1]) { 
				for(int j = 2;i * j<= max;j++) {
					a[i * j -1] = false; // ����ΰ� falseó��
				}
			}
		}
		// ����� ǥ���ϱ�
		for(int i = 1;i<max;i++) {
			if(a[i]) 
				System.out.print((i + 1)+" ");
		}
		System.out.println();

	}

}
