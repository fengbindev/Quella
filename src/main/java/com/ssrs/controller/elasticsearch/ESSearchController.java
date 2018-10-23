package com.ssrs.controller.elasticsearch;

import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.unit.TimeValue;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.concurrent.TimeUnit;

/**
* @Description:    首页搜索
* @Author:         ssrs
* @CreateDate:     2018/10/8 12:09
* @UpdateUser:     ssrs
* @UpdateDate:     2018/10/8 12:09
* @Version:        1.0
*/
@Controller
@Scope(value = "prototype")
@RequestMapping("search")
public class ESSearchController {

    @Autowired
    private RestHighLevelClient client;

    @RequestMapping(value = "/elasticsearch" ,method = RequestMethod.GET)
    @ResponseBody
    public Object esSearch(String keyword,int page,int limit){
        ModelAndView modelAndView = new ModelAndView("elasticsearch/index");
        try {
            keyword = new String(keyword.getBytes("ISO-8859-1"),"UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        modelAndView.addObject("curr",page);
        modelAndView.addObject("limit",limit);
        SearchRequest searchRequest = new SearchRequest("blogcontent");
        System.out.println(searchRequest);
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();

//        组合查询：title字段 or text字段
        sourceBuilder.query(QueryBuilders.boolQuery()
                .should(QueryBuilders.matchQuery("title", keyword))
                .should(QueryBuilders.matchQuery("text", keyword))
        );
        sourceBuilder.from((page-1)*limit);
        sourceBuilder.size(limit);
        sourceBuilder.timeout(new TimeValue(60, TimeUnit.SECONDS));
        searchRequest.source(sourceBuilder);

        try {
            SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);
            SearchHits hits = searchResponse.getHits();
            modelAndView.addObject("keyword",keyword);
            modelAndView.addObject("total",hits.getTotalHits());
            modelAndView.addObject("took",searchResponse.getTook().getMillis());
            SearchHit[] hitsHits = hits.getHits();
            modelAndView.addObject("hits",hitsHits);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

}
