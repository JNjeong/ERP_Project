package com.lab.erp.dao.a.a3;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Erp_ProjectDAO {
private SqlSession sqlSession;
	
	@Autowired
	public Erp_ProjectDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	
}
