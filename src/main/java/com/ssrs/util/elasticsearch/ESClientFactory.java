package com.ssrs.util.elasticsearch;

import lombok.Data;
import org.apache.http.HttpHost;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestClientBuilder;
import org.elasticsearch.client.RestHighLevelClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Data
public class ESClientFactory {
    private String[] hosts;
    private Integer[] ports;
    private String schema;
    private int connectTimeOut;
    private int socketTimeOut ;
    private int connerctionRequestTimeOut;
    private int maxConnectNum;
    private int maxConnectPerRoute;
    private  boolean uniqueConnectTimeConfig = true;
    private  boolean uniqueConnectNumConfig = true;
    private  RestClientBuilder builder;
    private  RestClient restClient;
    private  RestHighLevelClient restHighLevelClient;

    //初始化	 
    public  void init() {

            HttpHost[] httpHosts = new HttpHost[hosts.length];
            for (int i=0;i<hosts.length;i++){
                httpHosts[i] =  new HttpHost(hosts[i], ports[i], schema);
            }
            builder = RestClient.builder(httpHosts);
            if (uniqueConnectTimeConfig) {
                setConnectTimeOutConfig();
                if (uniqueConnectNumConfig) {
                    setMutiConnectConfig();
                    restClient = builder.build();
                    restHighLevelClient = new RestHighLevelClient(builder);
                }
        }
    }

    /**
     * 主要关于异步httpclient的连接延时配置 
     */
    public  void setConnectTimeOutConfig() {
        builder.setRequestConfigCallback(requestConfigBuilder -> {
            requestConfigBuilder.setConnectTimeout(connectTimeOut);
            requestConfigBuilder.setSocketTimeout(socketTimeOut);
            requestConfigBuilder.setConnectionRequestTimeout(connerctionRequestTimeOut);
            return requestConfigBuilder;
        });
    }


    /**
     * 主要关于异步httpclient的连接数配置 	 
     */
    public  void setMutiConnectConfig() {
        builder.setHttpClientConfigCallback(httpClientBuilder -> {
            httpClientBuilder.setMaxConnTotal(maxConnectNum);
            httpClientBuilder.setMaxConnPerRoute(maxConnectPerRoute);
            return httpClientBuilder;
        });
    };

        public  RestClient getClient (){ return restClient;}

        public  RestHighLevelClient getHighLevelClient(){
            if (restHighLevelClient == null) {
                init();
            }
            return restHighLevelClient;
        }

        public  void close(){
            if (restHighLevelClient != null) {
                try {
                    restHighLevelClient.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
