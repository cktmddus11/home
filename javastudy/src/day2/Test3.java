package day2;

public class Test3 {
	public static void main(String[] args) {
		int a[] = new int[6];
		int temp = 0;
		
		a[0] = 5;
		a[1] = 2;
		a[2] = 9;
		a[3] = 4;
		a[4] = 13;
		a[5] = 6;
		
		for(int i = 0;i<a.length;i++) {
			temp = a[i] % 2;
			switch(temp) {
			case 0:
				System.out.println("�迭�� "+i+"���� ���ڴ� "+a[i]+"�� ¦���Դϴ�.");
				break;
			case 1:
				System.out.println("�迭�� "+i+"���� ���ڴ� "+a[i]+"�� Ȧ���Դϴ�.");
				break;
			default:
				System.out.println("�迭�� "+i+"���� ���ڴ� "+a[i]+"�� Ȧ���� ¦���� �ƴմϴ�.");
				break;
			}
		}
		
		
	}
}
