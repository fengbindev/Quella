package com.ssrs.core.websocket;


import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import java.io.*;

public class TailLogThread extends Thread{
    private BufferedReader reader;
    private WebSocketSession session;

    public TailLogThread(InputStream in, WebSocketSession session) {
        try {
            this.reader = new BufferedReader(new InputStreamReader(in,"UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        this.session = session;

    }
    @Override
    public void run() {
        String line;
        try {
            while((line = reader.readLine()) != null) {
                // 将实时日志通过WebSocket发送给客户端，给每一行添加一个HTML换行
                if (session.isOpen()){
                    session.sendMessage(new TextMessage(line + "<br>"));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
