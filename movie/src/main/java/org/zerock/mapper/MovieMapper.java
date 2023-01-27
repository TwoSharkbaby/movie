package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.ImgVO;
import org.zerock.domain.MovieVO;

public interface MovieMapper {

	// �׼ǿ�ȭ �ҷ�����
	public List<MovieVO> getActionList();
	
	// ��Ÿ����ȭ �ҷ�����
	public List<MovieVO> getFantasyList();
	
	// ȣ����ȭ �ҷ�����
	public List<MovieVO> getHorrorList();
	
	// �θེ��ȭ �ҷ�����
	public List<MovieVO> getRomanceList();
	
	// �ڹ̵�ȭ �ҷ�����
	public List<MovieVO> getComedyList();
	
	// �ֽſ�ȭ �ҷ�����
	public List<MovieVO> getLatestList();

	// ��ȭ ������ �����ڷ� �ҷ�����
	public MovieVO read(Long mov_num);

	// ��ȭ ���
	public int insert(MovieVO movieVO);

	// ��ȭ ����
	public int update(MovieVO movieVO);
	
	// ��ȭ ����
	public int delete(Long mov_num);
	
	// �˻� ����¡
	public int getTotalCount(Criteria cri);
	
	// ��ȭ(����/�帣/����) �˻�
	public List<MovieVO> getListWithPaging(Criteria cri);
	
	// ��ȭ(���) �˻�
	public List<MovieVO> getActorListWithPaging(Criteria cri);
	
	// ��ȭ ������ ��ȭ ���� �ҷ�����
	public String readAttachFileDTO(Long mov_num);
	
	// ��ȭ ������ ��ȭ ������ �ҷ�����
	public ImgVO readImgThumb(Long mov_num);

}
