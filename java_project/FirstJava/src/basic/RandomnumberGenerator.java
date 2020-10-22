package basic;

import java.util.Random;

public class RandomnumberGenerator {

	public static void main(String[] args) {

		Random r = new Random();
		
		System.out.println(r.nextBoolean());
		System.out.println(r.nextInt());
		System.out.println(r.nextLong());
		System.out.println(r.nextFloat());
		System.out.println(r.nextDouble());
		
		System.out.println("이번주 로또 번호예상");
		for(int i=0; i<6; i++) {
			System.out.print(r.nextInt(45)+1+"\t"); //(0~44) +1
		}
		
		
		Random r2 = new Random(10);
		System.out.println("이번주 로또 번호예상");
		for(int i=0; i<6; i++) {
			System.out.print(r2.nextInt(45)+1+"\t"); //(0~44) +1
		}
		
		System.out.println();
		
		System.out.println(System.currentTimeMillis());
		Random r3 = new Random(System.currentTimeMillis());
		System.out.println("이번주 로또 번호예상");
		for(int i=0; i<6; i++) {
			System.out.print(r3.nextInt(45)+1+"\t"); //(0~44) +1
		}
		
		System.out.println();
		
		
		
	}

}
