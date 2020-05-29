package com.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class goods implements Comparable<goods> {
    private Integer goods_id = 0;
    private String goods_name = "";
    private String goods_supplier = "";
    private String goods_image= "";
    private Double goods_markedPrice = 0.0;
    private Double goods_currentPrice = 0.0;

    public goods(){}

    public  goods(goods g){
        this.goods_id = g.getGoods_id();
        this.goods_name = g.getGoods_name();
        this.goods_supplier = g.getGoods_supplier();
        this.goods_image = g.getGoods_image();
        this.goods_markedPrice = g.getGoods_markedPrice();
        this.goods_currentPrice = g.getGoods_currentPrice();
    }

    public goods(String goods_name,String goods_image,Double goods_currentPrice){
        this.goods_name = goods_name;
        this.goods_image = goods_image;
        this.goods_currentPrice = goods_currentPrice;
    }

    public Integer getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(Integer goods_id) {
        this.goods_id = goods_id;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public String getGoods_supplier() {
        return goods_supplier;
    }

    public void setGoods_supplier(String goods_supplier) {
        this.goods_supplier = goods_supplier;
    }

    public Double getGoods_markedPrice() {
        return goods_markedPrice;
    }

    public void setGoods_markedPrice(Double goods_markedPrice) {
        this.goods_markedPrice = goods_markedPrice;
    }

    public Double getGoods_currentPrice() {
        return goods_currentPrice;
    }

    public void setGoods_currentPrice(Double goods_currentPrice) {
        this.goods_currentPrice = goods_currentPrice;
    }

    public String getGoods_image() {
        return goods_image;
    }

    public void setGoods_image(String goods_image) {
        this.goods_image = goods_image;
    }



    /**
     * Compares this object with the specified object for order.  Returns a
     * negative integer, zero, or a positive integer as this object is less
     * than, equal to, or greater than the specified object.
     *
     * <p>The implementor must ensure <tt>sgn(x.compareTo(y)) ==
     * -sgn(y.compareTo(x))</tt> for all <tt>x</tt> and <tt>y</tt>.  (This
     * implies that <tt>x.compareTo(y)</tt> must throw an exception iff
     * <tt>y.compareTo(x)</tt> throws an exception.)
     *
     * <p>The implementor must also ensure that the relation is transitive:
     * <tt>(x.compareTo(y)&gt;0 &amp;&amp; y.compareTo(z)&gt;0)</tt> implies
     * <tt>x.compareTo(z)&gt;0</tt>.
     *
     * <p>Finally, the implementor must ensure that <tt>x.compareTo(y)==0</tt>
     * implies that <tt>sgn(x.compareTo(z)) == sgn(y.compareTo(z))</tt>, for
     * all <tt>z</tt>.
     *
     * <p>It is strongly recommended, but <i>not</i> strictly required that
     * <tt>(x.compareTo(y)==0) == (x.equals(y))</tt>.  Generally speaking, any
     * class that implements the <tt>Comparable</tt> interface and violates
     * this condition should clearly indicate this fact.  The recommended
     * language is "Note: this class has a natural ordering that is
     * inconsistent with equals."
     *
     * <p>In the foregoing description, the notation
     * <tt>sgn(</tt><i>expression</i><tt>)</tt> designates the mathematical
     * <i>signum</i> function, which is defined to return one of <tt>-1</tt>,
     * <tt>0</tt>, or <tt>1</tt> according to whether the value of
     * <i>expression</i> is negative, zero or positive.
     *
     * @param o the object to be compared.
     * @return a negative integer, zero, or a positive integer as this object
     * is less than, equal to, or greater than the specified object.
     * @throws NullPointerException if the specified object is null
     * @throws ClassCastException   if the specified object's type prevents it
     *                              from being compared to this object.
     */
    @Override
    public int compareTo(goods o) {
        if(this.getGoods_currentPrice().equals(o.getGoods_currentPrice())){
            return 0;
        }else {
            if (this.getGoods_currentPrice()-o.getGoods_currentPrice()>0){
                return 1;
            }else {
                return -1;
            }
        }
    }

    public static void main(String[] args) {
        List<goods> list = new ArrayList<>();
        //g4,g1,g3,g2
        goods g1 = new goods();
        g1.setGoods_name("g1");
        g1.setGoods_currentPrice(1.0);
        list.add(g1);
        goods g2 = new goods();
        g2.setGoods_name("g2");
        g2.setGoods_currentPrice(3.0);
        list.add(g2);
        goods g3 = new goods();
        g3.setGoods_name("g3");
        g3.setGoods_currentPrice(2.0);
        list.add(g3);
        goods g4 = new goods();
        g4.setGoods_name("g4");
        g4.setGoods_currentPrice(0.0);
        list.add(g4);

        Collections.sort(list);
        for (int i=0;i<list.size();i++){
            System.out.println(list.get(i).getGoods_name());
        }
    }
}
