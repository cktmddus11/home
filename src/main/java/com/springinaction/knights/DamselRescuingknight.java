package com.springinaction.knights;
// 1.2
public class DamselRescuingknight implements Knight{
	private RescueDamselQuest quest;
	
	public DamselRescuingknight() {
		this.quest = new RescueDamselQuest(); // 강하게 결합
		// DamselRescuingknight객체가 생성될때 RescueDamselQuest도 같이 생성되기
		// 때문에 1. 단위테스트 힘듬 2. 퀘스트가 유동적으로 변하기 힘듦?
	}
	public void embarkOnQuest() {
		quest.embark();
	}
}
