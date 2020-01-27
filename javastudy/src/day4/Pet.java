package day4;
/* 
 * super : ����Ŭ�����ȿ��� super��� ���� ����ϸ�
 * ����Ŭ������ �ʵ�� �޼��带 ������ �� ����
 * 
 * */
class Animal{
	String name;
	int age;
	
	void printPet() {
		System.out.println("�̸� : "+name);
		System.out.println("���� : "+age);
	}
}
class Cat extends Animal{
	String variety;
	
	// ��ӹ��� �޼��带 �������̵�
	@Override
	void printPet() {
		super.printPet(); // super�� ����Ͽ� �θ�Ŭ������ 
		// �����(�޼ҵ带) ����
		System.out.println("���� : "+variety);
		
	}
}
public class Pet {

	public static void main(String[] args) {
		Cat cat = new Cat();
		cat.name = "�����";
		cat.age=5;
		cat.variety = "�丣�þ�";
		cat.printPet();

	}

}
