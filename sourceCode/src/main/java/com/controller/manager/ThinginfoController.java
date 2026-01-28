package com.controller.manager;

import com.entity.Classifyinfo;
import com.entity.Thinginfo;
import com.service.ClassifyinfoService;
import com.service.ThinginfoService;
import com.service.PurchasesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

//定义为控制器
@Controller
// 设置路径
@RequestMapping("/manager/thinginfo")
public class ThinginfoController extends BaseManagerController {
    // 注入Service 并getter setter
    @Autowired
    private ThinginfoService thinginfoService;
    @Autowired
    private PurchasesService purchasesService;

   @Autowired
    private ClassifyinfoService classifyinfoService;


    // 状态更新
    @RequestMapping("status.do")
    public String status(String id, int status, Map<String, Object> map) {

        Thinginfo thinginfo = thinginfoService.getById(id);
        thinginfo.setStatus(status);
        thinginfoService.update(thinginfo);
        return "redirect:/manager/thinginfo/getAll.do";//跳转到action
    }


    // 准备添加数据
    @RequestMapping("create.do")
    public String create(Map<String, Object> map) {
        Map<String, Object> parameter = new HashMap<String, Object>();
         List<Classifyinfo> classifyinfoList = classifyinfoService.getAll(parameter);
          map.put("classifyinfoList", classifyinfoList);
        return "manager/thinginfo/add";//跳转到webApp目录下对应的JSP页面
    }

    // 添加数据
    @RequestMapping("add.do")
    public String add(Thinginfo thinginfo) {

        thinginfo.setStatus(0);
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String date = formatter.format(currentTime);
        thinginfo.setCreatedate(date);
        thinginfoService.insert(thinginfo);
        return "redirect:/manager/thinginfo/getAll.do";//跳转到action
    }

    // 通过主键删除数据
    @RequestMapping("delete.do")
    public String delete(String id) {
        thinginfoService.delete(id);
        return "redirect:/manager/thinginfo/getAll.do";//跳转到action
    }

    // 更新数据
    @RequestMapping("update.do")
    public String update(Thinginfo thinginfo) {
        thinginfoService.update(thinginfo);
        return "redirect:/manager/thinginfo/getAll.do";//跳转到action
    }

    // 显示全部数据
    @RequestMapping("getAll.do")
    public String getAll(HttpServletRequest request, Map<String, Object> map) {
        Map<String, Object> parameter = new HashMap<String, Object>();
        String keyword = request.getParameter("keyword");//搜索关键词
        if (keyword != null && keyword != "") parameter.put("keyword", keyword);//搜索参数


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
        return "manager/thinginfo/list";//跳转到webApp目录下对应的JSP页面
    }


    // 按主键查询数据
    @RequestMapping("getById.do")
    public String getById(String id, Map<String, Object> map) {
        Map<String, Object> parameter = new HashMap<String, Object>();
        Thinginfo thinginfo = thinginfoService.getById(id);
        map.put("thinginfo", thinginfo);
        List<Classifyinfo> classifyinfoList = classifyinfoService.getAll(parameter);
        map.put("classifyinfoList", classifyinfoList);
        return "manager/thinginfo/edit";//跳转到webApp目录下对应的JSP页面
    }


}
