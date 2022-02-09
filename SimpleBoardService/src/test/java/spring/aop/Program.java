package spring.aop;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class Program {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		System.out.println(Math.ceil((double)1/5));
		
		ExamInter cal = new Cal(1,1,1,1); 
	
			Class c = Cal.class; 
			
			Field [] field	=c.getDeclaredFields();
			
			for (Field f : field) {
				System.out.println(f.getName());
			}
	
			
		ExamInter proxy	=(ExamInter) Proxy.newProxyInstance(Cal.class.getClassLoader(), new Class[] {ExamInter.class}, new InvocationHandler() {
			
			@Override
			public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
				// TODO Auto-generated method stub
			
				long start = System.currentTimeMillis();
				Object result = method.invoke(cal, args);
				
				Thread.sleep(200);
				long end = System.currentTimeMillis();
				
				String message = (end-start) +"ms 시간걸림"; 
				System.out.println(message);
				
				return result;
			}
		}
		);
			System.out.println(cal.total());
			
			
	}

}
