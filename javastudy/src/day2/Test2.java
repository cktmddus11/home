package day2;

public class Test2 {
	public static void main(String[] args) {
		int a [][] = new int[3][3];
		
		for(int i = 0;i<a.length;i++) {
			for(int j = 0;j<a[i].length;j++) {
				a[i][j] = i * 10 + j; // 0 1 2 
									  // 10 11 12 
									  // 20 21 22
				System.out.print("a["+i+"]["+j+"]="
						+a[i][j]+" ");
			}System.out.println();
		}
		
	}
}
