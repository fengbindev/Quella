package com.ssrs.core.freemarker.tags;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ssrs.model.DictionaryItem;
import com.ssrs.service.IDictionaryItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
/**
* @Description:    数据字典自定义标签
* @Author:          ssrs
* @CreateDate:     2018/10/24 19:56
* @UpdateUser:     ssrs
* @UpdateDate:     2018/10/24 19:56
* @Version:        1.0
*/
@Component
public class DictionaryTag extends SuperCustomTag{
    @Autowired
    private IDictionaryItemService dictionaryItemService;
    @Override
    protected Object result(Map params) {
        Integer id = getInt(params, "id");
        if (id ==null){
            return null;
        }
        List<DictionaryItem> dictionaryItems = dictionaryItemService.selectList(new EntityWrapper<DictionaryItem>().eq("type_id", id).orderBy("sequence"));
        return dictionaryItems;
    }
}
