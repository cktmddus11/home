package day3;
// 메소드 호출하기 - 다른 오브젝트의 메소드를 호출하고 실행하는 방법

class Calc1{
	int add(int a, int b) {
		return a + b;
	}
}

public class Methodex2 {
	static void disp() { // static 붙어야함 - main이 static메서드이기때문에
		int c;
		Calc1 calc = new Calc1();
		c = calc.add(8, 9);
		System.out.println("8 + 9 = "+c);
		
	}
	public static void main(String[] args) {
		Calc1 calc = new Calc1();
		System.out.println("3 + 9 = "+calc.add(3,  6));
		                   ///          다른 오브젝트를 호출하기 위해서 calc(피리어드)사용
		
		disp(); 
		
	}

}
