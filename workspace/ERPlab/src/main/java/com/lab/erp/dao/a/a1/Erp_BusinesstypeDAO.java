package com.lab.erp.dao.a.a1;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Erp_BusinesstypeDAO {
private SqlSession sqlSession;
	
	@Autowired
	public Erp_BusinesstypeDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	
}
