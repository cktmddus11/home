package day3;
// �޼ҵ� ȣ���ϱ� - �ٸ� ������Ʈ�� �޼ҵ带 ȣ���ϰ� �����ϴ� ���

class Calc1{
	int add(int a, int b) {
		return a + b;
	}
}

public class Methodex2 {
	static void disp() { // static �پ���� - main�� static�޼����̱⶧����
		int c;
		Calc1 calc = new Calc1();
		c = calc.add(8, 9);
		System.out.println("8 + 9 = "+c);
		
	}
	public static void main(String[] args) {
		Calc1 calc = new Calc1();
		System.out.println("3 + 9 = "+calc.add(3,  6));
		                   ///          �ٸ� ������Ʈ�� ȣ���ϱ� ���ؼ� calc(�Ǹ����)���
		
		disp(); 
		
	}

}
