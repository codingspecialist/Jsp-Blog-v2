package com.cos.action.comment;

import com.cos.action.Action;

public class CommentFactory {
	public static Action getAction(String cmd) {
	
		if(cmd.equals("delete")) {
			return new CommentDeleteAction();
		}
		return null;
	}
}
