package com.dao;

import com.model.member;
import com.utils.ConnDB;
import com.utils.chStr;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class memberDAO implements ImemberDAO {
    ConnDB conn = new ConnDB();
    chStr chStr = new chStr();
    @Override
    public int insert(member m) {
        int ret = 0;
        try{
            if(m.getUserName()!=null) {
                String sql = "Insert into member (userName,userEmail,userPhoneNumber,userPasswd,userProvince,userCity) values('"
                        +chStr.chStr(m.getUserName())+"','"
                        +chStr.chStr(m.getUserEmail())+"','"
                        +chStr.chStr(m.getUserPhoneNumber())+"','"
                        +m.getUserPasswd()+"','"
                        +chStr.chStr(m.getUserProvince())+"','"
                        +chStr.chStr(m.getUserCity())+"')";

                ret = conn.executeUpdate(sql);
            }else {
                //注册失败
                ret = -1;
            }
        }catch (Exception e){
            e.printStackTrace();
            ret = -1;
        }
        conn.close();
        return ret;
    }

    @Override
    public List select() {
        member form = null;
        String sql = "select * from member;";
        List list = new ArrayList();
        ResultSet rs = conn.executeQuery(sql);
        try{
            while(rs.next()){
                form = new member();
                form.setUserId(Integer.valueOf(rs.getString(1)));
                list.add(form);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        conn.close();
        return list;
    }

    @Override
    public int update(member m) {
        int ret = 0;
        try{
            String sql = "update member set userName='"
                    + chStr.chStr(m.getUserName())+"',userEmail='"
                    +chStr.chStr(m.getUserEmail())+"',userPhoneNumber='"
                    +chStr.chStr(m.getUserPhoneNumber())+"',userProvince='"
                    +chStr.chStr(m.getUserProvince())+"',userCity='"
                    +chStr.chStr(m.getUserCity())+"'where userId="
                    +m.getUserId();
            ret=conn.executeUpdate(sql);
        }catch (Exception e){
            e.printStackTrace();
            ret = -1;
        }
        conn.close();
        return ret;
    }

    @Override
    public int delete(member m) {
        String sql = "delect from member where userId="+m.getUserId();
        int ret = conn.executeUpdate(sql);
        return ret;
    }

    @Override
    public member select1() {
        return null;
    }

    public static void main(String[] args) {
        member test = new member();
        test.setAll("silver","1038516368@qq.com","17327821282","123456","江苏","泰州");
        memberDAO mDAO = new memberDAO();
        mDAO.insert(test);

    }
}
