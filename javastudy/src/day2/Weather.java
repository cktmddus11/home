package day2;

class Wdata{
	int month; // �ʵ� ����
	int day;
	String sky;
}

public class Weather {
	public static void main(String[] args) {
		Wdata today = new Wdata(); // ������Ʈ ����
		// �ν��Ͻ� ȭ
		
		today.month = 10;
		today.day = 5;
		today.sky = "����";
		System.out.println(today.month+"��"+
		today.day+"��"+today.sky);
	}
}
