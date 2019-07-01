package cn.edu.service;

import java.util.List;

import cn.edu.dao.MessageDao;
import cn.edu.pojo.Message;


public class MessageService {

	MessageDao dao = new MessageDao();

	public List<Message> list(int uid) {
		// TODO Auto-generated method stub
		return dao.list(uid);
	}

	public boolean add(Message message) {
		// TODO Auto-generated method stub
		return dao.add(message);
	}

	public Message getMessage(int mid) {
		// TODO Auto-generated method stub
		return dao.getMessage(mid);
	}

	public boolean updateBymid(Message message) {
		// TODO Auto-generated method stub
		return dao.updateBymid(message);
	}

	public boolean delByid(int mid) {
		// TODO Auto-generated method stub
		return dao.delByid(mid);
	}
	
}
