package day2;

public class Roopex2 {
	public static void main(String[] args) {
		int a, b = 1;
		
		for(a = 0;a<4;a++) {
			if(a + b == 2) {
				// 0 + 1 = 1 출력
				// 1 + 1 = 2 반복을 다음 회로 넘김
				// 2 + 1 = 3 출력
				// 3 + 1 = 4 출력
				continue;
			}
			System.out.println(a+"+"+b+"="+(a+b));
		}
	}
}