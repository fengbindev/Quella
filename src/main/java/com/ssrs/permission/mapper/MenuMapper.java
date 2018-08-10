package com.ssrs.permission.mapper;

import com.ssrs.permission.model.Menu;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author ssrs
 * @since 2018-08-08
 */
public interface MenuMapper extends BaseMapper<Menu> {

    //查询所有菜单
    List<Menu> getRootMenu();

    int insert2(Menu menu);

    Menu selectById2(Long id);

    int updateById2(Menu menu);

//    List<Menu> getChildernMenu(@Param("parentId") Integer parentId);
}
