package action;
/*  ������ �̵��� ó���ϱ� ���� �ʿ��� Ŭ���� 
 * isRedirect : sendRedirect �� forward �� �����
 * �̿��ؼ� �������� �̵����� �����ϱ� ���� boolean����
 * view : �̵��� ������ ��ΰ��� �������ִ� ����
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
	public boolean isRedirect() { // ���ϰ��� boolean get�޼��� is �� ���� 
		return redirect;
	}
	public void setRedirect(boolean redirect) {
		// false �� forward ��� 
		// true�� redirect
		this.redirect = redirect;
	}
	public String getView() {
		return view;
	}
	public void setView(String view) {
		this.view = view;
	}
	
}
