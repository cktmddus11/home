package day3;
/* 
 * ����ǥ�� ���α׷�
 * - TestŬ���� : ������, ����
 * - Student Ŭ���� : �л���ȣ, �̸�, ����� 
 * */
class Test{
	String subject; // ������
	int point; // ����
	
	void setPoint(String s, int p) { // ������ �����ϴ� �޼ҵ�
		subject = s;
		point = p;
	}
	String getPoint() { // �� ������ ������ �������� �޼ҵ�
		return subject +":"+point;
	}
}
class Student{
	int id; // �л���ȣ
	String name; // �̸�
	int subnum; // �����
	Test[] test; // �׽�Ʈ Ŭ������ ������Ʈ �迭
	
	Student(int i, String n, int s){ // ������
		id = i;
		name = n;
		subnum = s;
		test = new Test[s];
		for(int j = 0;j<s;j++) {
			test[j] = new Test(); // �迭�� ��� �ϳ��ϳ��� ����
			// 						new ���� ������Ʈ�� ����
		}
		
	}
	String getName() { // �̸��� �������� �޼���
		return id +":"+name;
	}
	int getGrade() { // ������ �������� �޼���
		int sum = 0;
		for(int i = 0;i<subnum;i++) {
			sum += test[i].point;
		}
		return sum;
	}
	// �޼����� �����ε�
	int getGrade(int a) { // ������ ���ϴ� �޼���
		int base = 100 * subnum /a; // 100 * 3 / 5 = 300 / 5 = 60
		int rank = getGrade() / base + 1; // (80 + 60 + 50) / 60 + 1
		return (rank > a)?a:rank; // 3 > 5? 5 : (3)
		
	}
	void printScore() {
		System.out.println(getName()); // ������ ǥ���ϴ� �޼ҵ�
		for(int i = 0;i<subnum;i++) {
			System.out.print(test[i].getPoint()); 
		}
		System.out.println();
		System.out.println("���� : "+getGrade());
		int rank = 5;
		System.out.println(rank +"�ܰ� �� "+getGrade(rank));
		System.out.println();
	}
}

public class Classroom {

	public static void main(String[] args) {
		Student kim = new Student(12, "������", 3);
		kim.test[0].setPoint("����", 95);
		kim.test[1].setPoint("����",  83);
		kim.test[2].setPoint("����", 76);
		kim.printScore();

		Student lee = new Student(7, "�� ��", 3);
		lee.test[0].setPoint("����", 66);
		lee.test[1].setPoint("����",  97);
		lee.test[2].setPoint("����", 72);
		lee.printScore();

		
	}

}
