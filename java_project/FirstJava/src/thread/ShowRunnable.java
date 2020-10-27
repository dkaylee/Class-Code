package thread;


public class ShowRunnable implements Runnable {

	public void run() {
	for(int i=0; i<100; i++) {
		System.out.println("안녕하세요.Runnable입니다.");
		try {
			// Object 클래스의 sleep(ms)메서드 : 현재 쓰래드를 1/1000조 간격으로 잠깐 멈춤
			Thread.sleep(100);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}	//100/1000
	}
	System.out.println("Runnable 쓰래드가 종료되었습니다.");
	}
}