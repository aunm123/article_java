package com.util;

public class StringUtils {
    public static boolean isEmpty(String str) {
        return null == str || str.equals("")
                || str.matches("\\s*");
    }

    public static String defaultValue(String content, String defaultValue) {
        if (isEmpty(content)) {
            return defaultValue;
        }
        return content;
    }

    public static String getMethodName(String mName) {
        String name = "set" + mName.substring(0, 1).toUpperCase() + mName.substring(1);
        return name;
    }
}
