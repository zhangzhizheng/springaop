package cn.jdk.proxy;

import org.junit.Test;

public class SpringTest {
	//普通方法
	@Test
	public void test(){
		UserDao userDao=new UserDaoImpl();
		userDao.add();
		userDao.update();
	}
	//采用代理模式
	@Test
	public void demo2(){
		UserDao userDao=new UserDaoImpl();
		UserDao proxy=new JdkProxy(userDao).createProxy();//生成代理
		proxy.add();
		proxy.update();
	}
}
