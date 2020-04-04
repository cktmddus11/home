package chap7; 

public class Book {
	// 작성자, 제목, 내용을 담을 프로퍼티 (멤버변수)
	// 프로퍼티에 직접 접근할 수 없게 private를 사용한다. 
	private String writer;
	private String title;
	private String content;
	// getter, setter
	/* 데이터를 가져오거나(get) 세팅하는 (set)
	 * 기능을 하는 메서드를 만든다 
	 * - 데이터를 가져오는 경우 = get메서드 
	 * - 데이터를 세팅하는 경우 - set메서드*/
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
