package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ActorVO;
import org.zerock.domain.ImgVO;

public interface ActorMapper { 

//	public List<ActorVO> getList();
	
	public ActorVO read(Long act_num);

	public int insert(ActorVO actorVO);
	
	public int update(ActorVO actorVO);

	public int delete(Long act_num);
	
	public List<ActorVO> movieActorList(Long mov_num);
	
	public int deleteActors(Long mov_num);
	
	public String readAttachFileDTO(Long act_num);
	
	public ImgVO readImgThumb(Long act_num);
	
	public List<ImgVO> readActorImgs(Long mov_num);
	
}
