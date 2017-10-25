package message.mapper;


import java.util.List;

import main.model.Member;
import message.model.Message;

public interface MessageMapper {
	int insertMessage(Message message);
	public Integer selectMsg_no();
	public String checkId(String m_id);
	public List<Message> msg_receive(String msg_sendid);
	public Message selectMessage(int msg_no);
	public int selectMsg_hit(int msg_no);
	public int updateHitcount(Message message);
	public void deleteMessage(int msg_no);
	public Member login(Member login);

	/*public int countRecivemsg();*/
}
