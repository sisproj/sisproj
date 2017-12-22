package com.siszo.sisproj.login.model;

import java.util.List;
import java.util.Map;

import com.siszo.sisproj.employee.model.EmployeeVO;

public interface LoginService {
		//로그인 처리 관련 상수
		public static final int LOGIN_OK=1;  //로그인 성공
		public static final int ID_NONE=2;   //해당 아이디 없음
		public static final int PWD_DISAGREE=3; //비밀번호 불일치
		
		
		public int loginCheck(int empNo, String empPwd);
		public EmployeeVO selectAdmin(int empNo);
		
		public List<Map<String, String>> selectEmpLev();
}
