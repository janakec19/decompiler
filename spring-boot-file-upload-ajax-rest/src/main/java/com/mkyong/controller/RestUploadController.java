package com.mkyong.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class RestUploadController {

	private final Logger logger = LoggerFactory.getLogger(RestUploadController.class);

	public File multipartToFile(MultipartFile file) {
		File convFile = new File(file.getOriginalFilename());
		try {
			convFile.createNewFile();

			FileOutputStream fos = new FileOutputStream(convFile);
			fos.write(file.getBytes());
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return convFile;
	}

	// Multiple file upload
	@PostMapping("/api/upload/multi")
	public ResponseEntity<?> uploadFileMulti(@RequestParam("files") MultipartFile mfile) {

		logger.debug("Multiple file upload!");
		StringWriter writerstr = new StringWriter();
		try {

			File f = multipartToFile(mfile);

			final PrintWriter writer = new PrintWriter(writerstr);

			try {
				com.strobel.decompiler.Decompiler.decompile(f.getAbsolutePath(),
						new com.strobel.decompiler.PlainTextOutput(writer));
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				f.delete();
				writer.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ResponseEntity(writerstr.toString(), HttpStatus.OK);

	}

}
