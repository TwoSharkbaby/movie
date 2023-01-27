package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ActorVO;
import org.zerock.domain.ImgVO;

public interface ActorMapper { 
	
	// 배우 수정시 정보가져오기
	public ActorVO read(Long act_num);

	// 배우 등록
	public int insert(ActorVO actorVO);
	
	// 배우 수정
	public int update(ActorVO actorVO);

	// 배우 삭제
	public int delete(Long act_num);
	
	// 영화 상세 배우 불러오기
	public List<ActorVO> movieActorList(Long mov_num);
	
	// 영화 삭제시 배우 삭제
	public int deleteActors(Long mov_num);
	
	// 배우 수정시 배우 사진 불러오기
	public String readAttachFileDTO(Long act_num);
	
	// 배우 삭제시 배우 사진명 불러오기
	public ImgVO readImgThumb(Long act_num);
	
	// 영화 삭제시 배우 사진명 불러오기
	public List<ImgVO> readActorImgs(Long mov_num);
	
}
