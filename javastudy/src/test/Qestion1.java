package test;
// 1부터 1000 까지 존재하는 소수들의 합을 구하는 코드를 작성하시오
// 소수 정의 - 1과 자기 자신으로만 나누어 떨어지는 수
public class Qestion1 {

	public static void main(String[] args) {
		int i = 1;
		int sum = 0;
		while(i <= 1000) { // 10 일때  2, 3, 5, 7, = 17
			int cnt = 0;
			for(int j = 1;j<=i;j++) {
				if(i % j == 0) {
					cnt++;
				}
			}
			if(cnt == 2) {
				sum += i;
			}
			i++;
		}
		System.out.println(sum); // 76127

	}

}
