package com.gs.common;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;

/**
 * Created by Administrator on 2017/12/7.
 */
public class CheckCodeUtils {

    private static final String CODES = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXY0123456789";

    private static final int CODE_LENGTH = 5;

    private static final int IMAGE_WIDTH = 80;
    private static final int IMAGE_HEIGHT = 30;

    private static final int LINE_COUNT = 5;

    public static String randomCode(int length) {
        char[] chars = CODES.toCharArray();
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < length; i++) {
            sb.append(chars[random.nextInt(CODES.length())]);
        }
        return sb.toString();
    }

    public static String randomCode() {
        return randomCode(CODE_LENGTH);
    }

    public static BufferedImage generateImage(String code) {
        BufferedImage image = new BufferedImage(IMAGE_WIDTH, IMAGE_HEIGHT, BufferedImage.TYPE_INT_RGB);
        Graphics graphics = image.getGraphics();
        graphics.setColor(Color.white);
        graphics.fillRect(0, 0, IMAGE_WIDTH, IMAGE_HEIGHT);
        graphics.setColor(Color.black);
        graphics.setFont(new Font("宋体", Font.BOLD, 16));
        graphics.drawString(code, 15, 18);
        for (int i = 0; i < LINE_COUNT; i++) {
            graphics.setColor(randomColor());
            Point pStart = randomPoint();
            Point pEnd = randomPoint();
            graphics.drawLine((int) pStart.getX(), (int) pStart.getY(), (int) pEnd.getX(), (int) pEnd.getY());
        }
        return image;
    }

    private static Point randomPoint() {
        Point p = new Point();
        Random random = new Random();
        p.setLocation(random.nextInt(IMAGE_WIDTH), random.nextInt(IMAGE_HEIGHT));
        return p;
    }

    private static Color randomColor() {
        Random random = new Random();
        return new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255));
    }

    public static String recommendCode() {

        String[] code = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b","c","d","e"};
        String recommend = "";
        for (int i = 0; i < 5; i++) {
            int id = (int) Math.ceil(Math.random() * 14);
            recommend += code[id];
        }
        return recommend;
    }


}
