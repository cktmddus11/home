package day1;

public class ArrayTest {
	public static void main(String[] args) {
		int []a = new int[4]; // �迭 ����
		//               4 ��� ��
		int []b = new int[] {1,2, 3, 4}; // �迭 ����� ���ÿ� �ʱ�ȭ
		int []c = {1, 2, 3,4};
		
		// ������ �迭 
		int [][] d = {
				{10, 20, 30}, 
				{40, 50},
				{60}
		};
		
		int e[][] = new int[3][];
		e[0] = new int[3];
		e[1] = new int[2];
		e[2] = new int[1];
		
		System.out.println(e[0].length);
	}
}
