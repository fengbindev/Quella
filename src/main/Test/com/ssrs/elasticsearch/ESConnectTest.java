package com.ssrs.elasticsearch;

import org.elasticsearch.ElasticsearchException;
import org.elasticsearch.action.get.GetRequest;
import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.rest.RestStatus;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.IOException;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-elasticsearch.xml")
public class ESConnectTest {
    @Autowired
    RestHighLevelClient restHighLevelClient;

    @Test
    public void search(){

        GetRequest request = new GetRequest("posts","doc","2");
        GetResponse getResponse = null;
        try {
            getResponse = restHighLevelClient.get(request, RequestOptions.DEFAULT);
            String index = getResponse.getIndex();
            String type = getResponse.getType();
            String id = getResponse.getId();
            if (getResponse.isExists()) {
                long version = getResponse.getVersion();
                String sourceAsString = getResponse.getSourceAsString();
                Map<String, Object> sourceAsMap = getResponse.getSourceAsMap();
                byte[] sourceAsBytes = getResponse.getSourceAsBytes();
                System.out.println("version:"+version);
                System.out.println("string:"+sourceAsString);
                System.out.println("map:"+sourceAsMap);
                System.out.println(("byte:"+sourceAsBytes));
            } else {

            }
        } catch (ElasticsearchException e) {
            if (e.status() == RestStatus.NOT_FOUND) {
                System.out.println("索引不存在");
            }
            if (e.status() == RestStatus.CONFLICT) {
                System.out.println("版本冲突");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
