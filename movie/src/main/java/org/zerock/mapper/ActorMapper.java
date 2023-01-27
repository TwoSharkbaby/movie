package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ActorVO;
import org.zerock.domain.ImgVO;

public interface ActorMapper { 
	
	// ��� ������ ������������
	public ActorVO read(Long act_num);

	// ��� ���
	public int insert(ActorVO actorVO);
	
	// ��� ����
	public int update(ActorVO actorVO);

	// ��� ����
	public int delete(Long act_num);
	
	// ��ȭ �� ��� �ҷ�����
	public List<ActorVO> movieActorList(Long mov_num);
	
	// ��ȭ ������ ��� ����
	public int deleteActors(Long mov_num);
	
	// ��� ������ ��� ���� �ҷ�����
	public String readAttachFileDTO(Long act_num);
	
	// ��� ������ ��� ������ �ҷ�����
	public ImgVO readImgThumb(Long act_num);
	
	// ��ȭ ������ ��� ������ �ҷ�����
	public List<ImgVO> readActorImgs(Long mov_num);
	
}
