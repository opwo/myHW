package com.wt.tool;

public class StringSplit {
	public static String splitStr(String str,int strLength){
		if(str!=null&&!str.equals("")){
			if(str.length()/2>=strLength-3){
				str=str.substring(0, strLength-2)+"...";
				return str;
			}else{
				return str;
			}
		}
		return "没有信息";
	}
}
