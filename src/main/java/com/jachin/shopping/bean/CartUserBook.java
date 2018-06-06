package com.jachin.shopping.bean;

import com.jachin.shopping.po.Book;

public class CartUserBook {
    private Book book;
    private Integer cartid;
    private Integer userid;
    private Integer count;
    private Double price;

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

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

    public CartUserBook(Book book, Integer cartid, Integer userid, Integer count, Double price) {
        this.book = book;
        this.cartid = cartid;
        this.userid = userid;
        this.count = count;
        this.price = price;
    }

    @Override
    public String toString() {
        return "CartUserBook{" +
                "book=" + book +
                ", cartid=" + cartid +
                ", userid=" + userid +
                ", count=" + count +
                ", price=" + price +
                '}';
    }
}
