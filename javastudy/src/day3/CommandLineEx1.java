package day3;

public class CommandLineEx1 {

	public static void main(String[] args) {
		//             main �޼����� �μ��� String Ŭ������ �迭�� �Ǿ�����
		int i;
		
		if(args.length==0) { // �μ��� ���� �ʾ��� ��
			System.out.println("Ŀ�ǵ� ���� �μ��� �����ϴ�.");
		}else {
			for(i = 0;i<args.length;i++) {
				System.out.println((i+1)+":"+args[i]); // orange grape apple
			}											// args[0] [1] [2]
			System.out.println(args.length); // 3
		}
		// java CommandLineEx1 orange apple grape
		
	}

}
