package workSheet3;

public class StringWork {

	public static void main(String[] args) {
		/*
		 * 문제 1. 다음 형태로 String 인스턴스를 생성. 
		 * String str = “ABCDEFGHIJKLMN”; 
		 * 그리고 이 문자열을 역순으로
		 * 다시 출력하는 프로그램을 작성.
		 */
		
		/*
		 * String str = "ABCDEFGHIJKLMN"; String result = ""; for(int i =
		 * str.length()-1; i>=0; i--) { result += str.charAt(i); }
		 * System.out.println("result = " + result);
		 */
		
		String str = "ABCDEFGHIJKLMN";
		int numOfStr = str.length();
		int index = numOfStr-1; // 배열이나 문자열의 위치 index는 0~N-1
		
		String result = "";
		StringBuffer sb = new StringBuffer();
		
		// String 클래스의 charAt() 메서드를 이용해서 역순으로 출력
		for(int i=index; i>=0; i--) {
			//result += str.charAt(i);	//result = result + String
			sb.append(str.charAt(i));
		}
		
		System.out.println(str);
		System.out.println(new String(sb));
		
		System.out.println("=======================================");
		
		// StringBuffer 클래스 이용
		sb = new StringBuffer(str);  //"ABCDEFGHIJKLMN"
		System.out.println(sb);
		
		sb = sb.reverse();
		
		System.out.println(new String(sb));
		
		
		
		
		//문제2
		//문자열에서 - 제거하기
		/*
		 * String str1 = "990929-1010123";
		 * 
		 * str1 = str1.replace("-", ""); System.out.println(str1);
		 */
		
		System.out.println("문제2==================");
		
		str = "990929-1010123";
		sb = new StringBuffer();	//16개 문자 저장
		
		System.out.println(str);
		
		// String charAt() 이용
		for(int i=0; i<str.length(); i++) {
			//'-'가 아닌 경우, '0'~'9' => 문자열을 추가
			char c = str.charAt(i);
			if(c>='0' && c<='9') {
				sb.append(c);
			}
		}
		
		System.out.println(sb);
		
		// String replace()
		result = str.replace("0", "");
		System.out.println(result);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		}
	}