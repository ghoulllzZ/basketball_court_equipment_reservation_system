package com.controller;

import com.util.CpachaUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.HashMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

/*上传*/
@Controller
@RequestMapping("/system")
public class SystemController {

    // 后台主界面
    @RequestMapping("start_page.do")
    public String start_page(Map<String, Object> map) {
        return "manager/start_page";//跳转到webApp目录下对应的JSP页面
    }


    /*上传图片*/
    @RequestMapping(value = "/image.do")
    public String upload(@RequestParam(value = "image", required = false) MultipartFile file, HttpServletRequest request, ModelMap model) {

        String path = request.getSession().getServletContext().getRealPath("upload_files");
        String fileName = file.getOriginalFilename();
        int i = fileName.lastIndexOf(".");


        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("MMddHHmmss");
        String name = formatter.format(currentTime);

        String type = fileName.substring(i + 1);
        // 生成随机数
        int fourDigitRandomNum = (int) (Math.random() * 9000) + 1000;
        fileName = name + fourDigitRandomNum + "." + type;//文件名称

        File targetFile = new File(path, fileName);
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }

        // 保存
        try {
            file.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("imageFileName", fileName);
        return "upload_images";
    }

    /*上传文件*/
    @RequestMapping(value = "/files.do")
    public String files(@RequestParam(value = "files", required = false) MultipartFile file, HttpServletRequest request, ModelMap model) {

        String path = request.getSession().getServletContext().getRealPath("upload_files");
        String fileName = file.getOriginalFilename();
        int i = fileName.lastIndexOf(".");


        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("MMddHHmmss");
        String name = formatter.format(currentTime);

        String type = fileName.substring(i + 1);
        // 生成随机数
        int fourDigitRandomNum = (int) (Math.random() * 9000) + 1000;
        fileName = name + fourDigitRandomNum + "." + type;//文件名称

        File targetFile = new File(path, fileName);
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }

        // 保存
        try {
            file.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("imageFileName", fileName);
        return "upload_files";

    }

    /**
     * 本系统所有的验证码均采用此方法
     *
     * @param vcodeLen
     * @param width
     * @param height
     * @param cpachaType:用来区别验证码的类型，传入字符串
     * @param request
     * @param response
     */
    @RequestMapping(value = "/getCpacha.do")
    public void generateCpacha(
            @RequestParam(name = "vl", required = false, defaultValue = "4") Integer vcodeLen,
            @RequestParam(name = "w", required = false, defaultValue = "100") Integer width,
            @RequestParam(name = "h", required = false, defaultValue = "30") Integer height,
            @RequestParam(name = "type", required = true, defaultValue = "loginCpacha") String cpachaType,
            HttpServletRequest request,
            HttpServletResponse response) {
        CpachaUtil cpachaUtil = new CpachaUtil(vcodeLen, width, height);
        String generatorVCode = cpachaUtil.generatorVCode();
        request.getSession().setAttribute(cpachaType, generatorVCode);
        BufferedImage generatorRotateVCodeImage = cpachaUtil.generatorRotateVCodeImage(generatorVCode, true);
        try {
            ImageIO.write(generatorRotateVCodeImage, "gif", response.getOutputStream());
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * 获取 验证码 是否自动填充用户名
     */

    @Autowired
    private Environment environment;

    @RequestMapping(value = "/get_login_set.do")
    public @ResponseBody Map<String, Object> get_login_set(
            HttpServletRequest request,
            HttpServletResponse response) {
        Map<String, Object> result = new HashMap<String, Object>();

        Boolean auto_fill_login_username= Boolean.valueOf(environment.getProperty("auto-fill-login-username"));
        Boolean is_login_code= Boolean.valueOf(environment.getProperty("is-login-code"));


        result.put("is_login_code", is_login_code);
        result.put("auto_fill_login_username", auto_fill_login_username);


        if (request.getSession().getAttribute("loginCpacha") != null) {
            result.put("login_code", request.getSession().getAttribute("loginCpacha").toString());
            request.getSession().getAttribute("loginCpacha").toString();
        } else {
            result.put("login_code", "");
        }


        return result;

    }
}
