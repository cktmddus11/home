package day4;
/* 
 * **static �޼ҵ�� �� static �޼ҵ�δ� �������̵� �� ������
 * **static �޼ҵ忡�� ������ ������Ʈ ���� ����� �̿��ϱ� ���ؼ��� 
 * ����� static�� �ٿ�����
 * */
class Purse{
	static int money = 0;
	int b = 34; // ���⿡ static�� �ٿ�����
	void printMoney(int in, int out) {
		money = money + in - out;
		if(money < 0) {
			System.out.println((-1 * money)+"�� �����մϴ�");
		}else {
			System.out.println("�ܱ��� "+money+"�� �Դϴ�.");
		}
	}
	static void print() { // static �޼ҵ忡�� 
		//b = 45; // ������Ʈ���� ������ ������Ʈ���� ����� �̿��ϱ� 
		// ���ؼ��� ����� static�� �ٿ�����
		//b = 45; // static����� �ƴϾ ����
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
