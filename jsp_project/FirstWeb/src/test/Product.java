package test;

import java.util.Arrays;

//  상품 정보를 가지는 beans 형식으로 정의
public class Product {
	
	// 상품 목록
	private String[] productList = { "item1","item2","item3","item4","item5" };
	
	// 테스트 변수
	private int price = 100;
	private int amount = 1000;
	


	public String[] getProductList() {
		return productList;
	}


	public void setProductList(String[] productList) {
		this.productList = productList;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public int getAmount() {
		return amount;
	}


	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public String getDisplay() {
		return "price: " + price + ", amount: " + amount;
	}


	@Override
	public String toString() {
		return "Product [productList=" + Arrays.toString(productList) + ", price=" + price + ", amount=" + amount + "]";
	}
	
	

}
