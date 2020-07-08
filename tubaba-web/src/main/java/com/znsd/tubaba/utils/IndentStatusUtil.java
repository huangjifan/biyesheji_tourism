package com.znsd.tubaba.utils;

import java.util.Date;
import java.util.List;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;

import com.znsd.tubaba.entity.Indent;
import com.znsd.tubaba.service.IndentService;

@Configurable
public class IndentStatusUtil implements Job{
	
	private ApplicationContext applicationContext=SpringUtils.getApplicationContext();
	private IndentService indentService=applicationContext.getBean(IndentService.class);
	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		List<Indent> result=indentService.findByAll();
		Date now=new Date();
		for (Indent indent : result) {
			if (indent.getIndentstatus()==0) {
				if (now.getTime()>indent.getIndentdetails().getEndtime().getTime()) {
					indentService.editStatus(5, indent.getId());
					System.out.println("状态改为5----------------");
				}
			}
			if (indent.getIndentstatus()==1) {
				if (now.getTime()>indent.getIndentdetails().getStarttime().getTime()) {
					indentService.editStatus(2, indent.getId());
					System.out.println("状态改为2----------------");
				}
			}
		}
	}
	@Bean
	public IndentStatusUtil getIndentStatusUtil() {
		return new IndentStatusUtil();
	}
}
