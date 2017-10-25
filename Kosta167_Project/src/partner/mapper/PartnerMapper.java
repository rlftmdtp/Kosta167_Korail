package partner.mapper;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import partner.model.Member;

public interface PartnerMapper {
	public List<Member> calendar_search(HashMap<String, String> map);
	public List<Member> station_search(HashMap<String, String> map);
	public List<Member> partner_allList();
}
