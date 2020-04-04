package day4;
// 상속의 정의
// 서브클래스를 정의하는 방법 

class Book{
	String title; // 제목
	String genre; // 장르
	
	void printBook() {
		System.out.println("제목 : "+title);
		System.out.println("장르 : "+genre);
	}
}
class Novel extends Book{
	String writer; // 작가
	
	void printNov() {
		printBook();
		System.out.println("저자 :"+writer);
	}
}
class Magazine extends Book{
	int day;
	
	void printMsg() {
		printBook();
		System.out.println("발매일 :"+day+"일");
	}
}


public class Bookshelf {
	public static void main(String[] args) {
		Novel nov = new Novel();
		nov.title = "구운몽";
		nov.genre="고전문학";
		nov.writer="김만중";
		
		Magazine mag = new Magazine();
		mag.title = "월간 자바 그림책";
		mag.genre="컴퓨터";
		mag.day = 20;
		
		
		nov.printNov();
		System.out.println();
		mag.printMsg();
		
		
		
	}
}