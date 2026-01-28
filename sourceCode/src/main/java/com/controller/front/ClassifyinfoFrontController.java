package com.controller.front;

import com.entity.Classifyinfo;
import com.entity.Thinginfo;
import com.service.ClassifyinfoService;
import com.service.ThinginfoService;
import com.service.PurchasesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//定义为控制器
@Controller
// 设置路径
@RequestMapping("/front")
public class ClassifyinfoFrontController extends BaseFrontController {


    @Autowired
    private ClassifyinfoService classifyinfoService;
    // 注入Service 并getter setter

    @Autowired
    private ThinginfoService thinginfoService;
    // 注入Service 并getter setter
    @Autowired
    private PurchasesService purchasesService;
    // 注入Service 并getter setter


    // 全部备用权限
    @RequestMapping("classifyinfo.do")
    public String classifyinfo(HttpServletRequest request, Map<String, Object> map) {
        this.front();
        Map<String, Object> parameter = new HashMap<String, Object>();

        String keyword = request.getParameter("keyword");//搜索关键词
        if (keyword != null && keyword != "") parameter.put("keyword", keyword);//搜索参数


        int rowCountTotal = classifyinfoService.getRowSize(parameter);//获取总数
        int pageSize = 10;// 分页大小
        int pageNumber = 1; //设定页面参数,传递给JSP页面

        if (request.getParameter("pageNumber") != null && request.getParameter("pageNumber") != "") {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));//当前页
        }
        parameter.put("limit", pageSize);//搜索参数
        parameter.put("start", (pageNumber - 1) * pageSize);//搜索参数
        List<Classifyinfo> classifyinfoList = classifyinfoService.getAll(parameter);


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
        map.put("classifyinfoList", classifyinfoList);
        return "classifyinfo";//跳转到webApp目录下对应的JSP页面
    }

    // 详细
    @RequestMapping("classifyinfoDetail.do")
    public String classifyinfoDetail(HttpServletRequest request, String id, Map<String, Object> map) {
        this.front();
        Classifyinfo classifyinfo = classifyinfoService.getById(id);
        map.put("classifyinfo", classifyinfo);


        //----------------------------------------包含的
        Map<String, Object> parameter = new HashMap<String, Object>();
        String keyword = request.getParameter("keyword");//搜索关键词
        if (keyword != null && keyword != "") parameter.put("keyword", keyword);//搜索参数


        parameter.put("classifyinfoid", id);//只显示当前的
        int rowCountTotal = thinginfoService.getRowSize(parameter);//获取总数
        int pageSize = 10;// 分页大小
        int pageNumber = 1; //设定页面参数,传递给JSP页面

        if (request.getParameter("pageNumber") != null && request.getParameter("pageNumber") != "") {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));//当前页
        }
        parameter.put("limit", pageSize);//搜索参数
        parameter.put("start", (pageNumber - 1) * pageSize);//搜索参数


        List<Thinginfo> thinginfoList = thinginfoService.getAll(parameter);


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


        map.put("thinginfoList", thinginfoList);


        return "classifyinfoDetail";//跳转到webApp目录下对应的JSP页面
    }


}
