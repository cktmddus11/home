package day2;
// 1 ���� 10 ���� ¦���� Ȧ���� ���� for���� 
// if���� ����Ͽ� ����ϴ� ���α׷� �ۼ�
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
		
		System.out.println("¦�� �� :"+sum+"\n"
				+"Ȧ�� �� :"+sum2);
		
	}
}
