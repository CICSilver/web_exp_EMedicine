package com.utils;

import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class ConnDB {
    /**
     * 数据库连接对象
     */
    public Connection conn = null;
    /**
     * Statement对象，用于执行SQL语句
     */
    public Statement statement = null;
    /**
     * 结果集对象
     */
    public ResultSet resultSet = null;

    private static String propFileNamme = "/com/DBprop.properties";

    private static Properties properties = new Properties();

    private static String dbClassName,dbURL;

    public ConnDB(){
        try{
            InputStream in = getClass().getResourceAsStream(propFileNamme);
            properties.load(in);
            dbClassName = properties.getProperty("DB_CLASS_NAME");
            dbURL = properties.getProperty("DB_URL");
        }catch (Exception e){
            System.err.println("jdbc连接出错");
            e.printStackTrace();
        }
    }

    /**
     * 连接数据库方法
     */
    public Connection getConnection() {
        Connection conn = null;
        try{
            //装载数据库驱动
            System.out.println(dbURL);
            System.out.println(dbClassName);
            Class.forName(dbClassName).newInstance();
            conn= DriverManager.getConnection(dbURL);
        }catch (Exception e){
            e.printStackTrace();
        }
        if(conn == null) {
            System.err.println("警告：DriverManager.getConnection()获取数据库链接失败。"
                    + "\r\n\r\n链接类型："+dbClassName+"\r\n链接位置："+dbURL);
        }
        return conn;
    }

    /**
     * 执行查询语句，返回结果集
     * @param sql 查询语句
     * @return 查询结果集
     */
    public ResultSet executeQuery(String sql) {
        conn = getConnection();
        try {
            //创建用于执行SQL语句的statement对象
            statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            resultSet = statement.executeQuery(sql);
        } catch (SQLException e){
            e.printStackTrace();
        }
        return resultSet;
    }

    /**
     * 执行更新语句
     * @param sql 更新语句
     * @return 更新的行数
     */
    public int executeUpdate(String sql) {
        int result = 0;
        conn = getConnection();
        try{
            statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            result = statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            statement.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public  void close() {
        try{
            if(resultSet!=null) {
                resultSet.close();
            }
            if(statement!=null) {
                statement.close();
            }
            if(conn!=null) {
                conn.close();
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        ConnDB conn = new ConnDB();
        if(conn.getConnection()!=null) {
            System.out.println("连接成功");
        }
    }

}
