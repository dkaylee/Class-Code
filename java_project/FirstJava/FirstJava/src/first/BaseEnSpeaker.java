package first;

public class BaseEnSpeaker extends Speaker {
	
	private int baseRate;
	
	public void setBaseRate(int base) {
		baseRate = base;
	}
	
	// 오버라이딩 : 상속관계에서 상속받은 메서드를 
	// 선언부는 동일하게 하고 처리부를 재구성하는 것
	@Override //어노테이션 : 자바의 문법이나 키워드와 주석은 아니다. 추가적인 의미를 구성한다.
	public void showCurrentState() {
		super.showCurrentState();
			//System.out.println("메서드의 처리부분을 변경했습니다.");
		System.out.println("베이스의 크기: " + baseRate);	
		}
	}

