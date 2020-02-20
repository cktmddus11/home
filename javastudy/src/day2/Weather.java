package day2;

class Wdata{
	int month; // 필드 정의
	int day;
	String sky;
}

public class Weather {
	public static void main(String[] args) {
		Wdata today = new Wdata(); // 오브젝트 생성
		// 인스턴스 화
		
		today.month = 10;
		today.day = 5;
		today.sky = "맑음";
		System.out.println(today.month+"월"+
		today.day+"일"+today.sky);
	}
}