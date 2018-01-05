package com.unipower.website.util;


import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * Created by bjccdsrlcr on 2018/1/2.
 */
public class DateUtil {
    /**
     * 获取当前时间 new Date()
     * @param date
     * @return 返回时间类型 yyyy-MM-dd HH:mm:ss
     */
    public static Date getFormatDate(Date date) throws ParseException {

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = formatter.format(date);
        //ParsePosition pos = new ParsePosition(8);
        Date currentTime_2 = formatter.parse(dateString);
        return currentTime_2;

    }

    public static String timeStamp2Date(String seconds,String format) {
            format = "yyyy-MM-dd HH:mm:ss";
            SimpleDateFormat sdf = new SimpleDateFormat(format);
            return sdf.format(new Date(Long.valueOf(seconds+"000")));
            }
}
