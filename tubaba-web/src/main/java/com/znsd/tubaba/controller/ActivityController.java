package com.znsd.tubaba.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.znsd.tubaba.entity.Activity;
import com.znsd.tubaba.entity.Activity_type;
import com.znsd.tubaba.service.ActivityService;
import com.znsd.tubaba.service.Activity_typeService;

@Controller
public class ActivityController {
	/**
	 * 活动的所有操作
	 */
	@Autowired
	ActivityService activityService;
	
	@Autowired
	Activity_typeService activityType;
	
		
		//查询活动并统计
		@RequestMapping("activity-list")
		public String getActivity(Map<String,Object> map) {
			List<Activity> activity = activityService.queryActivity();
			Date date = new Date();
			int count = activity.size();
			System.out.println(activity);
			for (Activity act : activity) {
				System.out.println(act.getTypeid());
			}
			map.put("date",date);
			map.put("activity",activity);
			map.put("count",count);
			return "admin/activity-list";
		}

		//跳转到添加活动页面
		@RequestMapping("activity-add")
		public String getAddActivity(Map<String,Object> map) {
			List<Activity_type> actType = activityType.queryType();
			map.put("actlist", actType);
			return "admin/activity-add";
		}
		
		//日期格式转换
		public Date updateDate(String date) {
			DateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			Date da = null;
			try {
				da = sdf.parse(date);
				return da;
			} catch (ParseException e) {
				e.printStackTrace();
			}
			return da;	
		}
		
		//新增活动
		@ResponseBody
		@RequestMapping(value="addActivity",method=RequestMethod.POST)
		public boolean addActivity(String activityWay,
				@RequestParam("typeid") int typeid,
				@RequestParam("commentdatemin") String starttime,
				@RequestParam("commentdatemax") String endtime) {
			
			Activity activity = new Activity();
			List<Activity_type> actType = activityType.queryType();
			for (Activity_type act : actType) {
				if(act.getId() == typeid) {
					activity.setTypeid(act);
				}
			}
			activity.setWay(activityWay);
			Date start = updateDate(starttime);
			Date end = updateDate(endtime);
			activity.setStarttime(start);
			activity.setEndtime(end);	
			int data = activityService.addActivity(activity);
			if (data > 0) {
				return true; 
			}					
			
			return false;
		}

		//根据id获取一条数据
		@RequestMapping("activity-edit")
		public String getAdminOne(@RequestParam("id") int id,Map<String,Object> map) {	
			List<Activity> act= activityService.queryActivity();
			List<Activity_type> actType = activityType.queryType();
			map.put("actType", actType);
			for (Activity activ : act) {
				if (activ.getId() == id) {
					Date date = activ.getStarttime();
					Date date1 = activ.getEndtime();
					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
					String start = formatter.format(date);
					String end = formatter.format(date1);
					map.put("act",activ);
					map.put("start", start);
					map.put("end", end);
				} 
			}
			return "admin/activity-edit";
		}
		
		//活动修改
		@ResponseBody
		@RequestMapping("editActivity")
		public boolean editActivity(int id,String activityWay,
				@RequestParam("typeid") int typeid,
				@RequestParam("commentdatemin") String starttime,
				@RequestParam("commentdatemax") String endtime) {			
			System.out.println(id+"===========");
			System.out.println(typeid+"===========");
			
			Activity activity = activityService.queryActivityOne(id);
			
			List<Activity_type> actType = activityType.queryType();
			for (Activity_type act : actType) {
				if(act.getId() == typeid) {
					activity.setWay(activityWay);
					Date start = updateDate(starttime);
					Date end = updateDate(endtime);
					activity.setStarttime(start);
					activity.setEndtime(end);	
					activity.setTypeid(act);
					activityService.updateActivity(activity);
				}
			}
			return true;				
		}
		
		@ResponseBody
		@RequestMapping("delActivity")
		public boolean delActivity(int id) {
			Activity activity = activityService.queryActivityOne(id);
			int data = activityService.delActivity(activity);
			if (data > 0) {
				return true;
			}
			
			return false;
		}
}
