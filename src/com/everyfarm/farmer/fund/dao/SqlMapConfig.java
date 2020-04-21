package com.everyfarm.farmer.fund.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	
	private SqlSessionFactory sqlsessionfactory;
	
	public SqlSessionFactory getSqlSessionFactory() {
		String resource = "com/everyfarm/farmer/fund/db/config.xml";
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlsessionfactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sqlsessionfactory;
	}
}
