package day3;

// ���� ���� �μ�
public class VarargsSample {
	
	int getMax(int ...nums) { // ���� ���� �μ��� �μ��� ������ ������ �޼ҵ�� �����ε� �ϴ� �޼ҵ� �� ������
		//������ ������ �޼ҵ带 �켱���� ȣ���� 
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
		System.out.println("(2, 3,4,5, 4) �ִ밪 : "+vt.getMax(2, 3,4, 5, 4));
		System.out.println("(2, 3) �ִ밪 : "+vt.getMax(2, 3));
		
	} 
}
