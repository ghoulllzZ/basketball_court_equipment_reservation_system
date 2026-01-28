package com.controller.manager;

import com.entity.Classifyinfo;
import com.service.ClassifyinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//定义为控制器
@Controller
// 设置路径
@RequestMapping("/manager/classifyinfo")
public class ClassifyinfoController extends BaseManagerController {
    // 注入Service 并getter setter
    @Autowired
    private ClassifyinfoService classifyinfoService;


    // 准备添加数据
    @RequestMapping("create.do")
    public String create(Map<String, Object> map) {
        Map<String, Object> parameter = new HashMap<String, Object>();
        return "manager/classifyinfo/add";//跳转到webApp目录下对应的JSP页面
    }

    // 添加数据
    @RequestMapping("add.do")
    public String add(Classifyinfo classifyinfo) {
        classifyinfoService.insert(classifyinfo);
        return "redirect:/manager/classifyinfo/getAll.do";//跳转到action
    }

    // 通过主键删除数据
    @RequestMapping("delete.do")
    public String delete(String id) {
        classifyinfoService.delete(id);
        return "redirect:/manager/classifyinfo/getAll.do";//跳转到action
    }

    // 更新数据
    @RequestMapping("update.do")
    public String update(Classifyinfo classifyinfo) {
        classifyinfoService.update(classifyinfo);
        return "redirect:/manager/classifyinfo/getAll.do";//跳转到action
    }

    // 显示全部数据
    @RequestMapping("getAll.do")
    public String getAll(HttpServletRequest request, Map<String, Object> map) {
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
        return "manager/classifyinfo/list";//跳转到webApp目录下对应的JSP页面
    }

    // 按条件查询数据 (模糊查询)
 /*
    @RequestMapping("queryClassifyinfoByCond.do")
    public String queryClassifyinfoByCond(String cond, String name, Map<String, Object> map) {
        List<Classifyinfo> classifyinfoList = new ArrayList<Classifyinfo>();
        Classifyinfo classifyinfo = new Classifyinfo();
        if (cond != null) {
            if ("username".equals(cond)) {
                classifyinfo.setUsername(name);
                classifyinfoList = classifyinfoService.getClassifyinfoByLike(classifyinfo);
            }
            if ("password".equals(cond)) {
                classifyinfo.setPassword(name);
                classifyinfoList = classifyinfoService.getClassifyinfoByLike(classifyinfo);
            }
            if ("title".equals(cond)) {
                classifyinfo.setTitle(name);
                classifyinfoList = classifyinfoService.getClassifyinfoByLike(classifyinfo);
            }
            if ("slogan".equals(cond)) {
                classifyinfo.setSlogan(name);
                classifyinfoList = classifyinfoService.getClassifyinfoByLike(classifyinfo);
            }
            if ("opendate".equals(cond)) {
                classifyinfo.setOpendate(name);
                classifyinfoList = classifyinfoService.getClassifyinfoByLike(classifyinfo);
            }
            if ("contact".equals(cond)) {
                classifyinfo.setContact(name);
                classifyinfoList = classifyinfoService.getClassifyinfoByLike(classifyinfo);
            }

            if ("contents".equals(cond)) {
                classifyinfo.setContents(name);
                classifyinfoList = classifyinfoService.getClassifyinfoByLike(classifyinfo);
            }
        }
        map.put("classifyinfoList", classifyinfoList);
        return "manager/query";
    }
*/

    // 按主键查询数据
    @RequestMapping("getById.do")
    public String getById(String id, Map<String, Object> map) {
        Map<String, Object> parameter = new HashMap<String, Object>();
        Classifyinfo classifyinfo = classifyinfoService.getById(id);
        map.put("classifyinfo", classifyinfo);
        return "manager/classifyinfo/edit";//跳转到webApp目录下对应的JSP页面
    }


}
