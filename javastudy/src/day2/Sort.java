package day2;

public class Sort {

	public static void main(String[] args) {
		int a[] = {210, 19, 72, 129, 34};
		int b = a.length; // 5 배열 a의 요소 수
		int i, j, k;
		
		
		System.out.println("데이터 표시");
		for(i = 0;i<b;i++) {
			System.out.print(a[i]+" ");
		}System.out.println();
		
		
		// 버블정렬 - 오름차순 정렬
		// 비교기준 정하기
		for(j = 0;j<b-1;j++) { // 요소수 - 1 번 반복 
			// 5 - 1 = 4번, 0 1 2 3 
			for(i = j+1;i<b;i++) { // 비교 대상 정하기 
				// 1, 1 < 5, (1 2 3 4)
				if(a[j] > a[i]) {
					k = a[j];
					a[j] = a[i];
					a[i] = k;
				}
			}
		}
		System.out.println("정렬 후");
		for(i = 0;i<b;i++) {
			System.out.print(a[i]+" ");
		}System.out.println();
		
		// 13542
		// 1) 13542
		// 2) 12543
		// 3) 12345
	}

}