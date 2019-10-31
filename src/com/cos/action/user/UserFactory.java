package com.cos.action.user;

import com.cos.action.Action;

public class UserFactory {
	public static Action getAction(String cmd) {
		if(cmd.equals("join")) {
			return new UserJoinAction();
		}if(cmd.equals("login")) {
			return new UserLoginAction();
		}if(cmd.equals("logout")) {
			return new UserLogoutAction();
		}if(cmd.equals("update")) {
			return new UserUpdateAction();
		}
		return null;
	}
}
