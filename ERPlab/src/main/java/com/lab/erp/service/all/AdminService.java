package com.lab.erp.service.all;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.lab.erp.dao.all.Erp_AdminDAO;
import com.lab.erp.vo.all.Erp_AdminVO;

public class AdminService {
private Erp_AdminDAO dao;
	
	@Autowired
	public AdminService(Erp_AdminDAO dao) {
		this.dao = dao;
	}
	
	public int adminMaxNo() {
		return dao.adminMaxNo();
	}
	
	public int createAdmin(Erp_AdminVO vo) {
		int no = adminMaxNo() + 1;
		
		vo.setAdmin_no(no);
		
		return dao.createAdmin(vo);
	}
	
	public int updateAdmin(Erp_AdminVO vo) {
		return dao.updateAdmin(vo);
	}
	
	public int deleteAdmin(int admin_no) {
		return dao.deleteAdmin(admin_no);
	}
	
	public Erp_AdminVO selectAdmin(Map<String, Object> map) {
		return dao.selectAdmin(map);
	}
	
	public List<Map<String, Object>> adminList(){
		return dao.adminList();
	}
	
	public Erp_AdminVO giveAdmin(int admin_no) {
		return dao.giveAdmin(admin_no);
	}
	
	public List<Map<String, Object>> teamAdmin(String team_name){
		return dao.teamAdmin(team_name);
	}
}
