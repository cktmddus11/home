package day3;

// 가변 길이 인수
public class VarargsSample {
	
	int getMax(int ...nums) { // 가변 길이 인수와 인수의 갯수가 정해진 메소드로 오버로드 하는 메소드 가 있으면
		//갯수가 정해진 메소드를 우선으로 호출함 
		int max = 0;
		for(int i = 0;i<nums.length;i++) {
			if(i == 0) {
				max = nums[0];
			}
			if(max < nums[i]) {
				max = nums[i];
			}
		}
		return max;
	}
	
	public static void main(String[] args) {
		VarargsSample vt = new VarargsSample();
		System.out.println("(2, 3,4,5, 4) 최대값 : "+vt.getMax(2, 3,4, 5, 4));
		System.out.println("(2, 3) 최대값 : "+vt.getMax(2, 3));
		
	} 
}
