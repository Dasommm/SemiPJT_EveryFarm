package com.everyfarm.member.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {

private SqlSessionFactory sqlsessionfactory;
	
	public SqlSessionFactory getSqlSessionFactory() {
		String resource="com/everyfarm/member/db/config.xml";
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlsessionfactory = new SqlSessionFactoryBuilder().build(reader);
			
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sqlsessionfactory;
	}
}
