package day4;
/* 
 * **static 메소드는 비 static 메소드로는 오버라이딩 할 수없음
 * **static 메소드에서 동일한 오브젝트 내의 멤버를 이용하기 위해서는 
 * 멤버에 static을 붙여아함
 * */
class Purse{
	static int money = 0;
	int b = 34; // 여기에 static을 붙여야함
	void printMoney(int in, int out) {
		money = money + in - out;
		if(money < 0) {
			System.out.println((-1 * money)+"원 부족합니다");
		}else {
			System.out.println("잔금은 "+money+"원 입니다.");
		}
	}
	static void print() { // static 메소드에서 
		//b = 45; // 오브젝트에서 동일한 오브젝트내의 멤버를 이용하기 
		// 위해서는 멤버에 static을 붙여하함
		//b = 45; // static멤버가 아니어서 오류
	} 
	
}


public class Shopping {

	public static void main(String[] args) {
		Purse store1 = new Purse();
		Purse store2 = new Purse();
		store1.printMoney(1000,  100);
		store2.printMoney(0,  250);
		store1.printMoney(0,  800);
		
		Purse.money += 1000;
		store1.printMoney(0, 0);
		
	}

}
