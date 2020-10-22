package basic;

public class Wrapper2 {

	public static void main(String[] args) {

		// Wrapper 기본형
		Integer iValue = 10;	// Auto Boxing
		// Integer iValue = new Integer(10)
		// Integer iValue = Integer.valueOf(10);
		Double dValue = 3.14;
		// Double dValue = new Double(3.14);
		// Double dValue = Double.valueOf(3.14)
		Double dVal = Double.valueOf(3.14);
		
		System.out.println(iValue);	// iValue.toString()
		System.out.println(dValue);	// dValue.toString()
		
		int num1 = iValue; // integer -> int AUTO UNBOXING
		double num2 = dValue;
		
		System.out.println(num1);
		System.out.println(num2);

	}

}
