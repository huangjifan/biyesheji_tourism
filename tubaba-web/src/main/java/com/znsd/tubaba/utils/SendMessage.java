package com.znsd.tubaba.utils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

public class SendMessage {
	//短信发送
	public static boolean sendCode(String phone,String code) throws Exception {
		String code_str = URLEncoder.encode("#code#="+code,"utf-8");
		
		URL url=new URL("http://v.juhe.cn/sms/send?mobile="+phone+"&tpl_id=97821&tpl_value="+code_str+"&key=4e4ce04b281d7da3aa1f45fe52be31b0");
		
		URLConnection connection = url.openConnection();
		
		connection.connect();
		
		BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(connection.getInputStream(),"utf-8"));
	
		StringBuffer buffer = new StringBuffer();
		
		String lineData = null;
		
		while((lineData = bufferedReader.readLine()) != null) {
			buffer.append(lineData);
		}
		
		bufferedReader.close();
		if(buffer.toString().indexOf("\"error_data\":0")>=0) {
			return false;
		}else {
			return true;
		}
	}
}
