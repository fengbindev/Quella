package com.ssrs.core.websocket;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.io.IOException;
import java.io.InputStream;

/**
 * @Description: 利用websocket实时输出tomcat的catlina.out日志信息
 * @Author: ssrs
 * @CreateDate: 2018/10/25 17:22
 * @UpdateUser: ssrs
 * @UpdateDate: 2018/10/25 17:22
 * @Version: 1.0
 */
public class CatlinaLogWebsocketHandler extends TextWebSocketHandler {

    private Process process;
    private InputStream inputStream;
    private InputStream errorStream;
    private String catalinaOutPath;
    /**
     * 链接建立成功
     *
     * @param session
     * @throws Exception
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        super.afterConnectionEstablished(session);
        try {
            // 执行tail -f命令
            String  cmd="tail -f "+catalinaOutPath;
            process = Runtime.getRuntime().exec(cmd);
            inputStream = process.getInputStream();
            errorStream = process.getErrorStream();
            // 一定要启动新的线程，防止InputStream阻塞处理WebSocket的线程
            TailLogThread thread = new TailLogThread(inputStream, session);
            TailLogThread thread2 = new TailLogThread(errorStream, session);
            thread.start();
            thread2.start();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        super.afterConnectionClosed(session, status);
        try {
            if (inputStream != null)
                inputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            if (errorStream != null)
                errorStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (process != null) {
            process.destroy();
        }

    }

    public String getCatalinaOutPath() {
        return catalinaOutPath;
    }

    public void setCatalinaOutPath(String catalinaOutPath) {
        this.catalinaOutPath = catalinaOutPath;
    }
}
