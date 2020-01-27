package day3;

// Ex1
class Study{
	boolean method(int a) {
		return false;
	}
	void method(int a, int b) {
		System.out.println("안녕");
	}
	void method(long a) {
		System.out.println("안녕");
	}
}


public class TestEx1 {
	public static void main(String[] args) {
		Study english = new Study();
		Study java = new Study();
		// Ex4
		// *** 오버로딩 : 이름은 같지만 인자의 타입과 개수에 의해 구분됨!!!
		// boolean method(int a)
		// void method(int a)
		// 이름이 동일하고 인수의 갯수가 동일하므로 동일한 메서드로 인식함
		// 따라서 잘못됨
		//System.out.println(english.method(345646787));
		
		if(args.length == 0|| args.length == 1) {
			System.out.println("입력하지 않았거나 잘못입력하셨습니다");
		}else {
			for(int i = 0;i<args.length;i++) {
				System.out.println("args["+i+"]="+args[i]);
			}
		}
		
		
	}
}
