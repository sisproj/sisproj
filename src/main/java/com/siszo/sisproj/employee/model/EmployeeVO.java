package com.siszo.sisproj.employee.model;

import java.sql.Timestamp;

public class EmployeeVO {
	private int emp_no;
	private String emp_name;
	private String emp_eName;
	private String emp_pwd;
	private String emp_tel;
	private String emp_ssn;
	private String emp_email;
	private String emp_zipcode;
	private String emp_addr;
	private String emp_addr2;
	private Timestamp emp_hiredate;
	private String emp_hobby;
	private String emp_school;
	private String emp_major;
	private Timestamp emp_outdate;
	private String emp_img;
	private String emp_lev;
	private int emp_sal;
	private String emp_bookMark;
	private int dept_no;
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getEmp_eName() {
		return emp_eName;
	}
	public void setEmp_eName(String emp_eName) {
		this.emp_eName = emp_eName;
	}
	public String getEmp_pwd() {
		return emp_pwd;
	}
	public void setEmp_pwd(String emp_pwd) {
		this.emp_pwd = emp_pwd;
	}
	public String getEmp_tel() {
		return emp_tel;
	}
	public void setEmp_tel(String emp_tel) {
		this.emp_tel = emp_tel;
	}
	public String getEmp_ssn() {
		return emp_ssn;
	}
	public void setEmp_ssn(String emp_ssn) {
		this.emp_ssn = emp_ssn;
	}
	public String getEmp_email() {
		return emp_email;
	}
	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}
	public String getEmp_zipcode() {
		return emp_zipcode;
	}
	public void setEmp_zipcode(String emp_zipcode) {
		this.emp_zipcode = emp_zipcode;
	}
	public String getEmp_addr() {
		return emp_addr;
	}
	public void setEmp_addr(String emp_addr) {
		this.emp_addr = emp_addr;
	}
	public String getEmp_addr2() {
		return emp_addr2;
	}
	public void setEmp_addr2(String emp_addr2) {
		this.emp_addr2 = emp_addr2;
	}
	public Timestamp getEmp_hiredate() {
		return emp_hiredate;
	}
	public void setEmp_hiredate(Timestamp emp_hiredate) {
		this.emp_hiredate = emp_hiredate;
	}
	public String getEmp_hobby() {
		return emp_hobby;
	}
	public void setEmp_hobby(String emp_hobby) {
		this.emp_hobby = emp_hobby;
	}
	public String getEmp_school() {
		return emp_school;
	}
	public void setEmp_school(String emp_school) {
		this.emp_school = emp_school;
	}
	public String getEmp_major() {
		return emp_major;
	}
	public void setEmp_major(String emp_major) {
		this.emp_major = emp_major;
	}
	public Timestamp getEmp_outdate() {
		return emp_outdate;
	}
	public void setEmp_outdate(Timestamp emp_outdate) {
		this.emp_outdate = emp_outdate;
	}
	public String getEmp_img() {
		return emp_img;
	}
	public void setEmp_img(String emp_img) {
		this.emp_img = emp_img;
	}
	public String getEmp_lev() {
		return emp_lev;
	}
	public void setEmp_lev(String emp_lev) {
		this.emp_lev = emp_lev;
	}
	public int getEmp_sal() {
		return emp_sal;
	}
	public void setEmp_sal(int emp_sal) {
		this.emp_sal = emp_sal;
	}
	public String getEmp_bookMark() {
		return emp_bookMark;
	}
	public void setEmp_bookMark(String emp_bookMark) {
		this.emp_bookMark = emp_bookMark;
	}
	public int getDept_no() {
		return dept_no;
	}
	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}
	@Override
	public String toString() {
		return "EmployeeVO [emp_no=" + emp_no + ", emp_name=" + emp_name + ", emp_eName=" + emp_eName + ", emp_pwd="
				+ emp_pwd + ", emp_tel=" + emp_tel + ", emp_ssn=" + emp_ssn + ", emp_email=" + emp_email
				+ ", emp_zipcode=" + emp_zipcode + ", emp_addr=" + emp_addr + ", emp_addr2=" + emp_addr2
				+ ", emp_hiredate=" + emp_hiredate + ", emp_hobby=" + emp_hobby + ", emp_school=" + emp_school
				+ ", emp_major=" + emp_major + ", emp_outdate=" + emp_outdate + ", emp_img=" + emp_img + ", emp_lev="
				+ emp_lev + ", emp_sal=" + emp_sal + ", emp_bookMark=" + emp_bookMark + ", dept_no=" + dept_no + "]";
	}
	
}
