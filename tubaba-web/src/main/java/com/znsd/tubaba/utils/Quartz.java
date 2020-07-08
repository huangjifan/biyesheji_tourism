package com.znsd.tubaba.utils;

import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

public class Quartz {
	public void quartz() throws SchedulerException {
		//创建一个任务
		JobDetail job1=JobBuilder.newJob(GiveCoupons.class).withIdentity("job1", "group1").build();
		//JobDetail job2=JobBuilder.newJob(GiveCoupons.class).withIdentity("job2", "group2").build();
		// 创建一个触发器，每个月执行一次，无限执行
		//每个月的最后一天的10点15分触发一次 
		String cronString1 = "0 15 10 L * ?";
		//每秒执行一次
		String cronString2= "0/2 * * ? * *";
		//每天半夜12点30分执行一次
		String cronString3="0 30 0 * * ?";
		Trigger trigger1 = TriggerBuilder.newTrigger()
						  .withIdentity("trigger1", "group1")
						  .withSchedule(CronScheduleBuilder.cronSchedule(cronString1))
						  .build();
		/*Trigger trigger2 = TriggerBuilder.newTrigger()
				  .withIdentity("trigger2", "group2")
				  .withSchedule(CronScheduleBuilder.cronSchedule(cronString3))
				  .build();*/
		// 创建一个调度器
		 Scheduler scheduler = new StdSchedulerFactory().getScheduler();
		//Scheduler scheduler2 = new StdSchedulerFactory().getScheduler();
		scheduler.scheduleJob(job1, trigger1);
		//scheduler2.scheduleJob(job2, trigger2);
		scheduler.start();
		// 停止调度器
		// scheduler.shutdown();
	}
}
