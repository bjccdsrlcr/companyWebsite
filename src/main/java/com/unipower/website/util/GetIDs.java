package com.unipower.website.util;

/**
 * Created by bjccdsrlcr on 2018/1/2.
 */
public class GetIDs {
    public static int getIDsFromPath(String path){
        String array[] = path.split("^[0-9]");
        return Integer.parseInt(array[0]);
    }
}
