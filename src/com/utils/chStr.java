package com.utils;

import java.nio.charset.StandardCharsets;

public class chStr {
    /**
     * 解决中文乱码问题
     */
    public String chStr(String str) {
        if(str == null) {
            str = "";
        }else {
            str = new String(str.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8).trim();
        }
        return str;
    }
}
