package action;
/*  페이지 이동을 처리하기 위해 필요한 클래스 
 * isRedirect : sendRedirect 와 forward 중 어떤것을
 * 이용해서 페이지를 이동할지 결정하기 위한 boolean변수
 * view : 이동할 페이지 경로값을 가지고있는 변수
 * 
 * */
public class ActionForward {
	private boolean redirect;
	private String view;
	
	public ActionForward() {}
	public ActionForward(boolean redirect, String view) {
		this.redirect = redirect;
		this.view = view;
	}
	public boolean isRedirect() { // 리턴값이 boolean get메서드 is 로 시작 
		return redirect;
	}
	public void setRedirect(boolean redirect) {
		// false 면 forward 사용 
		// true면 redirect
		this.redirect = redirect;
	}
	public String getView() {
		return view;
	}
	public void setView(String view) {
		this.view = view;
	}
	
}
