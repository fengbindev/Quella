package com.ssrs.permission;

import com.ssrs.permission.model.Menu;
import com.ssrs.permission.service.IMenuService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sound.midi.Soundbank;
import java.util.Arrays;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class MenuTest {

    @Autowired
    private IMenuService menuService;

    @Test
    public void getRooMenu(){
        List<Menu> rootMenu = menuService.getRootMenu();
        System.out.println("++++++++++++++++++++++++++++++++++++++++++");
        System.out.println("size:"+rootMenu.size());
        for (Menu menu: rootMenu) {
            System.out.println(menu);
        }
    }
}
