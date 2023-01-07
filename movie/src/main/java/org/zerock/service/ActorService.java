package org.zerock.service;

import java.util.List;

import org.zerock.domain.ActorVO;
import org.zerock.domain.AttachFileDTO;
import org.zerock.domain.ImgVO;

public interface ActorService {
	
	// 배우 정보 불러오기
	public List<ActorVO> movieActorList(Long mov_num);
	
	// 배우 정보 불러오기
	public ActorVO read(Long act_num);

	// 배우 등록
	public int insert(ActorVO actorVO);
	
	// 배우 수정
	public int modify(ActorVO actorVO);

	// 배우 삭제
	public int delete(Long act_num);	
	
	// 배우 수정시 배우 사진 불러오기
	public AttachFileDTO readAttachFileDTO(Long act_num);
	
	// 배우 사진 데이터 가져오기
	public ImgVO readImgThumb(Long act_num);
	
	// 배우 사진 데이터 가져오기
	public List<ImgVO> readActorImgs(Long mov_num);
	
}
