package day3;

// Ex1
class Study{
	
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
		
		if(args.length == 0|| args.length == 1) {
			System.out.println("�Է����� �ʾҰų� �߸��Է��ϼ̽��ϴ�");
		}else {
			for(int i = 0;i<args.length;i++) {
				System.out.println("args["+i+"]="+args[i]);
			}
		}
		
		
	}
}
