/**
 * 上午10:17:25TODO
 */
package com.znsd.tubaba.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.znsd.tubaba.utils.FileUtil;

/**
 * @author Administrator
 *
 */
@Controller
public class UploadController {

	
	/*
     * 上传多个文件,后台代码主要是接收参数，其他的业务代码根据你们具体的业务需求来定
     */
	@ResponseBody
    @RequestMapping(value = "/uploadBatch", method = RequestMethod.POST)
    public List<String> uploadBatch(HttpServletRequest request,
    		@RequestParam("file") MultipartFile[] files,String businesscode,
    		String businessobjectid,String handletype,Long version) throws Exception {
    	System.out.println("上传成功");
		List<String> uploadFile = FileUtil.uploadFile(files, request);
		for (String fileName : uploadFile) {
			System.out.println(fileName);
		}
		return uploadFile;
    }

}
