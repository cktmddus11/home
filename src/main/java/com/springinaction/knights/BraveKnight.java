package com.springinaction.knights;

public class BraveKnight implements Knight{
	private Quest quest;
	private Minstrel minstrel;
	
	// BraveKnight는 DamselRescuingknight과 달리 자신의 원정 quest를 직접 생성하지 않음
	// 대신 생성 시점에 생성자 인자에 원정이 부여됨
	//public BraveKnight(Quest quest, Minstrel minstrel) { 
	public BraveKnight(Quest quest) { // 생성자를 통한 종속객체 주입
		// Quest는 인터페이스 타입으로 제공되어 여러 Quest이름을 가진 구현 클래스를 
		// 주입할 수 있음 => 느슨한 결합도 
		// 사용하는 객체쪽에서는 아무런 변경없이 사용하는 종속객체를 다른 구현체로 바꾸면됨
		this.quest = quest;
		//this.minstrel = minstrel;
	}

	public void embarkOnQuest() {
		//minstrel.singBeforeQuest(); 이를 aop로 처리
		quest.embark();
		//minstrel.singAfterQuest();
	}
	
}
