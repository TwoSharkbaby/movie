package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.ImgVO;
import org.zerock.domain.MovieVO;

public interface MovieMapper {

	// 액션영화 불러오기
	public List<MovieVO> getActionList();
	
	// 판타지영화 불러오기
	public List<MovieVO> getFantasyList();
	
	// 호러영화 불러오기
	public List<MovieVO> getHorrorList();
	
	// 로멘스영화 불러오기
	public List<MovieVO> getRomanceList();
	
	// 코미디영화 불러오기
	public List<MovieVO> getComedyList();
	
	// 최신영화 불러오기
	public List<MovieVO> getLatestList();

	// 영화 수정시 기존자료 불러오기
	public MovieVO read(Long mov_num);

	// 영화 등록
	public int insert(MovieVO movieVO);

	// 영화 수정
	public int update(MovieVO movieVO);
	
	// 영화 삭제
	public int delete(Long mov_num);
	
	// 검색 페이징
	public int getTotalCount(Criteria cri);
	
	// 영화(제목/장르/감독) 검색
	public List<MovieVO> getListWithPaging(Criteria cri);
	
	// 영화(배우) 검색
	public List<MovieVO> getActorListWithPaging(Criteria cri);
	
	// 영화 수정시 영화 사진 불러오기
	public String readAttachFileDTO(Long mov_num);
	
	// 영화 삭제시 영화 사진명 불러오기
	public ImgVO readImgThumb(Long mov_num);

}
