/**
 * 下午9:17:07TODO
 */
package com.znsd.tubaba.utils;

import java.util.regex.Pattern;

/**
 * @param  用于修改城市的时候判断返回的值是否为整数，如果是便返回True，否则返回false
 * 
 * @author 黄振伟
 * 
 * @Time   2018年11月9日21:25:57
 */
public class  IsInteger{

	 /*
	  * 判断是否为整数 
	  * @param str 传入的字符串 
	  * @return 是整数返回true,否则返回false 
	  */

	  public static boolean isInteger(String str) {  
	        Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");  
	        return pattern.matcher(str).matches();  
	  }
}
