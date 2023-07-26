package com.lab.erp.vo.d.d1;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Erp_EvaluationVO {

	private int evaluation_no;
	private int evaluation_qty;
	private int evaluation_rest;
	private String evaluation_paperend;
	private String evaluation_actualend;
	private String evaluation_content;
	private int evaluation_status;
	private int ped_no;
	private String evaluation_date;
	private int employee2_no;
	
}
