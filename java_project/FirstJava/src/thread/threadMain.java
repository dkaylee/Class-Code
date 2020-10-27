package thread;

public class threadMain {

	public static void main(String[] args) {


		// Thread 생성
		ShowThread st1 = new ShowThread("1번");
		ShowThread st2 = new ShowThread("2번");
		
		// Runnable 인터페이스 이용한 Thread
		Runnable target = new ShowRunnable();
		ShowThread st3 = Thread(target);
		
		// 우선 순위 설정 1~10 : 기본 5
		System.out.println(Thread.MAX_PRIORITY);
		System.out.println(Thread.MIN_PRIORITY);
		st1.setPriority(Thread.MAX_PRIORITY);
		st1.setPriority(Thread.MIN_PRIORITY);
		
		st1.start();
		st2.start();
		st3.start();
		
		for(int i=0; i<100; i++) {
			System.out.println("안녕하세요 메인쓰래드 입니다.");
		}
		System.out.println("메인 쓰래드가 종료되었습니다.");
	}

	private static ShowThread Thread(Runnable target) {
		// TODO Auto-generated method stub
		return null;
	}

}
