package com.utils;

import com.model.goods;
import com.model.member;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ConvertList {
    public static List<goods> goodsConvertList(ResultSet rs, goods g) {
        List<goods> ret = new ArrayList<>();
        try {
            while (rs.next()) {
                g.setGoods_id(rs.getInt("goods_id"));
                g.setGoods_name(rs.getString("goods_name"));
                g.setGoods_image("http://localhost:8080/EMedicine/" + rs.getString("goods_image"));
                g.setGoods_supplier(rs.getString("goods_supplier"));
                g.setGoods_markedPrice(rs.getDouble("goods_markedPrice"));
                g.setGoods_currentPrice(rs.getDouble("goods_currentPrice"));
                goods currG = new goods(g);
                ret.add(currG);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ret;
    }

    public static List<member> memberConvertList(ResultSet rs, member m){
        List<member> ret = new ArrayList<>();
        try{
            while(rs.next()){
                m.setUserId(rs.getInt("userId"));
                m.setUserName(rs.getString("userName"));
                m.setUserEmail(rs.getString("userEmail"));
                m.setUserPasswd(rs.getString("userPasswd"));
                m.setUserPhoneNumber(rs.getString("userPhoneNumber"));
                m.setUserProvince(rs.getString("userProvince"));
                m.setUserCity(rs.getString("userCity"));
                member currM = new member(m);
                ret.add(currM);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return ret;
    }
}
