package day2;
// 1 부터 10 까지 짝수와 홀수의 합을 for문과 
// if문을 사용하여 출력하는 프로그램 작성
public class Test1 {
	public static void main(String[] args) {
		int sum = 0, sum2 = 0;
		for(int i = 1;i<=10;i++) {
			if(i % 2 == 0) {
				sum = sum + i;
			}else {
				sum2 = sum2 + i;
			}
		}
		
		System.out.println("짝수 합 :"+sum+"\n"
				+"홀수 합 :"+sum2);
		
	}
}