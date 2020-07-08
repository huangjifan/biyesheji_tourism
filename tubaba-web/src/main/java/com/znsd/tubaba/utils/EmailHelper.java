package com.znsd.tubaba.utils;

import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class EmailHelper {
	public void send(String from,String to,String title,String context) throws AddressException, MessagingException{
		/*
		 * 邮件发送的步骤：
		 * 1、配置邮件的服务器。
		 * 2、配置邮件发送的内容。
		 * 3、进行发送。
		 * */
		Properties prop=System.getProperties();
		//设置SMTP服务器
		prop.setProperty("mail.host", "smtp.qq.com");
		//声明发送邮件所使用的协议
		prop.setProperty("mail.transport.protocol", "smtp");
		//开启邮箱安全验证
		prop.setProperty("mail.smtp.auth","true");         
		//开启邮箱使用SSL加密协议 
		prop.setProperty("mail.smtp.ssl.enable","true"); 
		//设置SMTP服务器端口号
		prop.setProperty("mail.smtp.port","465"); 
		Session session = Session.getInstance(prop,new MyAuthenticator());
		
		//普通邮件
		MimeMessage message=new MimeMessage(session);
		
		//设置发件人
		message.setFrom(new InternetAddress(from));
		//设置收件人
		message.setRecipients(Message.RecipientType.TO, to);
		//设置邮件标题
		message.setSubject(title);
		//设置邮件内容
		/*message.setText(context);*/
		
		
		// MiniMultipart类是一个容器类，包含MimeBodyPart类型的对象
        Multipart mainPart = new MimeMultipart();
     // 创建一个包含HTML内容的MimeBodyPart
        BodyPart html = new MimeBodyPart();
        // 设置HTML内容
        html.setContent(context, "text/html; charset=utf-8");
        mainPart.addBodyPart(html);
        // 将MiniMultipart对象设置为邮件内容
        message.setContent(mainPart);
        
       
		
		//发送邮件
		Transport.send(message);
}
}