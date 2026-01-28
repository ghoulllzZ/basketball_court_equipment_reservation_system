package com.controller.manager;

import com.entity.Goodsinfo;
import com.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;

//定义为控制器
@Controller
// 设置路径
@RequestMapping("/manager/goodsinfo")
public class GoodsinfoController extends BaseManagerController {
    // 注入Service 并getter setter
    @Resource
    private GoodsinfoService goodsinfoService;

    // 状态更新
    @RequestMapping("status.do")
    public String status(String id, int status, Map<String, Object> map) {

        Goodsinfo goodsinfo = goodsinfoService.getById(id);
        goodsinfo.setStatus(status);
        goodsinfoService.update(goodsinfo);
        return "redirect:/manager/goodsinfo/getAll.do";//跳转到action
    }


    // 审核更新
    @RequestMapping("iscooled.do")
    public String iscooled(String id, int iscooled, Map<String, Object> map) {

        Goodsinfo goodsinfo = goodsinfoService.getById(id);
        goodsinfo.setIscooled(iscooled);
        goodsinfoService.update(goodsinfo);
        return "redirect:/manager/goodsinfo/getAll.do";//跳转到action
    }


    // 准备添加数据
    @RequestMapping("create.do")
    public String create(Map<String, Object> map) {
        Map<String, Object> parameter = new HashMap<String, Object>();


        return "manager/goodsinfo/add";//跳转到webApp目录下对应的JSP页面

    }

    // 添加数据
    @RequestMapping("add.do")
    public String add(Goodsinfo goodsinfo) {
        goodsinfo.setIscooled(0);//管理员添加默认直接上架
        goodsinfo.setStatus(0);
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = formatter.format(currentTime);
        goodsinfo.setCreatedate(date);
        goodsinfoService.insert(goodsinfo);
        return "redirect:/manager/goodsinfo/getAll.do";//跳转到action
    }

    // 通过主键删除数据
    @RequestMapping("delete.do")
    public String delete(String id) {
        goodsinfoService.delete(id);
        return "redirect:/manager/goodsinfo/getAll.do";//跳转到action
    }

    // 更新数据
    @RequestMapping("update.do")
    public String update(Goodsinfo goodsinfo) {
        goodsinfoService.update(goodsinfo);
        return "redirect:/manager/goodsinfo/getAll.do";//跳转到action
    }

    // 显示全部数据
    @RequestMapping("getAll.do")
    public String getAll(HttpServletRequest request, Map<String, Object> map) throws UnsupportedEncodingException {
        Map<String, Object> parameter = new HashMap<String, Object>();
        String keyword = request.getParameter("keyword");//搜索关键词
        if (keyword != null && keyword != "") {

            ////keyword = new String(keyword.getBytes("iso-8859-1"), "utf-8");//编码转换,防止乱码
            parameter.put("keyword", keyword);//搜索参数
        }
        int rowCountTotal = goodsinfoService.getRowSize(parameter);//获取总数
        int pageSize = 10;// 分页大小
        int pageNumber = 1; //设定页面参数,传递给JSP页面

        if (request.getParameter("pageNumber") != null && request.getParameter("pageNumber") != "") {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));//当前页
        }
        parameter.put("limit", pageSize);//搜索参数
        parameter.put("start", (pageNumber - 1) * pageSize);//搜索参数
        List<Goodsinfo> goodsinfoList = goodsinfoService.getAll(parameter);


        //设定页面参数,传递给JSP页面
        Map<String, Object> pager = new HashMap<String, Object>();
        int pageCount = 1;// 总页数
        // 计算总页数
        if (rowCountTotal % pageSize == 0) {
            pageCount = rowCountTotal / pageSize;
        } else {
            pageCount = rowCountTotal / pageSize + 1;
        }
        pager.put("pageNumber", pageNumber);//当前页
        pager.put("pageCount", pageCount);//总页数
        pager.put("rowCountTotal", rowCountTotal);//记录总条数

        map.put("keyword", keyword);
        map.put("pager", pager);


        map.put("goodsinfoList", goodsinfoList);
        return "manager/goodsinfo/list";//跳转到webApp目录下对应的JSP页面
    }


    // 按主键查询数据
    @RequestMapping("getById.do")
    public String getById(String id, Map<String, Object> map) {
        Map<String, Object> parameter = new HashMap<String, Object>();
        Goodsinfo goodsinfo = goodsinfoService.getById(id);
        map.put("goodsinfo", goodsinfo);


        return "manager/goodsinfo/edit";//跳转到webApp目录下对应的JSP页面
    }


}
