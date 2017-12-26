package com.siszo.sisproj.login.model;

import com.siszo.sisproj.employee.model.EmployeeVO;

public interface LoginService {
		//로그인 처리 관련 상수
		public static final int ADMIN_LOGIN=1;  //관리자 로그인
		public static final int EMP_LOGIN=2; //사원 로그인
		public static final int ID_NONE=3;   //해당 아이디 없음
		public static final int PWD_DISAGREE=4; //비밀번호 불일치
		
		public int loginCheck(int empNo, String empPwd);
		public EmployeeVO selectAdmin(int empNo);
}
