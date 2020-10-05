package first;

public class MethodTest {
	public static void main(String[] args) {
		
		MyMeth my = new MyMeth(); //주소값을 반환하고 my에 저장
		
		System.out.println(my.add(1, 5));
		
		my.sayHello();//메서드 정의가 안되어있어서 
		
		my.plus(10, 20);
		
		System.out.println(my.check());
		
		hiEveryone();
		
		my.div(10, 2);
		my.div(10, 0);
		
		System.out.println(true);
		
		
	}

	static void hiEveryone()
	{
	System.out.println("안녕하세요");
	}
	
}
