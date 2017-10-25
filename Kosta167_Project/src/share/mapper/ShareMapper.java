package share.mapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import share.model.Member;
import share.model.Share;
import share.model.ShareReply;
import share.model.ShareSearch;

public interface ShareMapper {
	public Integer selectSh_no();
	
	public Member login(Member login);
	
	public int insertShare(Share share);
	
	public List<Share> listShare(RowBounds row, ShareSearch sharesearch);
	
	public Share selectShare(int sh_no);
	
	public int updateShareHit(int sh_no);
	
	public int updateShare(Share share);
	
	public int countBoard(ShareSearch shareSearch);
	
	public int deleteShare(int sh_no);
	
	public Integer selectSr_no();
	
	public int insertReply(ShareReply sharereply);
	
	public List<ShareReply> listshareReply(int sh_no);
}
