package day3;
/* 
 * 성적표시 프로그램
 * - Test클래스 : 교과명, 점수
 * - Student 클래스 : 학생번호, 이름, 과목수 
 * */
class Test{
	String subject; // 교과명
	int point; // 점수
	
	void setPoint(String s, int p) { // 점수를 설정하는 메소드
		subject = s;
		point = p;
	}
	String getPoint() { // 한 과목의 점수를 가져오는 메소드
		return subject +":"+point;
	}
}
class Student{
	int id; // 학생번호
	String name; // 이름
	int subnum; // 과목수
	Test[] test; // 테스트 클래스의 오브젝트 배열
	
	Student(int i, String n, int s){ // 생성자
		id = i;
		name = n;
		subnum = s;
		test = new Test[s];
		for(int j = 0;j<s;j++) {
			test[j] = new Test(); // 배열의 요소 하나하나에 대해
			// 						new 에서 오브젝트를 생성
		}
		
	}
	String getName() { // 이름을 가져오는 메서드
		return id +":"+name;
	}
	int getGrade() { // 총점을 가져오는 메서드
		int sum = 0;
		for(int i = 0;i<subnum;i++) {
			sum += test[i].point;
		}
		return sum;
	}
	// 메서드의 오버로드
	int getGrade(int a) { // 성적을 평가하는 메서드
		int base = 100 * subnum /a; // 100 * 3 / 5 = 300 / 5 = 60
		int rank = getGrade() / base + 1; // (80 + 60 + 50) / 60 + 1
		return (rank > a)?a:rank; // 3 > 5? 5 : (3)
		
	}
	void printScore() {
		System.out.println(getName()); // 성적을 표시하는 메소드
		for(int i = 0;i<subnum;i++) {
			System.out.print(test[i].getPoint()); 
		}
		System.out.println();
		System.out.println("총점 : "+getGrade());
		int rank = 5;
		System.out.println(rank +"단계 평가 "+getGrade(rank));
		System.out.println();
	}
}

public class Classroom {

	public static void main(String[] args) {
		Student kim = new Student(12, "김주현", 3);
		kim.test[0].setPoint("국어", 95);
		kim.test[1].setPoint("영어",  83);
		kim.test[2].setPoint("수학", 76);
		kim.printScore();

		Student lee = new Student(7, "이 진", 3);
		lee.test[0].setPoint("국어", 66);
		lee.test[1].setPoint("영어",  97);
		lee.test[2].setPoint("수학", 72);
		lee.printScore();

		
	}

}