package org.zerock.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.ActorVO;
import org.zerock.domain.AttachFileDTO;
import org.zerock.domain.ImgVO;
import org.zerock.mapper.ActorMapper;
import org.zerock.service.ActorService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ActorServiceImpl implements ActorService {
	
	private final ActorMapper actorMapper;

	// 배우 정보 불러오기
	@Transactional
	@Override
	public List<ActorVO> movieActorList(Long mov_num) {
		return actorMapper.movieActorList(mov_num);
	}

	// 배우 정보 불러오기
	@Transactional
	@Override
	public ActorVO read(Long act_num) {
		return actorMapper.read(act_num);
	}

	// 배우 등록  + 사진명을 불러오기 편한 방식으로 저장
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

	// 배우 수정
	@Transactional
	@Override
	public int modify(ActorVO actorVO) {
		return actorMapper.update(actorVO);
	}

	// 배우 삭제
	@Transactional
	@Override
	public int delete(Long act_num) {
		return actorMapper.delete(act_num);
	}
	
	// 배우 수정시 배우 사진 불러오기 + 서버 불러오는 방식으로 변경
	@Transactional
	@Override
	public AttachFileDTO readAttachFileDTO(Long act_num) {
		String thumb = actorMapper.readAttachFileDTO(act_num);
		thumb.replace("/", "\\");
		String path = thumb.substring(0, 10);
		String uuName = thumb.substring(thumb.lastIndexOf("s_")+2);
		String name = uuName.substring(uuName.lastIndexOf("_")+1);
		String uu = uuName.replace("_"+name, "");
		AttachFileDTO dto = AttachFileDTO.builder().fileName(name).uploadPath(path).uuid(uu).image(false).build();
		return dto;
	}

	// 배우 삭제시 DB에서 받은 배우 사진 데이터 서버 위치로 변경
	@Transactional
	@Override
	public ImgVO readImgThumb(Long act_num) {
		ImgVO vo = actorMapper.readImgThumb(act_num);
		String img = "C:\\upload\\" + vo.getImg().replace("\\", "/");
		vo.setImg(img);
		String thumb = "C:\\upload\\" + vo.getThumb().replace("\\", "/");
		vo.setThumb(thumb);
		return vo;
	}

	
	// 영화 삭제시 DB에서 받은 배우 사진 데이터 서버 위치로 변경
	@Transactional
	@Override
	public List<ImgVO> readActorImgs(Long mov_num) {
		List<ImgVO> list = actorMapper.readActorImgs(mov_num);
		list.forEach(vo -> {
			String img = "C:\\upload\\" + vo.getImg().replace("\\", "/");
			vo.setImg(img);
			String thumb = "C:\\upload\\" + vo.getThumb().replace("\\", "/");
			vo.setThumb(thumb);
		});
		return list;
	}

}
