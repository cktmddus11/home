package day1;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ForLoopTest {
	public static void main(String[] args) {
		int []a = {1, 2, 3, 4};
		for(int b : a) { // b�� a�� ��� ���ʴ�� �Ѱ��� ����
			System.out.println(b);
		}
		
		/*ArrayList<String> lst = new ArrayList<String>();
		
		lst.add(new String("0"));
		lst.add(new String("2"));
		lst.add(new String("3"));*/
		List<String> lst = Arrays.asList("1", "2", "3");
		for(String s:lst) {
			System.out.println(s);
		}
		
		
		
		
	}
}
