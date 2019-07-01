package com.tsc.util;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import cn.edu.pojo.User;





public class Sendmail extends Thread {
	// 用于给用户发送邮件的邮箱
//    private String from = "tianez_hx@163.com";
	private String from = "18632815774@163.com";
    // 邮箱的用户名
//    private String username = "tianez_hx";
	private String username = "18632815774";
    // 邮箱的密码
//    private String password = "123qweasdzxc";
	private String password = "lcm131134";
    // 发送邮件的服务器地址
    private String host = "smtp.163.com";

    private User user;
    private String code;

    public Sendmail(User user,String code) {
            this.user = user;
            this.code = code;
    }

    /*
     * 重写run方法的实现，在run方法中发送邮件给指定的用户
     *
     * @see java.lang.Thread#run()
     */
    @Override
    public void run() {
            try {
                    Properties prop = new Properties();
                    prop.setProperty("mail.host", host);
                    prop.setProperty("mail.transport.protocol", "smtp");
                    prop.setProperty("mail.smtp.auth", "true");
                    Session session = Session.getInstance(prop);
                    session.setDebug(true);
                    Transport ts = session.getTransport();
                    ts.connect(host, username, password);
                    Message message = createEmail(session, user);
                    ts.sendMessage(message, message.getAllRecipients());
                    ts.close();
            } catch (Exception e) {
                    throw new RuntimeException(e);
            }
    }

    /**
     * @Method: createEmail
     * @Description: 创建要发送的邮件
     * @Anthor:
     *
     * @param session
     * @param user
     * @return
     * @throws Exception
     */
    public Message createEmail(Session session, User user) throws Exception {

    	    //获取随机数
    	    String yan = yan();
    	
    	
            MimeMessage message = new MimeMessage(session);     
            message.setFrom(new InternetAddress(from));
            message.setRecipient(Message.RecipientType.TO,
                            new InternetAddress(user.getUemail()));
            message.setSubject("用户注册邮件");

            String info = "恭喜您注册成功，您的用户名：" + user.getUname() + ",您的密码："
                            + user.getUpwd() + "，请妥善保管，如有问题请联系网站客服!!"+"\n"+" 激活验证码为："+this.code;
            message.setContent(info, "text/html;charset=UTF-8");
            message.saveChanges();
            return message;
    }
    
    
    public String yan(){
    	
    	String yan = UUID.randomUUID().toString().substring(0, 4);
    	
		return yan;
    	
    }
}
