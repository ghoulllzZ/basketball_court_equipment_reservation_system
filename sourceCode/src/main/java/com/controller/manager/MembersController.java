package com.controller.manager;

import com.entity.Members;
import com.service.MembersService;
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
@RequestMapping("/manager/members")
public class MembersController extends BaseManagerController {
    // 注入Service
    @Autowired
    private MembersService membersService;



    // 通过主键删除数据
    @RequestMapping("delete.do")
    public String delete(String id) {
        membersService.delete(id);
        return "redirect:/manager/members/getAll.do";//跳转到action//跳转到action
    }
    // 冻结数据
    @RequestMapping("iscooled.do")
    public String iscooled(String id,String iscooled) {
        Members members = membersService.getById(id);
        members.setIscooled(iscooled);
        membersService.update(members);
        return "redirect:/manager/members/getAll.do";//跳转到action//跳转到action
    }

   /* // 更新数据
    @RequestMapping("update.do")
    public String update(Members members) {
        membersService.update(members);
        return "redirect:/manager/members/getAll.do";//跳转到action//跳转到action
    }
*/
    // 显示全部数据
    @RequestMapping("getAll.do")
    public String getAll(HttpServletRequest request, Map<String, Object> map) {
        Map<String, Object> parameter = new HashMap<String, Object>();
        String keyword = request.getParameter("keyword");//搜索关键词
        if (keyword != null && keyword != "") parameter.put("keyword", keyword);//搜索参数


        int rowCountTotal = membersService.getRowSize(parameter);//获取总数
        int pageSize = 10;// 分页大小
        int pageNumber = 1; //设定页面参数,传递给JSP页面

        if (request.getParameter("pageNumber") != null && request.getParameter("pageNumber") != "") {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));//当前页
        }
        parameter.put("limit", pageSize);//搜索参数
        parameter.put("start", (pageNumber - 1) * pageSize);//搜索参数
        List<Members> membersList = membersService.getAll(parameter);


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

        map.put("membersList", membersList);
        return "manager/members/list";//跳转到webApp目录下对应的JSP页面
    }

    // 按条件查询数据 (模糊查询)
/*    @RequestMapping("queryMembersByCond.do")
    public String queryMembersByCond(String cond, String name, Map<String, Object> map) {
        List<Members> membersList = new ArrayList<Members>();
        Members members = new Members();
        if (cond != null) {
            if ("username".equals(cond)) {
                members.setUsername(name);
                membersList = membersService.getMembersByLike(members);
            }
            if ("password".equals(cond)) {
                members.setPassword(name);
                membersList = membersService.getMembersByLike(members);
            }
            if ("realname".equals(cond)) {
                members.setRealname(name);
                membersList = membersService.getMembersByLike(members);
            }
            if ("sex".equals(cond)) {
                members.setSex(name);
                membersList = membersService.getMembersByLike(members);
            }
            if ("birthday".equals(cond)) {
                members.setBirthday(name);
                membersList = membersService.getMembersByLike(members);
            }
            if ("contact".equals(cond)) {
                members.setContact(name);
                membersList = membersService.getMembersByLike(members);
            }
            if ("image".equals(cond)) {
                members.setImage(name);
                membersList = membersService.getMembersByLike(members);
            }
            if ("regdate".equals(cond)) {
                members.setRegdate(name);
                membersList = membersService.getMembersByLike(members);
            }
        }
        map.put("membersList", membersList);
        return "manager/query";
    }*/


    // 按主键查询数据
    @RequestMapping("getById.do")
    public String getMembersById(String id, Map<String, Object> map) {
        Members members = membersService.getById(id);
        map.put("members", members);
        return "manager/members/info";//跳转到webApp目录下对应的JSP页面
    }



}
