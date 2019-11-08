package com.cos.util;

import org.junit.jupiter.api.Test;

public class TeTS {
	
	public static void main(String[] args) {
		String email = "getinthere@naver.com";
		String salt = "cos";
		
		String result = SHA256.getEncrypt(email, salt);
		System.out.println(result);
	}
}
