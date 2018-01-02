package com.siszo.sisproj.login.model;

import com.siszo.sisproj.employee.model.EmployeeVO;

public interface LoginService {
		//로그인 처리 관련 상수
		public static final int ID_NONE=1;   //해당 아이디 없음
		public static final int PWD_DISAGREE=2; //비밀번호 불일치
		public static final int LOGIN_OK=3; //로그인 성공
		public static final int EMP_OUT=4; //퇴사직원
		public static final int NAME_DISAGREE=5; //이름 불일치
		public static final int SUSSCES_SEARCH=6; //비밀번호 찾기성공
		
		public int loginCheck(int empNo, String empPwd);
		public EmployeeVO selectAdmin(int empNo);
		public int searchPwd(int empNo, String empName);
}
