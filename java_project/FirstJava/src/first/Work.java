package first;

public class Work {

	public static void main(String[] args) {
		
		//문제1
		int num = 120;
		
		if((num%2)==0) {
			System.out.println("양수입니다.");
		}
		
		//문제2
		int num1 = 308;
		
		if(num1<0) {
			System.out.println("0미만");
		}
		else if(num1>=0&&num1<100) {
			System.out.println("0이상 100미만");
		}
		else if(num1>=200&&num1<300) {
			System.out.println("200이상 300미만");
		}
		else {
			System.out.println("300이상");
		}
		
		//문제3
		int num2 = 50, num3 = 100;
		int big = 0 ;
		int diff = 0;
		
		if(num2>num3) {
			big = num2;
			diff = num2-num3;
		}
		else {
			big = num3;
			diff = num3-num2;
		}
		System.out.println("큰수는?"+big+", 뺄셈은?"+diff);
		
		
		
		//문제4 switch문을  if-else로 바꾸기
		
		
		int n = 3;
		
		if(n==1) {
			System.out.println("Simple Java");
		}
		else if(n==2) {
			System.out.println("Funny Java");
		}
		else if(n==3) {
			System.out.println("Fantastic Java");
		}
		else {
			System.out.println("The best programming");
		}
		
		
		//문제5 문제 2의 답안 코드를 switch문으로 변경해보기
		
		int num5 = 99;
		
		switch (num5/100) {
		case 0:
			System.out.println("0이상 100미만");
			break;
		case 1:
			System.out.println("100이상");
			break;
		case 2:
			System.out.println("200이상 300미만");
			break;
		case 3:
			System.out.println("300이상");
			break;
		default:
			System.out.println("0미만");
		}
		
		

	}

}
