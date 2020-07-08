package com.znsd.tubaba.utils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author Administrator
 *
 */
public class FileUtil {
	//文件上传工具类服务方法
    public static List<String> uploadFile(MultipartFile[] file,
    		HttpServletRequest request) throws Exception{
    	List<String> fileNames = new ArrayList<>();
    	for (int i = 0; i < file.length; i++) {
			MultipartFile multipartFile = file[i];
			// 判断是否提交文件，如果没有那么跳过上传
			if (multipartFile.isEmpty()) {
				continue;
			}
			// 获取文件的上传路径
			String uploadpath = request.getServletContext().getRealPath("imgupload");
			// 获取文件名称
			String filename = multipartFile.getOriginalFilename();
			// 截取文件后缀
			String fileext = filename.substring(filename.lastIndexOf("."));
			// 生成新的随机文件名称
			String newfileName = UUID.randomUUID() + fileext;
			// 文件保存路径
			File savepath = new File(uploadpath + "/" + newfileName);
			// 上传文件
			try {
				multipartFile.transferTo(savepath);
				fileNames.add("imgupload"+"/" + newfileName);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
    	return fileNames;
    }
    
  //文件上传工具类服务方法
    public static String uploadFileOne(MultipartFile[] file,
    		HttpServletRequest request) throws Exception{
    	List<String> fileNames = new ArrayList<>();
    	for (int i = 0; i < file.length; i++) {
			MultipartFile multipartFile = file[i];
			// 判断是否提交文件，如果没有那么跳过上传
			if (multipartFile.isEmpty()) {
				continue;
			}
			// 获取文件的上传路径
			String uploadpath = request.getServletContext().getRealPath("imgupload");
			// 获取文件名称
			String filename = multipartFile.getOriginalFilename();
			// 截取文件后缀
			String fileext = filename.substring(filename.lastIndexOf("."));
			// 生成新的随机文件名称
			String newfileName = UUID.randomUUID() + fileext;
			// 文件保存路径
			File savepath = new File(uploadpath + "/" + newfileName);
			// 上传文件
			try {
				multipartFile.transferTo(savepath);
				fileNames.add("imgupload"+"/" + newfileName);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
    	
    	return fileNames.get(0);
    }
}
