package org.zerock.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.MovieVO;
import org.zerock.mapper.ActorMapper;
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
 
	@Override  
	public List<MovieVO> getList() { 
		List<MovieVO> list = new ArrayList<MovieVO>();
		list = movieMapper.getList();
		
		list.forEach(lists -> {
			log.info(movieScoreMapper.score(lists.getMov_num()));
			if (movieScoreMapper.score(lists.getMov_num()) == null) {
				lists.setMov_sco_point(0.0);
			} else {
				lists.setMov_sco_point(movieScoreMapper.score(lists.getMov_num()));
			}
		});
		return list;
	}

	@Override
	public MovieVO read(Long mov_num) { 
		MovieVO movieVO = new MovieVO();
		movieVO = movieMapper.read(mov_num);
		movieVO.setMov_sco_point(movieScoreMapper.score(mov_num));
		if(movieVO.getMov_sco_point() == null) {
			movieVO.setMov_sco_point(0.0);
		}
		return movieVO;
	}

//	@Override
//	public void insert(MovieVO movieVO) {
//		movieMapper.insert(movieVO);
//	}
//
//	@Override
//	public int delete(Long mov_num) {
//		return movieMapper.delete(mov_num);
//	}

}
