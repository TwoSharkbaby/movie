package org.zerock.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.ActorVO;
import org.zerock.domain.AttachFileDTO;
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

	@Transactional
	@Override
	public ActorVO read(Long act_num) {
		return actorMapper.read(act_num);
	}

	@Transactional
	@Override
	public int insert(ActorVO actorVO) {
		String img = actorVO.getAct_img();
		String thumb = actorVO.getAct_thumb();
		img.replace("\\", "/");
		actorVO.setAct_img(img);
		thumb.replace("\\", "/");
		actorVO.setAct_thumb(thumb);
		return actorMapper.insert(actorVO);
	}

	@Transactional
	@Override
	public int modify(ActorVO actorVO) {
		return actorMapper.update(actorVO);
	}

	@Transactional
	@Override
	public int delete(Long act_num) {
		return actorMapper.delete(act_num);
	}
	
//	@Transactional
//	@Override
//	public AttachFileDTO readAttachFileDTO(Long mov_num) {
//		String thumb = movieMapper.readAttachFileDTO(mov_num);
//		thumb.replace("/", "\\");
//		String path = thumb.substring(0, 10);
//		String uuName = thumb.substring(thumb.lastIndexOf("s_")+2);
//		String name = uuName.substring(uuName.lastIndexOf("_")+1);
//		String uu = uuName.replace("_"+name, "");
//		AttachFileDTO dto = AttachFileDTO.builder().fileName(name).uploadPath(path).uuid(uu).image(false).build();
//		return dto;
//	}

}
