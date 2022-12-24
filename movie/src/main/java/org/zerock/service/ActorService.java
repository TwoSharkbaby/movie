package org.zerock.service;

import java.util.List;

import org.zerock.domain.ActorVO;
import org.zerock.domain.Criteria;

public interface ActorService {

	public List<ActorVO> getList (Criteria cri);
	
	
	public ActorVO get(Long act_idn);
	
	
	public void register(ActorVO vo);
	
	public boolean remove(Long act_idn);
	
	public boolean modify(ActorVO vo);
	
	public int getTotal(Criteria cri);
	
	
}
