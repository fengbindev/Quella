package com.ssrs.controller.student;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssrs.core.manager.PageManager;
import com.ssrs.model.Student;
import com.ssrs.service.IStudentService;
import com.ssrs.util.commom.APPUtil;
import com.ssrs.util.commom.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author 上善若水
 * @date 2018/12/31
 */
@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private IStudentService studentService;

    /**
     * 接收 /student/index GET 请求
     * 跳转到 /webapp/WEB-INF/ftl/student/index.ftl 页面
     * @return
     */
    @RequestMapping(value = "index" ,method = RequestMethod.GET)
    public String index(){
        return "student/index";
    }

    /**
     * 接收 /student/goAdd GET 请求
     * 跳转到 /webapp/WEB-INF/ftl/student/add.ftl 页面
     * @return
     */
    @RequestMapping(value = "goAdd" ,method = RequestMethod.GET)
    public String goAdd(){
        return "student/add";
    }

    /**
     * 接收 /student/goUpdate GET 请求
     * 跳转到 /webapp/WEB-INF/ftl/student/update.ftl 页面
     * @return
     */
     @RequestMapping(value = "goUpdate" ,method = RequestMethod.GET)
        public String goUpdate(long id, Model model){
            Student student = studentService.selectById(id);
            model.addAttribute("stu",student);  //底层原理：使用request.setAttribute()方法
            return  "student/update";  //返回视图
        }

    @RequestMapping(value = "del" ,method = RequestMethod.POST)
    @ResponseBody
    public Object update(long id){
        boolean b = studentService.deleteById(id);
        return b?APPUtil.resultMapType(APPUtil.DELEATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.DELEATE_ERROR_TYPE);
    }

    /**
     * 接收 /student/add POST 请求
     * @return
     */
    @RequestMapping(value = "add" ,method = RequestMethod.POST)
    @ResponseBody
    public Object add(Student student){
        boolean b = studentService.insert(student);
        //如果添加成功，就放回{status:200,message:'添加成功'}的JSON格式类型数据给前台 否则就返回{status:101,message:'添加失败'}
        return b?APPUtil.resultMapType(APPUtil.INSERT_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.INSERT_ERROR_TYPE);
    }

    /**
     * 接收 /student/update POST 请求
     * @return
     */
    @RequestMapping(value = "update" ,method = RequestMethod.POST)
    @ResponseBody
    public Object update(Student student){
        boolean b = studentService.updateById(student);
        return b?APPUtil.resultMapType(APPUtil.UPDATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.UPDATE_ERROR_TYPE);
    }


    @RequestMapping(value = "getStudentPage" ,method = RequestMethod.POST)
    @ResponseBody
    public Object getStudentPage(int page,int limit,String title){

        boolean istitle = false;
		if (StringUtils.isNotBlank(title)){
			istitle = true;
		}


        //简单分页查询 page当前页 limit 分页大小
        Page<Student> studentPage = studentService.selectPage(new Page<>(page, limit),new EntityWrapper<Student>()
                                               				.like(istitle,"title",title)
);
        return PageManager.buildPage(studentPage);
    }

}
