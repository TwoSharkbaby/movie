package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ActorVO;

public interface ActorMapper { 

	public List<ActorVO> getList();
	
	public ActorVO read(Long act_num);

	public void insert(ActorVO actorVO);

	public int delete(Long act_num);
	
}
