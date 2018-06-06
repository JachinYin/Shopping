package com.jachin.shopping.po;

import org.springframework.stereotype.Repository;

@Repository
public class Cart {
    private Integer cartid;

    private Integer userid;

    private Integer bookid;

    private Integer count;

    private Double price;

    public Integer getCartid() {
        return cartid;
    }

    public void setCartid(Integer cartid) {
        this.cartid = cartid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getBookid() {
        return bookid;
    }

    public void setBookid(Integer bookid) {
        this.bookid = bookid;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "cartid=" + cartid +
                ", userid=" + userid +
                ", bookid=" + bookid +
                ", count=" + count +
                ", price=" + price +
                '}';
    }
}