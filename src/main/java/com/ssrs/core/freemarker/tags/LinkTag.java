package com.ssrs.core.freemarker.tags;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ssrs.model.Link;
import com.ssrs.service.ILinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
/**
* @Description:    友情链接自定义标签
* @Author:          ssrs
* @CreateDate:     2018/10/24 14:47
* @UpdateUser:     ssrs
* @UpdateDate:     2018/10/24 14:47
* @Version:        1.0
*/
@Component
public class LinkTag extends SuperCustomTag {
    @Autowired
    private ILinkService linkService;
    @Override
    protected Object result(Map params) {
        Integer id = getInt(params, "id");
        if (id ==null){
            return null;
        }
        List<Link> linkList = linkService.selectList(new EntityWrapper<Link>().eq("link_group_id", id));
        return linkList;
    }
}
