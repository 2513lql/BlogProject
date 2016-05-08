package com.lql.util;

import java.util.UUID;

/**
 * Created by LQL on 2016/4/14.
 */
public class UUIDUtil {

    public static String generateUserId(){
        UUID uuid = UUID.randomUUID();
        String str = "user_"+ uuid.toString().substring(0,6);
        return str;
    }

    public static void main(String[] args) {
        System.out.println(generateUserId());
    }

}
