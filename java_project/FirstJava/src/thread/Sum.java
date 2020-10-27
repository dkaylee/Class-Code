package thread;

public class Sum {

	int num;
	
	//생성자
	Sum(){
		num = 0;
	}
	
	synchronized void addNum(int n) {
		num+=n;
	}
	
	int getNum() {
		return num;
	}
	
}
