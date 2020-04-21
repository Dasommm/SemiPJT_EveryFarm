package com.everyfarm.eventboard.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {

private SqlSessionFactory sqlSessionFactory;
	
	public SqlSessionFactory getSqlSessionFactory() {    //편의성을 위해 공통사용되는 객체를 함수로 따로 만들어둔다
		String resource="com/everyfarm/eventboard/db/config.xml";
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			
			reader.close();
		} catch (IOException e) {
			System.out.println("[error]:SqlMapConfigS");
			e.printStackTrace();
		}
		return sqlSessionFactory;
	}
}
