package org.zerock.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.ActorVO;
import org.zerock.mapper.ActorMapper;
import org.zerock.service.ActorService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class ActorServiceImpl implements ActorService {
	
	private final ActorMapper actorMapper;

	@Transactional
	@Override
	public List<ActorVO> movieActorList(Long mov_num) {
		return actorMapper.movieActorList(mov_num);
	}

//	@Override
//	public List<ActorVO> getList() {
//		return actorMapper.getList();
//	}
//
//	@Override
//	public ActorVO read(Long act_num) {
//		return actorMapper.read(act_num);
//	}
//
//	@Override
//	public void insert(ActorVO actorVO) {
//		actorMapper.insert(actorVO);
//	}
//
//	@Override
//	public int delete(Long act_num) {
//		return actorMapper.delete(act_num);
//	}

}
