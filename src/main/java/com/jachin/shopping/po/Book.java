package com.jachin.shopping.po;

import org.springframework.stereotype.Repository;

@Repository
public class Book {
    private Integer bookid;

    private String name;

    private String intro;

    private String author;

    private Double price;

    private String kind;

    private String cover;

    private Integer inventory;

    public Integer getBookid() {
        return bookid;
    }

    public void setBookid(Integer bookid) {
        this.bookid = bookid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro == null ? null : intro.trim();
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind == null ? null : kind.trim();
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover == null ? null : cover.trim();
    }

    public Integer getInventory() {
        return inventory;
    }

    public void setInventory(Integer inventory) {
        this.inventory = inventory;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookid=" + bookid +
                ", name='" + name + '\'' +
                ", intro='" + intro + '\'' +
                ", author='" + author + '\'' +
                ", price=" + price +
                ", kind='" + kind + '\'' +
                ", cover='" + cover + '\'' +
                ", inventory=" + inventory +
                '}';
    }

    public Book() {
    }

    public Book(String name, String intro, String author, Double price, String kind, String cover, Integer inventory) {
        this.name = name;
        this.intro = intro;
        this.author = author;
        this.price = price;
        this.kind = kind;
        this.cover = cover;
        this.inventory = inventory;
    }
}