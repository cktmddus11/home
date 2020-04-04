package test;
// Question4
public class Test2 {

	public static void main(String[] args) {
		static int i = 10; // 클래스 멤버변수를
		Test3 t1 = new Test3();
		Test3 t2 = new Test3();
		
		t1.setAge(i + 10);  // 
		t2.setAge(i + 20);
		t1.setName("홍길동");
		t2.setName("이몽룡");
		t1.setAge(i);
		print(t1);
		print(t2);

	}
	private static void print(Test3 t) {
		System.out.println("name : "+t.name+","+t.age);
	}
	class Test3{
		String name;
		int age;
		public Test3(){
			
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getAge() {
			return age;
		}
		public void setAge(int age) {
			this.age = age;
		}
		@Override
		public String toString() {
			return "Test3 [name=" + name + ", age=" + age + "]";
		}
		
		
		
	}
}
