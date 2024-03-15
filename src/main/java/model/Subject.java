package model;

import java.util.ArrayList;

public class Subject {
    private int id, viewCount;
    private Semester semester;
    private String title, description, driveUrl, pictureUrl;
    private int price, compareAtPrice;

    private String saleRate;

    private ArrayList<Comment> commentList;

    private ArrayList<String> favTeacher;
    public Subject(int id, int viewCount, String title, String description, int price, int compareAtPrice) {
        this.id = id;
        this.viewCount = viewCount;
        this.title = title;
        this.description = description;
        this.price = price;
        this.compareAtPrice = compareAtPrice;
    }

    public Subject(int id, Semester semester, int viewCount, String title, String description, int price, int compareAtPrice) {
        this.id = id;
        this.semester = semester;
        this.viewCount = viewCount;
        this.title = title;
        this.description = description;
        this.price = price;
        this.compareAtPrice = compareAtPrice;
    }

    public Subject(int id, Semester semester, String title, String description, String driveUrl, String pictureUrl, int price, int compareAtPrice, String saleRate, ArrayList<Comment> commentList) {
        this.id = id;
        this.semester = semester;
        this.title = title;
        this.description = description;
        this.driveUrl = driveUrl;
        this.pictureUrl = pictureUrl;
        this.price = price;
        this.compareAtPrice = compareAtPrice;
        this.saleRate = saleRate;
        this.commentList = commentList;
    }

    public Subject(int id, int viewCount, String title, String description, String driveUrl, String pictureUrl, int price, int compareAtPrice, String saleRate, ArrayList<Comment> commentList) {
        this.id = id;
        this.viewCount = viewCount;
        this.title = title;
        this.description = description;
        this.driveUrl = driveUrl;
        this.pictureUrl = pictureUrl;
        this.price = price;
        this.compareAtPrice = compareAtPrice;
        this.saleRate = saleRate;
        this.commentList = commentList;
    }

    public int getViewCount() {
        return viewCount;
    }

    public void setCommentList(ArrayList<Comment> commentList) {
        this.commentList = commentList;
    }

    public Subject() {
    }

    public Subject(int id, String title, String description, int price, int compareAtPrice) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.price = price;
        this.compareAtPrice = compareAtPrice;
        this.saleRate = String.format("%.2f", ((double)(this.compareAtPrice - this.price) / this.compareAtPrice) * 100);
    }

    public Subject(int id, Semester semester, String title, String description, int price, int compareAtPrice) {
        this.id = id;
        this.semester = semester;
        this.title = title;
        this.description = description;
        this.price = price;
        this.compareAtPrice = compareAtPrice;
        this.saleRate = String.format("%.2f", ((double)(this.compareAtPrice - this.price) / this.compareAtPrice) * 100);
    }

    public Subject(int id, String title, String description, String driveUrl, String pictureUrl, int price, int compareAtPrice) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.driveUrl = driveUrl;
        this.pictureUrl = pictureUrl;
        this.price = price;
        this.compareAtPrice = compareAtPrice;
        this.saleRate = String.format("%.2f", ((double)(this.compareAtPrice - this.price) / this.compareAtPrice) * 100);
    }

    public void setFavTeacher(ArrayList<String> favTeacher) {
        this.favTeacher = favTeacher;
    }

    public String getSaleRate() {
        return saleRate;
    }
    public String getDriveUrl() {
        return driveUrl;
    }

    public String getPictureUrl() {
        return pictureUrl;
    }

    public int getId() {
        return id;
    }

    public Semester getSemester() {
        return semester;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public int getPrice() {
        return price;
    }

    public int getCompareAtPrice() {
        return compareAtPrice;
    }
}
