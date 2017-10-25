package message.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class MessageService {
	private static MessageService service = new MessageService();
	private static MessageDao dao;
	private static final int PAGE_SIZE = 10;
	
	public static MessageService getInstance(){
		dao = MessageDao.getInstance();
		return service;
	}
	
	public int insertMessageService(Message message){
	
		message.setMsg_no(dao.selectMsg_no()+1);
		return dao.insertMessage(message);
	}
	
	public int checkId(String m_id){	
		return dao.checkId(m_id);
	}
	
	public List<Message> msg_receiveService(String msg_sendid){
		return dao.msg_receive(msg_sendid);
	}
	
	
	
	public void deleteMessage(int msg_no){
		dao.deleteMessage(msg_no);
	}

	public Message selectMessageService(int msg_no){
		Message message = dao.selectMessage(msg_no);
		message.setMsg_hit(message.getMsg_hit()+1);
		dao.updateHitcount(message);
		
		return dao.selectMessage(msg_no);
	}
	
	public Member login(HttpServletRequest request){

		Member member = new Member();
		
		member.setM_id(request.getParameter("id"));
		member.setM_pw(request.getParameter("pass"));
		
		return dao.login(member);
	}
}
