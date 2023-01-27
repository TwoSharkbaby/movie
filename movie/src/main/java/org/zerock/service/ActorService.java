package org.zerock.service;

import java.util.List;

import org.zerock.domain.ActorVO;
import org.zerock.domain.AttachFileDTO;
import org.zerock.domain.ImgVO;

public interface ActorService {
	
	// ��� ���� �ҷ�����
	public List<ActorVO> movieActorList(Long mov_num);
	
	// ��� ���� �ҷ�����
	public ActorVO read(Long act_num);

	// ��� ���
	public int insert(ActorVO actorVO);
	
	// ��� ����
	public int modify(ActorVO actorVO);

	// ��� ����
	public int delete(Long act_num);	
	
	// ��� ������ ��� ���� �ҷ�����
	public AttachFileDTO readAttachFileDTO(Long act_num);
	
	// ��� ���� ������ ��������
	public ImgVO readImgThumb(Long act_num);
	
	// ��� ���� ������ ��������
	public List<ImgVO> readActorImgs(Long mov_num);
	
}
