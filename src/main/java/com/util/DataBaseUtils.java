package com.util;

import com.annotation.Column;

import javax.xml.crypto.Data;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.*;
import java.util.*;

public class DataBaseUtils {

    private static String username; //用户名
    private static String password; //密码
    private static String url; //数据库名
    private static String driver; //加载类

    static {
        config("db.properties");
    }

    /**
     * 获取数据连接
     * @param path
     */
    public static void config(String path) {
        InputStream inputStream = DataBaseUtils.class.getClassLoader().getResourceAsStream(path);
        Properties properties = new Properties();
        try {
            properties.load(inputStream);
            username = properties.getProperty("db.username");
            password = properties.getProperty("db.password");
            url = properties.getProperty("db.url");
            driver = properties.getProperty("db.driver");

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获得连接
     * @return
     */
    public static Connection getConnerction() {
        Connection connection = null;
        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(url,username,password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return connection;
    }

    /**
     * 关闭连接
     * @param connection
     * @param statement
     * @param resultSet
     */
    public static void closeConnection(Connection connection, PreparedStatement statement, ResultSet resultSet){
        try {
            if (resultSet!=null) resultSet.close();
            if (statement!=null) statement.close();
            if (connection!=null) connection.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    /**
     * 更新sql
     * @param sql
     * @param objects
     */
    public static void update(String sql, Object... objects){
        Connection connection = getConnerction();
        PreparedStatement statement = null;

        try {
            statement = connection.prepareStatement(sql);
            for (int i = 0; i< objects.length; i++){
                statement.setObject(i+1,objects[i]);
            }
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection,statement,null);
        }

    }

    /**
     * 查询列出数据 List
     * @param sql
     * @param objects
     * @return
     */
    public static List<Map<String,Object>> queryForList(String sql, Object... objects){
        List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
        Connection connection = getConnerction();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.prepareStatement(sql);
            for (int i = 0; i < objects.length; i++) {
                statement.setObject(i+1, objects[i]);
            }

            resultSet = statement.executeQuery();
            while (resultSet.next()){
                ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
                int count = resultSetMetaData.getColumnCount(); //获取列数

                Map<String,Object> map = new HashMap<String,Object>();
                for (int i = 0; i< count; i++){
                    String name = resultSetMetaData.getColumnName(i+1);
                    map.put(name, resultSet.getObject(name));
                }
                result.add(map);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection,statement,resultSet);
        }

        return result;
    }

    /**
     * 查询数据 Map
     * @param sql
     * @param objects
     * @return
     */
    public static Map<String,Object> queryForMap(String sql, Object ...objects){
        Map<String,Object> result = new HashMap<String,Object>();
        List<Map<String,Object>> list = queryForList(sql, objects);
        if(list.size() != 1){
            return null;
        }
        result = list.get(0);
        return result;
    }


    /**
     * 数据库获取单个数据并封装成类
     * @param clazz
     * @param sql
     * @param objects
     * @param <T>
     * @return
     */
    public static <T>T queryForBean(Class clazz,String sql,Object... objects) {
        T obj = null;
        Map<String, Object> map = DataBaseUtils.queryForMap(sql, objects);;

        obj = DataBaseUtils.mapClassWithMap(clazz,map);

        return obj;
    }

    /**
     * Map封装类
     * @param clazz
     * @param dataMap
     * @param <T>
     * @return
     */
    public static <T>T mapClassWithMap(Class clazz,Map<String,Object>dataMap){
        T obj = null;

        try {
            obj = (T) clazz.newInstance();
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (dataMap ==null){
            return null;
        }

        Field[] fields = obj.getClass().getDeclaredFields();
        for (Field field : fields){

            try {
                Column column = field.getAnnotation(Column.class);
                String mapName = column.field();
                String fieldName = field.getName();
                Class parmType = field.getType();

                String methodName = StringUtils.getMethodName(fieldName);
                Object value = dataMap.get(mapName);

                if (parmType.equals(Integer.class)){
                    value = Integer.parseInt(String.valueOf(value));
                }
                if (parmType.equals(String.class)){
                    value = String.valueOf(value);
                }

                Method method = clazz.getDeclaredMethod(methodName,parmType);
                method.invoke(obj,value);
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return obj;
    }
}
