package com.springinaction.knights;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class KnigntConfig {
	@Bean
	public Knight knight() {
		return new BraveKnight(quest());
	}

	private Quest quest() {
		return new SlayDragonQuest(System.out);
	}
}
