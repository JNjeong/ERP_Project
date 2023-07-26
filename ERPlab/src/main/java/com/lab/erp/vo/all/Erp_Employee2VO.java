package com.lab.erp.vo.all;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Erp_Employee2VO {
	private int employee2_no;
	private int employee1_no;
	private int team_no;
	private String employee2_extension;
	private String employee2_position;
	private String employee2_exp;
	private int employee2_salary;
	private Double employee2_holiday;
	private String employee2_four;
	private String employee2_worktype;
}
