package com.siszo.sisproj.employee.common;

public class EmployeePwdLock {
	public static String convertEncryption(String str) {
		
		SHA256 sha = SHA256.getInsatnce();
		String shapass="";
		try {			
				shapass = sha.getSha256(str.getBytes());		
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return shapass;
	}
}
