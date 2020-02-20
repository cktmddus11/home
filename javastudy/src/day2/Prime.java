package day2;

public class Prime {

	public static void main(String[] args) {
		int max = 100; // 소수를 찾을 범위
		boolean[] a = new boolean[max]; // 소수인지 아닌지 판별
		
		// 배열의 초기화
		for(int i = 0;i<max;i++) {
			a[i] = true;
		}
		
		// 소수인가 아닌가 판단
		for(int i = 2;i<max;i++) {
			if(a[i -1]) { 
				for(int j = 2;i * j<= max;j++) {
					a[i * j -1] = false; // 배수인거 false처리
				}
			}
		}
		// 결과를 표시하기
		for(int i = 1;i<max;i++) {
			if(a[i]) 
				System.out.print((i + 1)+" ");
		}
		System.out.println();

	}

}