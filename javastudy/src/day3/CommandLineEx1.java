package day3;

public class CommandLineEx1 {

	public static void main(String[] args) {
		//             main 메서드의 인수는 String 클래스의 배열로 되어있음
		int i;
		
		if(args.length==0) { // 인수를 주지 않았을 때
			System.out.println("커맨드 라인 인수가 없습니다.");
		}else {
			for(i = 0;i<args.length;i++) {
				System.out.println((i+1)+":"+args[i]); // orange grape apple
			}											// args[0] [1] [2]
			System.out.println(args.length); // 3
		}
		// java CommandLineEx1 orange apple grape
		
	}

}