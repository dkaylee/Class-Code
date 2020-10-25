package first;

public class StringTest {

	public static void main(String[] args) {
		
		
		String str1 = "My String";
		String str2 = "My String"; //이전에 있는 인스턴스를 참조
		String str3 = "your String";
		String str4 = new String("My String"); //새로운 인스턴스 참조
		
		
		// 참조변수 값의 동등 비교 : 같은 인스턴스를 참조한다.
		if(str1==str2) {
			System.out.println("같은 인스턴스를 참조");
		}else {
			System.out.println("다른 인스턴스를 참조");
		}
		
		if(str1==str3) {
			System.out.println("같은 인스턴스를 참조");
		}else {
			System.out.println("다른 인스턴스를 참조");
		}
		

		if(str1==str4) {
			System.out.println("같은 인스턴스를 참조");
		}else {
			System.out.println("다른 인스턴스를 참조");
		}
		
		System.out.println(str1.equals(str4));
		

	}

}
