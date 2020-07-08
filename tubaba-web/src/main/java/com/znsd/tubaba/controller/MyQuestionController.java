package com.znsd.tubaba.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.znsd.tubaba.service.MyQuestionService;

@Controller
public class MyQuestionController {
	@Autowired
	MyQuestionService myQuestionService;
	
	@RequestMapping("question")
	public String question() {
		return "view/user/question";
	}
}
