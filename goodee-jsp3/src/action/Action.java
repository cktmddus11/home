package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/* 
 * 사용자 측에서 요청이 오면  바로 jsp 페이지로 가는 것이 아닌 
 * Action 이라고 하는 자바파일을 실행하게 됨 
 * - 모든 비즈니스 로직(로그인, 데이터가져오기, 세션처리, 유효성검사 등등)
 * 을 수행하고 뷰(jsp)에서 필요한 데이터만 jsp페이지로 넘겨줌
 * 
 * 날라온 요청을 컨트롤러에서는 해당 Action 에 맵핑시키기 위해 
 * 해당 맵핑 정보가 들어있는 properties파일(보통의 텍스트파일)을 읽고
 * 해당 클래스를 사용할 수 있게끔 해준뒤 해당 클래스를 실행함.
 * */
public interface Action {
	// 추상 메서드 생성
	// 추상메서드 리턴 자료형 ActionForward 
	ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
