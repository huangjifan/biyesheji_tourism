package com.znsd.tubaba.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.znsd.tubaba.entity.Indent;
import com.znsd.tubaba.entity.Indentdetails;
import com.znsd.tubaba.entity.Userrecord;
import com.znsd.tubaba.service.CollectService;
import com.znsd.tubaba.service.IndentService;
import com.znsd.tubaba.service.IndentdetailsService;
import com.znsd.tubaba.service.UserService;
import com.znsd.tubaba.service.UserrecordService;

/**
 * 
 * @author 石杰
 * 
 * 
 *
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class UserTest {
	@Autowired
	CollectService collectService;
	
	@Autowired
	UserService userSerivce;
	
	@Autowired
	IndentdetailsService indentdetailsService;
	
	@Autowired
	IndentService indentService;
	
	@Autowired
	UserrecordService userrecordService;
	
	@Test
	public void test1() {
		Indentdetails indentdetails = indentdetailsService.findById(1);
		System.out.println(indentdetails);
	}
	
	@Test
	public void test2() {
		Indent indent = indentService.findByIndentId(1);
		System.out.println("indent:"+indent.getPlayMan());
	}
	
	@Test
	public void test3() {
		String val = "";  
        Random random = new Random();  
          
        //参数length，表示生成几位随机数  
        for(int i = 0; i < 10; i++) {  
              
            String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num";  
            //输出字母还是数字  
            if( "char".equalsIgnoreCase(charOrNum) ) {  
                //输出是大写字母还是小写字母  
                int temp = random.nextInt(2) % 2 == 0 ? 65 : 97;  
                val += (char)(random.nextInt(26) + temp);  
            } else if( "num".equalsIgnoreCase(charOrNum) ) {  
                val += String.valueOf(random.nextInt(10));  
            }  
        }  
        System.out.println(val);
	}
	@Test
	public void aaa() throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MMM-dd");
        Date date=sdf.parse("2019-5-8");
        System.out.println(date);
	}
	
	@Test
	public void addUserIntegral() {
		userSerivce.addUserIntegral(1, 555);
	}
	
	
}
