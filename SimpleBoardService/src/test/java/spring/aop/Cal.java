package spring.aop;

public class Cal implements ExamInter{

	int kor,eng,math,com;
	
	public Cal() {
		// TODO Auto-generated constructor stub
	}

	public int total(){
		
		long start = System.currentTimeMillis();
		int result = kor+eng+math+com;
		try {
			Thread.sleep(200);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		long end = System.currentTimeMillis();
		
		String message = (end-start) +"ms 시간걸림"; 
			System.out.println(message);
		return result;
	}

	public Cal(int kor, int eng, int math, int com) {
		super();
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		this.com = com;
	}
	
	
}
