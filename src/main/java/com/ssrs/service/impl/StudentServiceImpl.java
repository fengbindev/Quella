package com.ssrs.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ssrs.mapper.StudentMapper;
import com.ssrs.model.Student;
import com.ssrs.service.IStudentService;
import org.springframework.stereotype.Service;


/**
 * @author 上善若水
 * @date 2018/12/31
 */
@Service("studentService")
public class StudentServiceImpl extends ServiceImpl<StudentMapper, Student> implements IStudentService {

}

