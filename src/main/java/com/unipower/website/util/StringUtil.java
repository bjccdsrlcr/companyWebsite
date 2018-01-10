package com.unipower.website.util;

import java.util.UUID;

/**
 * Created by bjccdsrlcr on 2018/1/9.
 */
public class StringUtil {
    public static String getUniqueFileName(){
        String str = UUID.randomUUID().toString();
        return str.replace("-", "");
    }
}
