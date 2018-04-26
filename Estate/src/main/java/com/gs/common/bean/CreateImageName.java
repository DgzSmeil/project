package com.gs.common.bean;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class CreateImageName {
	public static String createImageName() {
		// 根据时间生成文件名
		SimpleDateFormat sdf = new SimpleDateFormat("ddHHmmssS");
		String fileName = sdf.format(new Date());

		// 加上随机数，防止重复
		Random rand = new Random();
		fileName += String.valueOf(rand.nextInt(100));

		return fileName;
	}

	public static void main(String[] args) {
		createImageName();
	}
}
