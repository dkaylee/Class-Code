package arr;

public class ExamArray2 {
	
	/*
	 * 문제 2.다음 메서드는 int형 1차원 배열에 저장된 값을 두 번째 매개변수로 전달될 값의
	 * 		 크기만큼 전부 증가시킨다.
	 * public static void addOneDArr(int[] arr, int add){ for (int i=0, i<arr.length; i++)
	 * arr[i] +=add; 이 메서드를 기반으로(이 메서들르 호출하는 형태로)int형 2차원 배열에 저장된 값 전부를 증가시키는 메서드를	
	 * 다음의 형태로 정의하자.
	 * public static void addOneDArr(int[][] arr, int add) { . . . . . }
	 * 단 위 메서드는 2차원 배열의 가로, 세로 길이에 상관없이 동작해야 하며, 위의 메서드가 제대로 동작하는지 확인하기 위한 main 메서드도
	 * 함께 정의해야 한다. }
	 */
	
	// 크기만 증가시킬 2차원배열 메서드
	public static void addOneDArr(int[][] arr, int add) {
		for(int i= 0; i<arr.length; i++) {
			for (int j=0; j<arr[i].length; j++) {
				arr[i][j] += add;
				System.out.print(arr[i][j]+"\t");
			}
			System.out.println();
		}
	}


	// 3씩 더해서 증가해서 출력한다.

	
	/*
	 * 문제3. 다음의 형태로 표현된 2차원 배열이 존재한다고 가정해 보자.
	 * 1 2 3
	 * 4 5 6
	 * 7 8 9
	 * 이러한 형태를 갖는 int형 2차원 배열이 인자로 전달되면, 
	 * 다음의 형태로 배열의 구조를 변경시키는 메서드를 정의해 보자.
	 * 7 8 9
	 * 1 2 3
	 * 4 5 6
	 * 즉 총 N행으로 이뤄진 2차원 배열이 존재한다면, 메서드 호출 시, 
	 * 1행은 2행으로 이동이 이뤄져야한다. 
	 * 이번에도 마찬가지로 배열의 가로,
	 * 세로길이에 상관 없이 동작을 하도록 메서드가 정의되어야 하며, 
	 * 정의된 메서드의 확인을 위한 main메서드도 함께 정의하자.
	 *
	 */
	
	
	public static void changedArr(int [][] arr2, boolean changed) {
		for(int i=0; i<arr2.length; i++) {
			for (int j=0; j< arr2[i].length; j++) {
				int[] temp = arr2[0];
				arr2[0] = arr2[1];
				arr2[1] = temp;
				
			}
		}
		
		
	}
	
	
	
	
	public static void main(String[] args) {
		
		int[][] arr = new int[][] {
			{1, 3, 5},
			{7, 9, 11},
			{13, 15, 17}};
		
			ExamArray2.addOneDArr(arr,3);
			
			
		int[][] arr2 = new int[][] {
			{1,2,3},
			{4,5,6},
			{7,8,9}};
		

		for(int i=0; i<arr2.length; i++) {
			for(int j=0; j<arr2[i].length; j++) {
				System.out.print(arr2[i][j]+"\t");
			}
			System.out.println();
		}
		
		
	}
	
}
	

	



	
	
	

