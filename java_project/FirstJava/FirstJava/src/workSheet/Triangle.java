package workSheet;

public class Triangle {

	// 변수 : 밑변, 높이
	float width;
	float height;
	
	
	// 매서드: 변수의 값을 변경하는 매서드, 삼각형의 넓이를 구하고 결과를 반환하는 매서드
	// 변수의 값을 변경하는 매서드
	void setData(float w, float h) {
		width = w;
		height = h;
	}
	
	// 삼각형의 넓이는 구하고 반환하는 매서드 : 밑변*높이/2f -> 결과 실수 타입으로
	float area() {
//		float result = 0.0f;
//		result = width * height / 2;
//		return result;
		
		return width * height / 2;
	}
	
	public static void main(String[] args) {
		Triangle t = new Triangle();
		
		// 밑변과 높이 값을 설정
		t.setData(10, 3);
		
		//넓이를 구하고 변수에 담는다.
		float result = t.area();
		
		System.out.println(result);
		
		
	}
}
