package com.znsd.tubaba.utils;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthenticator extends Authenticator{
	String username="1209237719@qq.com";
	String userpass="hhuchhbnafpuibcj";
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		// TODO Auto-generated method stub
		return new PasswordAuthentication(username, userpass);
	}
	
}
