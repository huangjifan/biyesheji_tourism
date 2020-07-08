/**
 * 下午7:19:53TODO
 */
package com.znsd.tubaba.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.znsd.tubaba.utils.FileUtil;


/**
 * @author Administrator
 *
 */
@Controller
public class FileUploadController {
   
    @ResponseBody
    @RequestMapping(value = "uploadFile")
    public List<String> uploadImage(@RequestParam("file") MultipartFile[] file,
    		HttpServletRequest request) throws Exception {
    	List<String> fileNames = FileUtil.uploadFile(file, request);
		return fileNames;
    }
    
   
}
