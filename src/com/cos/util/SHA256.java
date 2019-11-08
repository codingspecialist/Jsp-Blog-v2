package com.cos.util;

import java.security.MessageDigest;

//256bit 길이의 암호 = 해시 = 복호화가 안됨
public class SHA256 {
	//password를 암호화해서 return
	
	public static String getEncrypt(String rawPassword, String salt) {
		
		//rawPassword = "qw5678qw";
		//salt = "cos";
		String result = "";
		
		byte[] b = (rawPassword+salt).getBytes();
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(b); //MessageDigest가 SHA-256으로 암호화된 값을 들고 있음.
			
			byte[] bResult = md.digest();
			
			StringBuffer sb = new StringBuffer();
			for(byte data : bResult) {
				sb.append(Integer.toString(data & 0xff, 16));
			}
			result = sb.toString();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
