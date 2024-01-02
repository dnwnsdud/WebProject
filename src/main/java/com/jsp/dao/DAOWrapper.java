package com.jsp.dao;

import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DAOWrapper implements AutoCloseable{
	private BoardDAO board;
	private UserDAO user;
	private SqlSessionFactory factory;
	private SqlSession session;
	
	private <T> void OpenDAO(HttpServletRequest req, Class<T> map) {
		factory.getConfiguration().addMapper(map);
	}
	
	public DAOWrapper(HttpServletRequest req) {
		InputStream in = 
				req
					.getServletContext()
					.getResourceAsStream("/WEB-INF/config/mybatis-config.xml");
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		factory = builder.build(in);

		OpenDAO(req, BoardDAO.class);
		OpenDAO(req, UserDAO.class);
		
		session = factory.openSession(true);

		board = session.getMapper(BoardDAO.class);
		user = session.getMapper(UserDAO.class);
	}
	
	@Override
	public void close() throws Exception {
		session.close();
	}
	
	
	
	public int login(String id, String pwd) {
		String get = user.getPwd(id, pwd);
		if(get == null) return 0;
		return 0;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
