package com.ssrs.controller.elasticsearch;

import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.unit.TimeValue;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
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
public class ESSearch {

    @Autowired
    private RestHighLevelClient client;

    @RequestMapping(value = "/esSearch" ,method = RequestMethod.GET)
    @ResponseBody
    public Object esSearch(String keyword){
        SearchRequest searchRequest = new SearchRequest();
        System.out.println(searchRequest);
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        sourceBuilder.query(QueryBuilders.matchQuery("name", "测试"));
        sourceBuilder.from(0);
        sourceBuilder.size(10);
        sourceBuilder.timeout(new TimeValue(60, TimeUnit.SECONDS));
        searchRequest.source(sourceBuilder);

        try {
            SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);
            SearchHits hits = searchResponse.getHits();
            return hits;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

}
