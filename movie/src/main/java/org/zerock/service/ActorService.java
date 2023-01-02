package org.zerock.service;

import java.util.List;

import org.zerock.domain.ActorVO;

public interface ActorService {

//	public List<ActorVO> getList();
	
	public ActorVO read(Long act_num);

	public int insert(ActorVO actorVO);
	
	public int modify(ActorVO actorVO);

	public int delete(Long act_num);	
	
//	public int getTotal(Criteria cri);
	
	public List<ActorVO> movieActorList(Long mov_num);
	
}
