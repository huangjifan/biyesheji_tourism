package com.znsd.tubaba.utils;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
public class UploadAction{
	
	
	public String fileupload(String name,MultipartFile file,HttpServletRequest request) {
		String newName=UUID.randomUUID()+name.substring(name.lastIndexOf("."));
		 try {
			 if (file!=null) {
				   String path=null;// 文件路径
				   String type=null;
				   String fileName=newName;
				   type=fileName.indexOf(".")!=-1?fileName.substring(fileName.lastIndexOf(".")+1, fileName.length()):null;
				   if(type!=null) {
					   String realPath=request.getSession().getServletContext().getRealPath("/");
					   System.out.println(realPath);
					   path=realPath+"upload/";
					   file.transferTo(new File(path,newName));
					   System.out.println("文件成功上传到指定目录下");
				   }
			 }
	    //保存新文件
	     } catch (Exception e) {
	    	 e.printStackTrace();
	     }
		 return newName;
	}
}
