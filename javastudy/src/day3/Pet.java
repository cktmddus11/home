package day3;

class Cat{
	String name;
	String place;
	int age;
	
	void setData(String n, String p, int a) {
		name = n;
		place = p;
		age = a;
	}
	void print() {
		System.out.println(place +":"+name+","+age+"��");
	}
	void print(String p, int a) {
		place = p;
		System.out.println(place +": ����̴� "+a+"�����Դϴ�."+name);
	}
	void print(String variety) {
		System.out.println(place +":"+name+" "+age+"��"+variety);
	}
}

public class Pet {
	public static void main(String[] args) {
		Cat cat1 = new Cat();
		Cat cat2 = new Cat();
		Cat cat3 = new Cat();
		
		cat1.setData("�κ�",  "�츮��", 10);
		cat2.setData("����", "����", 14);
		cat1.print("����");
		cat2.print();
		cat3.print("�츮��", 0);
		
	}
}
