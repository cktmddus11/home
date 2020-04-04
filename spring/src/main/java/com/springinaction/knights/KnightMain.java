package com.springinaction.knights;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class KnightMain {
	public static void main(String[] args) {
		// 클래스패스에 있는 XML파일에서 스프링 컨텍스트 로드
		ClassPathXmlApplicationContext context 
		= new ClassPathXmlApplicationContext("com/springinaction/knights/knights.xml");
		// Knight 객체에 대한 레퍼런스를 얻음
		Knight knight = context.getBean(Knight.class);
		knight.embarkOnQuest(); // 기사가 퀘스트를 수행하러감
		// 기사는  어떤 유형의 Quest인지 어떤 기사를 다루는지 모름
		// xml파일만이 어떤 구현체인지 알수있음
		context.close();
		
	}
}
