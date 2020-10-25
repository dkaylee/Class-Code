package first;

public class Work2 {

	public static void main(String[] args) {
		
		//[1] 다음 연산의 결과를 적으시오.

		int x = 2; 

		int y = 5;

		char c = 'A'; // 'A'의문자코드는 65

		System.out.println(y+= 10 - x++);				//13	y=y+(10-x++) x=3

		System.out.println(x+=2);						//5		x=x+2 -> 3+2=5

		System.out.println(!('A' <= c && c <='Z') );	//false	65<-65&&65<-65 true 논리부정으로 false

		System.out.println('C'-c);						//2		67-65 =2

		System.out.println('5'-'0');					//5		

		System.out.println(c+1);						//66	char+int -> int+int -> 65+1=66	

		System.out.println(++c);						//B		증가후 출력/가감연산자는 char 그대로 유지

		System.out.println(c++);						//B		출력후 증가/ B C

		System.out.println(c);							//C		C



		//[2] 아래의 코드는 사과를 담는데 필요한 바구니(버켓)의 수를 구하는 코드이다.만일 사과의수가 123개이고 하나의 바구니에는10개의 사과를 담을 수 있다면,13개의 바구니가 필요할 것이다.(1)에 알맞은 코드를 넣으시오. 3항 연산자 : 다음에 풀어도 됩니다.
		//게시판이나 리스트를 만들때 쓰임
			
		//1.전체사과를 10으로 난눈 몫이 바구니 개수
		//2.전체사과를 10으로 나눈 나머지가 0보다 크면 바구니를+1
		
			int numOfApples =123; // 사과의 개수

			int sizeOfBucket =10;

			// 바구니의 크기(바구니에 담을 수 있는 사과의 개수)

			// int numOfBucket = numOfApples/sizeOfBucket;
			
			// 모든 사과를담는데 필요한 바구니의 수
			// if(numOfApples%10>0) {
			//	numOfBucket++;}
			
			// 3항연산자로 바꾸기
			int numOfBucket = numOfApples/10 + ( numOfApples%10 > 0 ? 1 : 0);
			
			
			System.out.println("필요한바구니의 수 :"+ numOfBucket);
			
			
		//[3] 아래는 변수 num의 값에 따라 ‘양수’,‘음수’,‘0’을 출력하는 코드이다.삼항 연산자를 이용해서(1)에 알맞은 코드를 넣으시오.[Hint] 삼항 연산자를 두 번 사용하라. 3항 연산자 : 다음에 풀어도 됩니다.
			
			
			int num = 10;
			
			System.out.println(num > 0 ? "양수":(num < 0 ? "음수" : "0" ));

		
		//[4] 아래는 변수num의 값 중에서 백의 자리 이하를 버리는 코드이다.만일 변수 num 의 값이‘456’이라면 ‘400’이 되고,‘111’이라면 ‘100’이 된다.(1)에 알맞은 코드를 넣으시오.

			num = 456;
			System.out.println( (num / 100) * 100);

		//[5] 아래는 변수num의 값 중에서 일의 자리를1로 바꾸는 코드이다.만일 변수 num의값이 333이라면 331이 되고,777이라면 771이 된다.(1)에 알맞은 코드를 넣으시오.
			
			num = 333;
			System.out.println((num / 10) * 10 + 1);

		
		//[6] 아래는 변수num의 값보다 크면서도 가장 가까운10의 배수에서 변수num의 값을뺀 나머지를 구하는 코드이다.예를 들어, 24의 크면서도 가장 가까운10의 배수는 30이다.19의 경우 20이고,81의 경우 90이 된다.30에서 24를 뺀 나머지는6이기 때문에 변수num의 값이 24라면6을결과로 얻어야 한다.(1)에 알맞은 코드를 넣으시오.
			
			num = 24;
			
			System.out.println( 10 - num % 10 );
			
		
		//[7] 아래는 화씨(Fahrenheit)를 섭씨(Celcius)로 변환하는 코드이다.변환공식이 'C =5/9 ×(F - 32)'라고 할 때,(1)에 알맞은 코드를 넣으시오.단, 변환 결과값은 소수점셋째 자리에서 반올림해야 한다.(Math.round()를 사용하지 않고 처리할 것)
			
			int fahrenheit = 100;

			float celcius = (int)(5/9f*(fahrenheit-32)*100+0.5)/100f;

			

			System.out.println("Fahrenheit:"+fahrenheit);

			System.out.println("Celcius:"+celcius);
			

		
		//[8] 아래 코드의 문제점을 수정해서 실행결과와 같은 결과를 얻도록 하시오.
			
			byte a = 10;

			byte b = 20;

			byte c1 = (byte) (a + b);  //→ 

			char ch = 'A';

			ch = (char) (ch + 2);    // → 

			float f = 3 / 2f;   // →

			long l = 3000 * 3000 * 3000L;   // →

			float f2 = 0.1f;

			double d = 0.1;

			boolean result = (float)d==f2;   // →

			System.out.println("c="+c1);

			System.out.println("ch="+ch);

			System.out.println("f="+f);

			System.out.println("l="+l);

			System.out.println("result="+result);

			
		//[9] 다음은 문자형 변수ch가 영문자(대문자 또는 소문자)이거나 숫자일 때만 변수b의 값이true가 되도록 하는 코드이다.(1)에 알맞은 코드를 넣으시오.
			
			char ch1 = 'z';
			
			boolean b1 = true;

			if((ch1>='A'&&ch1<='Z')||(ch1>='a'&&ch1<='z')||(ch1>='0'&&ch1<='9')) {
				System.out.println("result: "+b1);
			}


			 

			//[실행결과]

			//true
			
			
		//[10] 다음은 대문자를 소문자로 변경하는 코드인데,문자 ch에 저장된 문자가 대문자인 경우에만 소문자로 변경한다.문자코드는 소문자가 대문자보다32만큼 더 크다.예를들어 'A‘의 코드는65이고 ’a'의 코드는97이다. (1)~(2)에 알맞은 코드를 넣으시오.
			
			char ch2 = 'A';

 			char lowerCase = (ch2>='A'&&ch<='Z') ? (char)(ch2+32) : ch;

 			System.out.println("ch: " + ch2);

 			System.out.println("ch to lowerCase:" + lowerCase);

			
			
			
	}

}
