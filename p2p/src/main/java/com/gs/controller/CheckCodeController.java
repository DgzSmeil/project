package com.gs.controller;

import com.gs.common.CheckCodeUtils;
import com.gs.common.Constants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;

/**
 * Created by Administrator on 2017/12/7.
 */
@Controller
@RequestMapping("/code")
public class CheckCodeController {

    private Logger logger = LoggerFactory.getLogger(CheckCodeController.class);

    @RequestMapping("")
    public void code(HttpSession session, HttpServletResponse response) {
        String code = CheckCodeUtils.randomCode();
        session.setAttribute(Constants.CODE_IN_SESSION, code);
        BufferedImage image = CheckCodeUtils.generateImage(code);
        try {
            OutputStream out = response.getOutputStream();
            ImageIO.write(image, "png", out);
        } catch (IOException e) {
            logger.error(e.getMessage());
        }
    }

}
