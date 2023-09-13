package com.lab.erp.dao.b.b7;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.lab.erp.vo.b.b7.Erp_SuppliesVO;

@Component
public class Erp_SuppliesDAO {
private SqlSession sqlSession;
	
	@Autowired
	public Erp_SuppliesDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<Map<String, Object>> selectSupplies(Map<String, Object> map){
		return sqlSession.selectList("b7.selectSupplies", map);
	}
	
	public int insertSupplies(Erp_SuppliesVO vo) {
		return sqlSession.insert("b7.insertSupplies", vo);
	}
	
}
