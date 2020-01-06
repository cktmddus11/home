package day1;

import java.util.StringTokenizer;

public class StringTokenizerTest {
	public static void main(String[] args) {
		StringTokenizer v = new StringTokenizer("a b c"); 
		String s = v.nextToken(); // 토큰을 순서대로 취득
		
		while(v.hasMoreTokens()) { // 취득하지 않은 토큰이 있다면 true를 반환
			s = s + "+" + (v.nextToken());
		}
		System.out.println(s);
		
	}
}
