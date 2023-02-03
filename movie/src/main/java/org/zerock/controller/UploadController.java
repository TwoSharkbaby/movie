package org.zerock.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class UploadController {

	// 서버 사진 삭제
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		File file;
		try {
			file = new File("C:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			if (type.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				file = new File(largeFileName);
				file.delete();
			}
		} catch (Exception e) {
		}
		return new ResponseEntity<>("delete", HttpStatus.OK);
	}

	// 서버 사진 저장
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<AttachFileDTO> uploadAjaxAction(MultipartFile[] uploadFile) {
		String uploadFolderPath = getFolder();
		File uploadPath = new File("c:\\upload", uploadFolderPath);
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		AttachFileDTO attachFileDTO = new AttachFileDTO();
		for (MultipartFile multipartFile : uploadFile) {
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			attachFileDTO.setFileName(uploadFileName);
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			try {
				attachFileDTO.setUuid(uuid.toString());
				attachFileDTO.setUploadPath(uploadFolderPath);
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				attachFileDTO.setImg_path(uploadFileName);
				if (checkImageType(saveFile)) {
					attachFileDTO.setImage(true);
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 245, 350);
					thumbnail.close();
				}
			} catch (Exception e) {
			}
		}
		return new ResponseEntity<>(attachFileDTO, HttpStatus.OK);
	}

	// 사진 등록 및 수정 썸네일사진
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
		File file = new File("c:\\upload\\" + fileName);
		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 폴더 생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}

	// 타입 체크
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (Exception e) {
		}
		return false;
	}

}
