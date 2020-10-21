package first;

public class AgeInputException extends Exception{

	int age;
	
	public AgeInputException(int age) {
		super("유효하지 않은 나이가 입력되엇습니다"); //exception class가 생성자를 받아서
		this.age = age;
		
	}

	@Override
	public String toString() {
		return "AgeInputException [age=" + age + ", getMessage()=" + getMessage() + "]";
	}

	

}
