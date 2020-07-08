package com.znsd.tubaba.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;

import com.znsd.tubaba.entity.User;
import com.znsd.tubaba.service.UserService;

@Configurable
public class GiveCoupons implements Job{
	public GiveCoupons() {}
	private ApplicationContext applicationContext=SpringUtils.getApplicationContext();
	private UserService userService=applicationContext.getBean(com.znsd.tubaba.service.UserService.class);
	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		List<Object> list=new ArrayList<>();
		List<User> user=userService.allUserId();
		for (User i : user) {
			list.add(i.getId());
		}
		String ends=nextMonth();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date end=sdf.parse(ends);
			//list.add(end);
			userService.giveCoupon(list,end);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Bean
	public GiveCoupons getGiveCoupons() {
		return new GiveCoupons();
	}
	public String nextMonth(){  
		Date date = new Date();  
		int year=Integer.parseInt(new SimpleDateFormat("yyyy").format(date));//取到年份值  
		int month=Integer.parseInt(new SimpleDateFormat("MM").format(date))+1;//取到鱼粉值  
		int day=Integer.parseInt(new SimpleDateFormat("dd").format(date));//取到天值  
		if(month==0){  
		    year-=1;month=12;  
		}  
		else if(day>28){  
		    if(month==2){  
		        if(year%400==0||(year %4==0&&year%100!=0)){  
		            day=29;  
		        }else day=28;  
		    }else if((month==4||month==6||month==9||month==11)&&day==31)  
		    {  
		        day=30;  
		    }  
		}  
		String y = year+"";String m ="";String d ="";  
		if(month<10) m = "0"+month;  
		else m=month+"";  
		if(day<10) d = "0"+day;  
		else d = day+"";  
		System.out.println(y+"-"+m+"-"+d);  
		return y+"-"+m+"-"+d; 
	}
}
