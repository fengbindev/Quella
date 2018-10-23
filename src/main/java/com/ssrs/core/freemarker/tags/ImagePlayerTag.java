package com.ssrs.core.freemarker.tags;

import cn.hutool.core.text.StrBuilder;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssrs.model.ImagePlayer;
import com.ssrs.model.ImagePlayerResources;
import com.ssrs.service.IImagePlayerResourcesService;
import com.ssrs.service.IImagePlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;
import java.util.List;
import java.util.Map;

/**
* @Description:    图片播放器自定一标签，在页面引入标签即可实现图片播放器
* @Author:          ssrs
* @CreateDate:     2018/10/22 13:17
* @UpdateUser:     ssrs
* @UpdateDate:     2018/10/22 13:17
* @Version:        1.0
*/
@Component
public class ImagePlayerTag extends SuperCustomTag{
    @Autowired
    private IImagePlayerService imagePlayerService;
    @Autowired
    private IImagePlayerResourcesService imagePlayerResourcesService;
    @Autowired
    private ServletContext servletContext;
    @Override
    protected Object result(Map params) {
        Integer id = getInt(params, "id");
        if (id ==null){
           return null;
        }
        String basePath = servletContext.getContextPath();
        ImagePlayer imagePlayer = imagePlayerService.selectById(id);
        Integer swiperType = imagePlayer.getSwiperType();
        Integer displayCount = imagePlayer.getDisplayCount();
        String displayDesc = imagePlayer.getDisplayDesc();
        Integer height = imagePlayer.getHeight();
        Integer width = imagePlayer.getWidth();

        List<ImagePlayerResources> imgList = imagePlayerResourcesService.selectPage(new Page<>(1, displayCount), new EntityWrapper<ImagePlayerResources>().eq("image_player_id", id).eq("type",1).orderBy("sequence", "N".equals(displayDesc))).getRecords();

        StrBuilder builder = StrBuilder.create();
        builder.append(" <link rel=\"stylesheet\" href=\""+basePath+"/plugins/swiper/css/swiper.min.css\">");
        builder.append(" <script src=\""+basePath+"/plugins/swiper/js/swiper.min.js\"></script>");
        builder.append("<style>");
        builder.append(".swiper-container {\n" +
                "  width: "+width+"px;\n" +
                "  height: "+height+"px;\n" +
                " }");
        builder.append("</style>");
        builder.append("<div class=\"swiper-container\">\n" +
                " <div class=\"swiper-wrapper\">");

        for (int i=0;i<imgList.size();i++){
            builder.append("<div class=\"swiper-slide\"> <a target=\"_blank\" href=\""+imgList.get(i).getUrl()+"\" > <img width='"+width+"px' height='"+height+"px' src=\""+imgList.get(i).getImg()+"\"> </a> </div>");
        }

        builder.append(" </div>\n");

        switch (swiperType){
            //普通模式
            case 1:
                builder.append("<script>\n" +
                        "   var swiper = new Swiper('.swiper-container',{loop : true,autoplay:true});\n" +
                        "    </script>");
                break;
            //普通切换带按钮
            case 2:
                builder.append("    <div class=\"swiper-button-next\"></div>\n" +
                        "    <div class=\"swiper-button-prev\"></div>");
                builder.append(" </div>");
                builder.append("<script>\n" +
                        "    var swiper = new Swiper('.swiper-container', {\n" +
                        "loop : true,\n"+
                        "autoplay:true,\n"+
                        "      navigation: {\n" +
                        "        nextEl: '.swiper-button-next',\n" +
                        "        prevEl: '.swiper-button-prev',\n" +
                        "      },\n" +
                        "    });\n" +
                        "  </script>");
                break;
            //圆点分页器
            case 3:
                builder.append("<div class=\"swiper-pagination\"></div>");
                builder.append(" </div>");
                builder.append("<script>\n" +
                        "    var swiper = new Swiper('.swiper-container', {\n" +
                        "loop : true,\n"+
                        "autoplay:true,\n"+
                        "      pagination: {\n" +
                        "        el: '.swiper-pagination',\n" +
                        "      },\n" +
                        "    });\n" +
                        "  </script>");
                break;
            //数字分页
            case 4:
                builder.append("<!-- Add Pagination -->\n" +
                        "    <div class=\"swiper-pagination\"></div>");
                builder.append(" </div>");
                builder.append("<script>\n" +
                        "    var swiper = new Swiper('.swiper-container', {\n" +
                        "loop : true,\n"+
                        "autoplay:true,\n"+
                        "      pagination: {\n" +
                        "        el: '.swiper-pagination',\n" +
                        "        clickable: true,\n" +
                        "        renderBullet: function (index, className) {\n" +
                        "          return '<span class=\"' + className + '\">' + (index + 1) + '</span>';\n" +
                        "        },\n" +
                        "      },\n" +
                        "    });\n" +
                        "  </script>");
                builder.append("<style>");
                builder.append(" .swiper-pagination-bullet {\n" +
                        "      width: 20px;\n" +
                        "      height: 20px;\n" +
                        "      text-align: center;\n" +
                        "      line-height: 20px;\n" +
                        "      font-size: 12px;\n" +
                        "      color:#000;\n" +
                        "      opacity: 1;\n" +
                        "      background: rgba(0,0,0,0.2);\n" +
                        "    }\n" +
                        "    .swiper-pagination-bullet-active {\n" +
                        "      color:#fff;\n" +
                        "      background: #007aff;\n" +
                        "    }");
                builder.append("</style>");
                break;
            //渐变切换
            case 5:
                builder.append("<!-- Add Pagination -->\n" +
                        "    <div class=\"swiper-pagination swiper-pagination-white\"></div>\n" +
                        "    <!-- Add Arrows -->\n" +
                        "    <div class=\"swiper-button-next swiper-button-white\"></div>\n" +
                        "    <div class=\"swiper-button-prev swiper-button-white\"></div>");
                builder.append(" </div>");
                builder.append("<script>\n" +
                        "    var swiper = new Swiper('.swiper-container', {\n" +
                        "loop : true,\n"+
                        "autoplay:true,\n"+
                        "      spaceBetween: 30,\n" +
                        "      effect: 'fade',\n" +
                        "      pagination: {\n" +
                        "        el: '.swiper-pagination',\n" +
                        "        clickable: true,\n" +
                        "      },\n" +
                        "      navigation: {\n" +
                        "        nextEl: '.swiper-button-next',\n" +
                        "        prevEl: '.swiper-button-prev',\n" +
                        "      },\n" +
                        "    });\n" +
                        "  </script>");
                break;
            //垂直切换
            case 6:
                builder.append(" <div class=\"swiper-pagination\"></div>");
                builder.append("</div>");
                builder.append("<script>\n" +
                        "    var swiper = new Swiper('.swiper-container', {\n" +
                        "loop : true,\n"+
                        "autoplay:true,\n"+
                        "      direction: 'vertical',\n" +
                        "      pagination: {\n" +
                        "        el: '.swiper-pagination',\n" +
                        "        clickable: true,\n" +
                        "      },\n" +
                        "    });\n" +
                        "  </script>");
                break;
            default:break;
        }
        return builder.toString();
    }
}
