package com.decompiler.rest.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
	}

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

	@RequestMapping(value = "/api/upload/multi", method = RequestMethod.POST)
	public @ResponseBody String uploadFileMulti(@RequestParam("files") MultipartFile mfile) {
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

		return writerstr.toString();

	}

}
