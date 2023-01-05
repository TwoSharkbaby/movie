package org.zerock.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.AttachFileDTO;
import org.zerock.domain.Criteria;
import org.zerock.domain.ImgVO;
import org.zerock.domain.MovieVO;
import org.zerock.mapper.ActorMapper;
import org.zerock.mapper.MovieMapper;
import org.zerock.mapper.MovieReviewChoiceMapper;
import org.zerock.mapper.MovieReviewCommentChoiceMapper;
import org.zerock.mapper.MovieReviewCommentMapper;
import org.zerock.mapper.MovieReviewMapper;
import org.zerock.mapper.MovieScoreMapper;
import org.zerock.service.MovieService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class MovieServiceImpl implements MovieService {

	private final MovieMapper movieMapper;
	private final ActorMapper actorMapper;
	private final MovieScoreMapper movieScoreMapper;
	private final MovieReviewMapper movieReviewMapper;
	private final MovieReviewChoiceMapper movieReviewChoiceMapper;
	private final MovieReviewCommentMapper movieReviewCommentMapper;
	private final MovieReviewCommentChoiceMapper movieReviewCommentChoiceMapper;

	@Transactional
	@Override
	public List<MovieVO> getList() {
		return listScore(movieMapper.getList());
	}

	@Transactional
	@Override
	public List<MovieVO> getActionList() {
		return listScore(movieMapper.getActionList());
	}

	@Transactional
	@Override
	public List<MovieVO> getFantasyList() {
		return listScore(movieMapper.getFantasyList());
	}

	@Transactional
	@Override
	public List<MovieVO> getHorrorList() {
		return listScore(movieMapper.getHorrorList());
	}

	@Transactional
	@Override
	public List<MovieVO> getRomanceList() {
		return listScore(movieMapper.getRomanceList());
	}

	@Transactional
	@Override
	public List<MovieVO> getComedyList() {
		return listScore(movieMapper.getComedyList());
	}

	@Transactional
	@Override
	public List<MovieVO> getLatestList() {
		return listScore(movieMapper.getLatestList());
	}

	public List<MovieVO> listScore(List<MovieVO> list) {
		list.forEach(lists -> {
			if (movieScoreMapper.score(lists.getMov_num()) == null) {
				lists.setMov_sco_point(0.0);
			} else {
				lists.setMov_sco_point(movieScoreMapper.score(lists.getMov_num()));
			}
		});
		return list;
	}

	@Transactional
	@Override
	public MovieVO read(Long mov_num) {
		MovieVO movieVO = new MovieVO();
		movieVO = movieMapper.read(mov_num);
		movieVO.setMov_sco_point(movieScoreMapper.score(mov_num));
		if (movieVO.getMov_sco_point() == null) {
			movieVO.setMov_sco_point(0.0);
		}
		return movieVO;
	}

	@Transactional
	@Override
	public List<MovieVO> getListWithPaging(Criteria cri) {
		if (cri.getType().equals("A")) {
			return movieMapper.getActorListWithPaging(cri);
		} else {
			return movieMapper.getListWithPaging(cri);
		}
	}

	@Transactional
	@Override
	public int getTotalCount(Criteria cri) {
		return movieMapper.getTotalCount(cri);
	}

	@Transactional
	@Override
	public int modify(MovieVO movieVO) {
		return movieMapper.update(movieVO);
	}

	@Transactional
	@Override
	public int insert(MovieVO movieVO) {
		String img = movieVO.getMov_img();
		String thumb = movieVO.getMov_thumb();
		img.replace("\\", "/");
		movieVO.setMov_img(img);
		thumb.replace("\\", "/");
		movieVO.setMov_thumb(thumb);
		return movieMapper.insert(movieVO);
	}

	@Transactional
	@Override
	public int delete(Long mov_num) {
		movieReviewMapper.findByReview(mov_num).forEach(reviewNum -> {
			movieReviewCommentMapper.findByReviewComment(reviewNum).forEach(commentNum -> {
				movieReviewCommentChoiceMapper.deleteReviewCommentChoices(commentNum);
				movieReviewCommentMapper.deleteReviewComments(commentNum);
			});
			movieReviewChoiceMapper.deleteReviewChoices(reviewNum);
			movieScoreMapper.deleteScores(reviewNum);
		});
		movieReviewMapper.deleteReviews(mov_num);
		actorMapper.deleteActors(mov_num);
		return movieMapper.delete(mov_num);
	}

	@Transactional
	@Override
	public AttachFileDTO readAttachFileDTO(Long mov_num) {
		String thumb = movieMapper.readAttachFileDTO(mov_num);
		thumb.replace("/", "\\");
		String path = thumb.substring(0, 10);
		String uuName = thumb.substring(thumb.lastIndexOf("s_")+2);
		String name = uuName.substring(uuName.lastIndexOf("_")+1);
		String uu = uuName.replace("_"+name, "");
		AttachFileDTO dto = AttachFileDTO.builder().fileName(name).uploadPath(path).uuid(uu).image(false).build();
		return dto;
	}

	@Transactional
	@Override
	public ImgVO readImgThumb(Long mov_num) {
		ImgVO vo = movieMapper.readImgThumb(mov_num);
		String img = "C:\\upload\\" + vo.getImg().replace("\\", "/");
		vo.setImg(img);
		String thumb = "C:\\upload\\" + vo.getThumb().replace("\\", "/");
		vo.setThumb(thumb);
		return vo;
	}

}
