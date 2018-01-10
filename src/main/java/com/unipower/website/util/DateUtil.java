package com.unipower.website.util;


import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
    public static String getFormatDate(Date date) throws ParseException {

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = formatter.format(date);
        //ParsePosition pos = new ParsePosition(8);
        return dateString;

    }

    public static String timeStamp2Date(String seconds,String format) {
            format = "yyyy-MM-dd HH:mm:ss";
            SimpleDateFormat sdf = new SimpleDateFormat(format);
            return sdf.format(new Date(Long.valueOf(seconds+"000")));
    }

    /**
     * 获取当前日期字符串
     * @param separator
     * @return
     */
    public static String getNowDateStr(String separator){
        Calendar now = Calendar.getInstance();
        int year = now.get(Calendar.YEAR);
        int month = now.get(Calendar.MONTH)+1;
        int day = now.get(Calendar.DATE);

        return year + separator + month + separator + day;
    }
}
