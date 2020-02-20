package test;
// Question5
public class Test {
	private static String A = "";
	private String B = "";
	
	public Test() { // 3
		A += "A";
		B+= "A";
	}
	static { // 1
		A += "B";
	}
	{ // 1
		A += "C";
		B += "C";
	}
	public static void main(String [] args) {
		Test t = new Test(); // 인스턴스 생성 - 인스턴스 초기화 블럭 후 생성자 순
		System.out.println(A); // BCA
		t.append("D"); // A : BCAD, B : CAD
		System.out.println(A); // static니까 static 메서드에서 바로 호출가능
		System.out.println(t.B); // 인스턴스 멤버니까 피리어드 붙여서 호출
		//System.out.println(B);
		
	}
	// private : 다른 오브젝트에서 사용 불가능. 서브 클래스로 상속 불가능
	private void append(String string) {
		A += string;
		B += string;
	}
}
