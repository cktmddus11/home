package day1;

import java.util.StringTokenizer;

public class StringTokenizerTest {
	public static void main(String[] args) {
		StringTokenizer v = new StringTokenizer("a b c"); 
		String s = v.nextToken(); // ��ū�� ������� ���
		
		while(v.hasMoreTokens()) { // ������� ���� ��ū�� �ִٸ� true�� ��ȯ
			s = s + "+" + (v.nextToken());
		}
		System.out.println(s);
		
	}
}
