package product;

public class Product {

	int price;
	int bonusPoint;
	
	// 생성자
	public Product(int price) {
		//super();	// extends Object가 생략되어있음 초기화의 대상이 있을때 아니면 생략가능
		this.price = price;
		this.bonusPoint = price/10;
	}

	@Override
	public String toString() {
		return "Product [price=" + price + ", bonusPoint=" + bonusPoint + "]";
	}
	
	
	
	
}
