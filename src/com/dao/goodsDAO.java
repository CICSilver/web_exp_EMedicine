package com.dao;

import com.model.goods;
import com.utils.ConnDB;
import com.utils.chStr;

public class goodsDAO implements IgoodsDAO {
    ConnDB conn = new ConnDB();
    chStr chstr = new chStr();
    @Override
    public int insert(goods g) {
        int ret = 0;
        try{
            String sql = "insert into goods(goods_name,goods_supplier,goods_image,goods_markedPrice,goods_currentPrice) values ('"+
                    chstr.chStr(g.getGoods_name())+"',"+
                    chstr.chStr(g.getGoods_supplier())+"',"+
                    g.getGoods_image()+"',"+
                    g.getGoods_markedPrice()+"',"+
                    g.getGoods_currentPrice()+"')";
            ret = conn.executeUpdate(sql);
        }catch (Exception e){
            e.printStackTrace();
            ret = -1;
        }
        conn.close();
        return ret;
    }

    @Override
    public int update(goods g) {
        int ret = 0;
        try{
            String sql = "update goods set goods_name='"
                    + chstr.chStr(g.getGoods_name())+"',goods_supplier='"
                    +chstr.chStr(g.getGoods_supplier())+ ",goods_image='"+
                    g.getGoods_image()+"',goods_markedPrice='"
                    +g.getGoods_markedPrice()+"',goods_currentPrice='"
                    +g.getGoods_currentPrice()+"'where goods_id="
                    +g.getGoods_id();
            ret = conn.executeUpdate(sql);
        }catch (Exception e) {
            e.printStackTrace();
            ret = -1;
        }
        conn.close();
        return ret;
    }

    @Override
    public int delete(goods g) {
        int ret = 0;
        String sql = "delect from goods where userId="+g.getGoods_id();
        ret = conn.executeUpdate(sql);
        conn.close();
        return ret;
    }
}
