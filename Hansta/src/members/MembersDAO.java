package members;

import java.util.HashMap;

import spring.project.db.MembersVO;





public interface MembersDAO {
	void insertMember(MembersVO VO);
	String overlapTest(String id);	//id중복체크
	String getId();
	String loginIdentify(HashMap<String, String> hstParam);
	void updateMember(MembersVO VO);
	MembersVO getMemberInfo(String id);
	String passwordCnt(MembersVO memVO);
	String getPassword(String member_id);

} 

