package day2;

public class Roopex {
	public static void main(String[] args) {
		int a, b = 2;
		for(a = 0;a < 5;a++) {
			if(b - a <= 0) {
				// 2 - 0 <= 0 false
				// 2 - 1 <= 0 false
				// 2 - 2 <= 0 true
				break; // 반복을 중단후
			}
			System.out.println(b + "-"+a+"="+(b-a));
		} // 이곳으로 돌아옴
	}
}