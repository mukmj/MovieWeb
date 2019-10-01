package com.movie.project;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadImg {
	public String fileUpload(MultipartFile file, String path) {
		String allPath="";
		try {
			if(!file.isEmpty()) {
				String originalFileName = file.getOriginalFilename();
				String ext = originalFileName.substring(originalFileName.lastIndexOf("."), originalFileName.length());
				String fileName = UUID.randomUUID().toString();
				allPath = fileName + ext;
				
				byte data[] = file.getBytes();
				
				File f = new File(path);
				if(!f.isDirectory()) {
					f.mkdirs();
				}
				
				OutputStream os = new FileOutputStream(new File(path + fileName + ext));
				os.write(data);
				os.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return allPath;
	}
}
