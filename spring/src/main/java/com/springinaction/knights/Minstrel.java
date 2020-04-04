package com.springinaction.knights;

import java.io.PrintStream;

public class Minstrel {
	private PrintStream stream;
	
	public Minstrel(PrintStream stream) {
		this.stream = stream;
	}
	public void singBeforeQuest() { // 퀘스트 수행전 
		stream.println("Fa la la la, the knight is so brave");
	}
	public void singAfterQuest() {// 퀘스트 수행후
		stream.println("Tee hee hee, the brave knight"+"did embark on a quest");
	}
	// Minstrel은 POJO이다
	// => Minastrel에는 애스팩트로 사용할 것임을 나타내는 
	// 내용이 전혀 없다 -> 스프링 컨텍스트 에서 선언적으로 에스팩트가 된다
	
}
