package org.zerock.service;

import java.util.List;

import org.zerock.domain.AttachFileDTO;
import org.zerock.domain.Criteria;
import org.zerock.domain.ImgVO;
import org.zerock.domain.MovieVO;

public interface MovieService {
	
	// �׼ǿ�ȭ �� ���� �ҷ�����
	public List<MovieVO> getActionList();
	
	// ��Ÿ����ȭ �� ���� �ҷ�����
	public List<MovieVO> getFantasyList();
	
	// ������ȭ �� ���� �ҷ�����
	public List<MovieVO> getHorrorList();
	
	// �θེ��ȭ �� ���� �ҷ�����
	public List<MovieVO> getRomanceList();
	
	// �ڹ̵�ȭ �� ���� �ҷ�����
	public List<MovieVO> getComedyList();
	
	// �ֽſ�ȭ �� ���� �ҷ�����
	public List<MovieVO> getLatestList();
	
	// ��ȭ �� �� ����
	public MovieVO read(Long mov_num);
	
	// �˻�
	public List<MovieVO> getListWithPaging(Criteria cri);
	
	// �˻� ����¡
	public int getTotalCount(Criteria cri);

	// ��ȭ ���
	public int insert(MovieVO movieVO);

	// ��ȭ ����
	public int delete(Long mov_num);
	
	// ��ȭ ����
	public int modify(MovieVO movieVO);
	
	// ��ȭ ������ ��ȭ ���� �ҷ�����
	public AttachFileDTO readAttachFileDTO(Long mov_num);
	
	// ��ȭ ������ ��ȭ ������ �ҷ�����
	public ImgVO readImgThumb(Long mov_num);
	
}
