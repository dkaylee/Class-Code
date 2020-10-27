package thread;

public class AdderThreadMain {

	public static void main(String[] args) {
		
		AdderThread at1 = new AdderThread(1,50);
		AdderThread at2 = new AdderThread(51,100);
		
		// Thread 생성
		Thread t1 = new Thread(at1);
		Thread t2 = new Thread(at2);
		
		t1.start();
		t2.start();
		
		try {
			t1.join();	// t1 쓰래드가 종료될 때 까지 다른 쓰래드는 멈춤상태 우선적으로 선택
			t2.join();
		} catch (InterruptedException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		System.out.println("1~100까지의 합은: "+at1.getNum()+at2.getNum());
				
		
		
	}

}
