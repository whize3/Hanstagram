package com.hb.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.StudyroomDAO;
import com.hb.mybatis.StudyroomVO;
import com.hb.mybatis.Studyroom_ReserveVO;

public class SRCommand2 implements Command{
	

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String date = request.getParameter("date");
		String s_num = request.getParameter("r_num");
		StudyroomDAO sdao = new StudyroomDAO();
		List<Studyroom_ReserveVO> list = null;
		Map<Object, Object> map = new HashMap<>();
		map.put("s_num", s_num);
		map.put("date", date);
		list = sdao.getTime(map);
		String result="[";
		for(Studyroom_ReserveVO k : list){
			result +="{";
			result +="\"sr_idx\""+":"+"\""+k.getSr_idx()+"\",";
			result +="\"s_num\""+":"+"\""+k.getS_num()+"\",";
			result +="\"start_time\""+":"+"\""+k.getStart_time()+"\",";
			result +="\"end_time\""+":"+"\""+k.getEnd_time()+"\",";
			result +="\"id\""+":"+"\""+k.getId()+"\",";
			result +="\"sr_state\""+":"+"\""+k.getSr_state()+"\",";
			result +="\"sr_date\""+":"+"\""+k.getSr_date()+"\"";
			result +="},";
		}
		if(list.size()>0){
		result = result.substring(0,result.length()-1);
		}
		result +="]";
		return result;
	}
}
