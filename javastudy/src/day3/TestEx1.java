package day3;

// Ex1
class Study{
	boolean method(int a) {
		return false;
	}
	void method(int a, int b) {
		System.out.println("�ȳ�");
	}
	void method(long a) {
		System.out.println("�ȳ�");
	}
}


public class TestEx1 {
	public static void main(String[] args) {
		Study english = new Study();
		Study java = new Study();
		// Ex4
		// *** �����ε� : �̸��� ������ ������ Ÿ�԰� ������ ���� ���е�!!!
		// boolean method(int a)
		// void method(int a)
		// �̸��� �����ϰ� �μ��� ������ �����ϹǷ� ������ �޼���� �ν���
		// ���� �߸���
		//System.out.println(english.method(345646787));
		
		if(args.length == 0|| args.length == 1) {
			System.out.println("�Է����� �ʾҰų� �߸��Է��ϼ̽��ϴ�");
		}else {
			for(int i = 0;i<args.length;i++) {
				System.out.println("args["+i+"]="+args[i]);
			}
		}
		
		
	}
}
