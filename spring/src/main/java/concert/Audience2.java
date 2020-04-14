package concert;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

@Aspect// 어드바이스 + 포인트 커트
public class Audience2 {
	// 포인트커트 => 어디서
	@Pointcut("execution(** concert.Performance.perform(..))")
	public void performance() {}

	// 어드바이스 => 언제, 무엇을
	// @Before : perform() 메소드 전에 실행될 어드바이스 임을 나타냄
	@Before("performance()")
	public void silenceCellPhones() {// 폰 끄세요 => 공연이전
		System.out.println("Silencing cell phones"); 
	}
	@Before("performance()")
	public void takeSeats() { // 자리에 앉으세요 => 공연 이전
		System.out.println("Taking seats");
	}
	// @After : applaud() 메서드가 perform() 의 정상반환 뒤에 실행될 어드바이스임을 나타냄
	@After("performance()")
	public void applause() { // 박수 => 공연 후
		System.out.println("CLAP CLAP CLAP");
	}

	// @AfterThrowing : demandRefund()가 perform()에서 예외가 발생하는 경우 실행되어야 함
	@AfterThrowing("performance()")
	public void demandRefund() { // 환불요구 => 공연 실패 후
		System.out.println("Demanding a refund");
	}
}
