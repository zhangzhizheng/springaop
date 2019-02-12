package cn.jdk.proxy;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
/**
 * jdk的动态代理
 * @author Administrator
 *InvocationHandler接口是proxy代理实例的调用处理程序实现的一个接口，
 *每一个proxy代理实例都有一个关联的调用处理程序；
 *在代理实例调用方法时，方法调用被编码分派到调用处理程序的invoke方法。
 */
public class JdkProxy implements InvocationHandler {
	private UserDao userDao;

	public JdkProxy(UserDao userDao) {
		super();
		this.userDao = userDao;
	}
	public UserDao createProxy(){
		UserDao proxy=(UserDao) Proxy.newProxyInstance(userDao.getClass()
				.getClassLoader(),userDao.getClass().getInterfaces(), this);//还可以用匿名类
		return proxy;
		
	}
	//调用 目标对象的任何一个方法都相当于调用invoke()
	@Override
	public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
		// TODO Auto-generated method stub
		//如何是add方法执行多一个日志记录操作
		if("add".equals(method.getName())){
			//记录日志
			System.out.println("****************日志记录**************");
			Object result=method.invoke(userDao, args);
	
		}
		return method.invoke(userDao ,args);
	}
}
