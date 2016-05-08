package com.lql.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by LQL on 2016/5/7.
 */
public class DateUtil {

    public static String generateCurrentDate(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = sdf.format(new Date());
        return date;
    }
}
