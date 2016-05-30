package com.qinfenqi.mall.util;


import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;



public class MailUtil {
	
	public static void sendMail(String result, String toEmail, String subject) {
		
		String fromEmail = PropertyUtil.get("FROM_MAIL");
		
		JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
		
		javaMailSender.setHost(PropertyUtil.get("MAIL_HOST"));
		javaMailSender.setUsername(PropertyUtil.get("MAIL_USER"));
		javaMailSender.setPassword(PropertyUtil.get("MAIL_PASS"));
		
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		
		MimeMessageHelper helper;
		try {
			helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
		    helper.setSubject(subject);
			helper.setTo(toEmail);
			helper.setFrom(fromEmail);
			String content = result;
			helper.setText(content, true);
			javaMailSender.send(mimeMessage);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
