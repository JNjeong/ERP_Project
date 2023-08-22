package com.lab.erp.dao.login;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.lab.erp.vo.login.Erp_Employee1VO;
import com.lab.erp.vo.login.Erp_Employee2VO;

@Component
public class Erp_EmployeeDAO {
	private SqlSession sqlSession;
	
	@Autowired
	public Erp_EmployeeDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int checkEmp(Map<String, Object> map) {
		return sqlSession.selectOne("admin.checkEmp", map);
	}
	
	public String findEmpId(Map<String, Object> map) {
		return sqlSession.selectOne("admin.findEmpId", map);
	}
	
	public String findEmpPw(Map<String, Object> map) {
		return sqlSession.selectOne("admin.findEmpPw", map);
	}
	
	public int emp1MaxNo() {
		return sqlSession.selectOne("admin.emp1MaxNo");
	}
	public int emp2MaxNo() {
		return sqlSession.selectOne("admin.emp2MaxNo");
	}
	
	public int createEmployee1(Erp_Employee1VO vo) {
		return sqlSession.insert("admin.createEmployee1", vo);
	}
	public int createEmployee2(Erp_Employee2VO vo) {
		return sqlSession.insert("admin.createEmployee2", vo);
	}
	
	public int updateEmp1(Erp_Employee1VO vo) {
		return sqlSession.update("admin.updateEmployee1", vo);
	}
	public int updateEmp2(Erp_Employee2VO vo) {
		return sqlSession.update("admin.updateEmployee2", vo);
	}
	
	public int deleteEmp1(int employee1_no) {
		return sqlSession.delete("admin.deleteEmp1", employee1_no);
	}
	public int deleteEmp2(int employee2_no) {
		return sqlSession.delete("admin.deleteEmp2", employee2_no);
	}
	
	public Map<String, Object> selectEmp(int employee2_no){
		return sqlSession.selectOne("admin.selectEmp", employee2_no);
	}
	public List<Map<String, Object>> EmpList(){
		return sqlSession.selectList("admin.EmpList");
	}

	public List<Erp_Employee1VO> selectEmployee(){
		return sqlSession.selectList("b5.selectEmployee");
	}
	
	public int insertEmployee1(Erp_Employee1VO vo) {
		return sqlSession.insert("b5.insertEmployee1", vo);
	}
	
	public int insertEmployee2(Erp_Employee2VO vo) {
		return sqlSession.insert("b5.insertEmployee2", vo);
	}
	
	public int selectEmployeeno(String employee1_code) {
		return sqlSession.selectOne("b5.selectEmployeeno", employee1_code);
	}
	
	public List<Erp_Employee1VO> selectAttendance(){
		return sqlSession.selectList("b5.selectAttendance");
	}
	
}
