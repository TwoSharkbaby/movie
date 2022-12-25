package org.zerock.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.MovieVO;
import org.zerock.mapper.MovieMapper;
import org.zerock.mapper.MovieScoreMapper;
import org.zerock.service.MovieService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class MovieServiceImpl implements MovieService {

	private final MovieMapper movieMapper;
	private final MovieScoreMapper movieScoreMapper;
 
	@Override  // 또는 현제날 - 개봉날 이런식으로 계산해서 평점 안보이게하기
	public List<MovieVO> getList() { // mybatis에서 null값 처리
		List<MovieVO> list = new ArrayList<MovieVO>();
		list = movieMapper.getList();
		list.forEach(lists -> {
			if (movieScoreMapper.score(lists.getMov_num()) == 0) {
				lists.setMov_sco_point(0);
			} else {
				lists.setMov_sco_point(movieScoreMapper.score(lists.getMov_num()));
			}
		});
		return list;
	}

	@Override
	public MovieVO read(Long mov_num) { // mybatis에서 null값 처리
		MovieVO movieVO = new MovieVO();
		movieVO = movieMapper.read(mov_num);
		movieVO.setMov_sco_point(movieScoreMapper.score(mov_num));
		return movieVO;
	}

	@Override
	public void insert(MovieVO movieVO) {
		movieMapper.insert(movieVO);
	}

	@Override
	public int delete(Long mov_num) {
		return movieMapper.delete(mov_num);
	}

}
