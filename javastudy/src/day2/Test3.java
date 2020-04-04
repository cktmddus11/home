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
				System.out.println("¹è¿­ÀÇ "+i+"¹ø¤Š ¼ýÀÚ´Â "+a[i]+"·Î Â¦¼öÀÔ´Ï´Ù.");
				break;
			case 1:
				System.out.println("¹è¿­ÀÇ "+i+"¹ø¤Š ¼ýÀÚ´Â "+a[i]+"·Î È¦¼öÀÔ´Ï´Ù.");
				break;
			default:
				System.out.println("¹è¿­ÀÇ "+i+"¹ø¤Š ¼ýÀÚ´Â "+a[i]+"·Î È¦¼öµµ Â¦¼öµµ ¾Æ´Õ´Ï´Ù.");
				break;
			}
		}
		
		
	}
}