package thread;

import thread.CalculatorMain.AddThread.MinThread;

public class CalculatorMain {

	public static void main() {
		
		Calculator cal = new Calculator();
		
		AddThread at = new AddThread(cal);
		MinThread mt = new MinThread(cal);
		
		at.start();
		mt.start();
		
		at.join();
		mt.join();
		
		System.out.println("연산 횟수 : " + cal.opCnt);
		
	}

	class AddThread extends Thread {
		Calculator cal;
		
		AddThread(Calculator c) {
			cal = c;
			
		}
		public void run() {
			
			for(int i=0; i < 1000; i++) {
				System.out.println("1+2=" + cal.add(2, 1));
				System.out.println("1+2=" + cal.add(4, 2));
			}
		}
		
		class MinThread extends Thread {
			Calculator cal;
			
			MinThread(Calculator c){
				cal = c;
			}
		}
	}


}
