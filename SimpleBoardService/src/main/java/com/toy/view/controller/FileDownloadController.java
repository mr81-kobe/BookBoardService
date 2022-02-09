package com.toy.view.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FileDownloadController {

	public FileDownloadController() {
		// TODO Auto-generated constructor stub
	}

	
	
	
	@RequestMapping(value="download.do")
	public void downloadFile(HttpServletRequest request, HttpServletResponse response){
		
		String filename =request.getParameter("fileName"); 
		String dir=""; 
		
		
		try{
			String browser =request.getHeader("User-Agent"); 
			if(browser.contains("MSIE")||browser.contains("Trident")||browser.contains("Chrome")){
				filename=URLEncoder.encode(filename,"UTF-8");
			}else{
				filename = new String(filename.getBytes("UTF-8"),"ISO-8859-1");
			}
			
			
		}catch (UnsupportedEncodingException e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		dir="C:\\work\\SimpleBoardService\\src\\FIleUpload\\"+filename; 
		System.out.println(dir);
		File file = new File(dir); 
		if(!file.exists()){
			return ;
		}
		
		response.setContentType("application/other-stream"); 
		response.setHeader("Content-Transfer-Encoding","binary");
		
		response.setHeader("Content-Disposition", "attachment; filename=\""+filename+"\"");
		
		try{
			OutputStream out = response.getOutputStream(); 
			FileInputStream  fis = new FileInputStream(dir);
			int ncount = 0; 
			byte[] bytes = new byte[512]; 
			while((ncount=fis.read(bytes))!= -1){
				out.write(bytes,0,ncount);
			}
			fis.close();
			out.close();
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
	
	
	
}
