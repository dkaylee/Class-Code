package arr;

public class ExamArray2 {
	
	/*
	 * 문제 2.
	 */

	public static void addOneDArr(int[][] arr, int add) {
		for(int i= 0; i<arr.length; i++) {
			for (int j=0; j<arr[i].length; j++) {
				arr[i][j] += add;
			}
		}
	}
	
	
	

	public static void main(String[] args) {
		
		
		System.out.println(addOneDArr(null, 0));
		
		
		
	}
	
	
	
	
	

}
