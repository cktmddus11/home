package chap7; 

public class Book {
	// �ۼ���, ����, ������ ���� ������Ƽ (�������)
	// ������Ƽ�� ���� ������ �� ���� private�� ����Ѵ�. 
	private String writer;
	private String title;
	private String content;
	// getter, setter
	/* �����͸� �������ų�(get) �����ϴ� (set)
	 * ����� �ϴ� �޼��带 ����� 
	 * - �����͸� �������� ��� = get�޼��� 
	 * - �����͸� �����ϴ� ��� - set�޼���*/
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	

	
}
