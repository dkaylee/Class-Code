package first;

public class Work2 {

	public static void main(String[] args) {
		
		//[1] 다음 연산의 결과를 적으시오.

		int x = 2; 

		int y = 5;

		char c = 'A'; // 'A'의문자코드는 65

		System.out.println(y+= 10 - x++);	//13

		System.out.println(x+=2);	//5

		System.out.println(!('A' <= c && c <='Z') );//false

		System.out.println('C'-c);	//2

		System.out.println('5'-'0');//5

		System.out.println(c+1);	//66

		System.out.println(++c);	//B

		System.out.println(c++);	//B

		System.out.println(c);		//C
		
		
		

		//[2] 아래의 코드는 사과를 담는데 필요한 바구니(버켓)의 수를 구하는 코드이다.만일 사과의수가 123개이고 하나의 바구니에는10개의 사과를 담을 수 있다면,13개의 바구니가 필요할 것이다.(1)에 알맞은 코드를 넣으시오. 3항 연산자 : 다음에 풀어도 됩니다.
		

			int numOfApples =123; // 사과의 개수

			int sizeOfBucket =10;

			 // 바구니의 크기(바구니에 담을 수 있는 사과의 개수)

			int numOfBucket = (numOfApples/sizeOfBucket);

			 // 모든 사과를담는데 필요한 바구니의 수

			System.out.println("필요한바구니의 수 :"+ numOfBucket);
			
		//[3] 아래는 변수num의 값에 따라 ‘양수’,‘음수’,‘0’을 출력하는 코드이다.삼항 연산자를 이용해서(1)에 알맞은 코드를 넣으시오.[Hint] 삼항 연산자를 두 번 사용하라. 3항 연산자 : 다음에 풀어도 됩니다.

			int num = 10;

			System.out.println();

		
		//[4] 아래는 변수num의 값 중에서 백의 자리 이하를 버리는 코드이다.만일 변수 num 의 값이‘456’이라면 ‘400’이 되고,‘111’이라면 ‘100’이 된다.(1)에 알맞은 코드를 넣으시오.

			int num2 = 456;
			
			int num3 = (num2 / 100) * 100;
			System.out.println(num3);

		//[5] 아래는 변수num의 값 중에서 일의 자리를1로 바꾸는 코드이다.만일 변수 num의값이 333이라면 331이 되고,777이라면 771이 된다.(1)에 알맞은 코드를 넣으시오.
			
			int num4 = 333;
			int num5 = (num4 / 10) * 10 + 1;

			System.out.println(num5);

		
		//[6] 아래는 변수num의 값보다 크면서도 가장 가까운10의 배수에서 변수num의 값을뺀 나머지를 구하는 코드이다.예를 들어, 24의 크면서도 가장 가까운10의 배수는 30이다.19의 경우 20이고,81의 경우 90이 된다.30에서 24를 뺀 나머지는6이기 때문에 변수num의 값이 24라면6을결과로 얻어야 한다.(1)에 알맞은 코드를 넣으시오.
			
			int num6 = 24;
			int result1 = 0;
			
			int num7 = (num6 / 10) * 10 + 10;
			result1 = num7 % num6;

			System.out.println( result1 );
			
		
		//[7] 아래는 화씨(Fahrenheit)를 섭씨(Celcius)로 변환하는 코드이다.변환공식이 'C =5/9 ×(F - 32)'라고 할 때,(1)에 알맞은 코드를 넣으시오.단, 변환 결과값은 소수점셋째 자리에서 반올림해야 한다.(Math.round()를 사용하지 않고 처리할 것)
			
			int fahrenheit = 100;

			float celcius = (fahrenheit-32)*5f/9f;
			
			celcius = (int)(celcius*100)/(100f);

			System.out.println("Fahrenheit:"+fahrenheit);

			System.out.println("Celcius:"+celcius);

		
		//[8] 아래 코드의 문제점을 수정해서 실행결과와 같은 결과를 얻도록 하시오.
			
			byte a = 10;

			byte b = 20;

			byte c1 = (byte) (a + b);  //→ 

			char ch = 'A';

			ch = (char) (ch + 2);    // → 

			float f = 3f / 2f;   // →

			long l = 3000L * 3000L * 3000L;   // →

			float f2 = 0.1f;

			double d = 0.1;

			boolean result = d==f2;   // →

			System.out.println("c="+c1);

			System.out.println("ch="+ch);

			System.out.println("f="+f);

			System.out.println("l="+l);

			System.out.println("result="+result);

			
		//[9] 다음은 문자형 변수ch가 영문자(대문자 또는 소문자)이거나 숫자일 때만 변수b의 값이true가 되도록 하는 코드이다.(1)에 알맞은 코드를 넣으시오.
			
			[연습문제]/ch3/Exercise3_9.java

			class Exercise3_9 {

			public static void main(String[]args) {

			char ch = 'z';

			boolean b = ( /* (1) */ );

			System.out.println(b);

			}

			}

			 

			//[실행결과]

			//true
			
			
		//[10] 다음은 대문자를 소문자로 변경하는 코드인데,문자 ch에 저장된 문자가 대문자인 경우에만 소문자로 변경한다.문자코드는 소문자가 대문자보다32만큼 더 크다.예를들어 'A‘의 코드는65이고 ’a'의 코드는97이다. (1)~(2)에 알맞은 코드를 넣으시오.
			
			char ch = 'A';

			char lowerCase = ( /* (1) */ ) ? ( /* (2) */ ) : ch;

			System.out.println("ch:"+ch);

			System.out.println("chto lowerCase:"+lowerCase);

			}

			}

			//[실행결과]

			//ch:A

			//ch to lowerCase:a
			
			
			
	}

}
