package day4;

class Person{
	private String name;
	
	void setName(String n) {
		name = n;
	}
	String getName() {
		return name;
	}
}
class Girl extends Person{
	void print() {
		System.out.println(getName()+"��");
	}
	
	// 1�� ex)
	/*void print() {
		System.out.println(name+"��");
		// name�ʵ�� �θ�Ŭ�������� ����� ������ ��������� private �� ���ѵǾ��ֱ� ������
		// ���� Ŭ������ ����� �Ұ����ϴ�!!!
	}*/
}
//** private ����� 1. ����Ŭ������ ��µǰų� 2. �ٸ� ������Ʈ���� �̿��� ������

public class TestPerson {
	public static void main(String[] args) {
		Girl nara = new Girl();
		nara.setName("����");
		nara.print();
		
		// 2�� ex)
		Person p = new Person();
		//p.name = "����"; �ٸ� ������Ʈ���� �̿��� ������
		p.setName("�¿�");
		// p.print(); �θ�� �ڽ��� ����� �̿��� ������
		System.out.println(p.getName());
	}
}
