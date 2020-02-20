package day5;

class Drink {
	String name; // 상품명
	int price; // 단가
	int count; // 수량
	
	Drink(String name, int price, int count){
		this.name = name;
		// this를 붙이면 오브젝트의 필드인 name을 의미함
		// 우변에 name은 생성자의 인수인 name을 가리킴
		this.price = price;
		this.count = count;
	}
	
	int getTotalPrice() { // 금액을 계산
		return count * price;
	}

	static void printTitle() {
		System.out.println("상품명\r\t단가\t수량\t금액");
	}

	void printData() {
		System.out.println(name +"\t"+price+"\t"+count+"\t"+getTotalPrice());
	}
	
}
class Alcohol extends Drink{
	float alcper; // 알코올 도수
		
	Alcohol(String n, int p, int c, float a) {
		super(n, p, c); // 슈퍼 클래스의 생성자를 호출한다. 
		alcper = a;
	}
	// static 인거는 상속 불가능?
	// static 이니까 오버라이딩이 불가능 
	// 하지만 오버라이딩 된것처럼 사용 가능 (@Override)만 사용 불가능 
	// 아래와 같은것을 하이딩 이라고 함
	static void printTitle() {
		System.out.println("상품명(도수[%])\t단가\t수량\t금액");
	}
	// 메서드 오버라이딩 : 부모 클래스의 메서드를 자식 클래스에서 재정의 하여 사용
	@Override
	void printData() { 
		System.out.println(name +"("+alcper+")"+"\t"+price+"\t"+count+"\t"+getTotalPrice());
	}
	
}



public class Payment {
	public static void main(String[] args) {
		Drink coffee = new Drink("커피", 200, 3);
		Drink tea = new Drink("녹차", 150, 2);
		Alcohol wine = new Alcohol("와인", 300, 2, 15.0f);
		
		Drink.printTitle(); 
		coffee.printData();
		tea.printData();
		System.out.println();
		
		Alcohol.printTitle();
		wine.printData();
		int sum = coffee.getTotalPrice() + tea.getTotalPrice()
				+wine.getTotalPrice();
		System.out.println("\n*** 합계 금액"+sum+"원 ***");
		
	}
}
