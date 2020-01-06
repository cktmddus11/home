package day1;

public class Position {
	public static void main(String[] args) {
		int x, a = 1;
		x = ++a; // a를 증감하고 대입 
		// a = 2, x = 2
		
		int y, b = 1;
		y = b++; // b를 대입하고 증감
		// b = 2, y = 1
		
		int c = (int) ((2+3) * 10.5); // 작 - 큰 명시적 형변환
		// 좌변 변수의 데이터 형이 우변의 데이터 형보다 유효범위가 클경우만
		// 자유 형변환 => 큰 - 작
		// 명시적 형변환 => 작 - 큰 
		// double float long int short byte
		int d = (int) (3 / 2.0);
		
		
		
	}
}
