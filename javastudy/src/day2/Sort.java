package day2;

public class Sort {

	public static void main(String[] args) {
		int a[] = {210, 19, 72, 129, 34};
		int b = a.length; // 5 �迭 a�� ��� ��
		int i, j, k;
		
		
		System.out.println("������ ǥ��");
		for(i = 0;i<b;i++) {
			System.out.print(a[i]+" ");
		}System.out.println();
		
		
		// �������� - �������� ����
		// �񱳱��� ���ϱ�
		for(j = 0;j<b-1;j++) { // ��Ҽ� - 1 �� �ݺ� 
			// 5 - 1 = 4��, 0 1 2 3 
			for(i = j+1;i<b;i++) { // �� ��� ���ϱ� 
				// 1, 1 < 5, (1 2 3 4)
				if(a[j] > a[i]) {
					k = a[j];
					a[j] = a[i];
					a[i] = k;
				}
			}
		}
		System.out.println("���� ��");
		for(i = 0;i<b;i++) {
			System.out.print(a[i]+" ");
		}System.out.println();
		
		// 13542
		// 1) 13542
		// 2) 12543
		// 3) 12345
	}

}
