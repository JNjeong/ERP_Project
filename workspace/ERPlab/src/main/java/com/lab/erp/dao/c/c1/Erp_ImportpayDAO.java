package com.lab.erp.dao.c.c1;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Erp_ImportpayDAO {
private SqlSession sqlSession;
	
	@Autowired
	public Erp_ImportpayDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	
}
