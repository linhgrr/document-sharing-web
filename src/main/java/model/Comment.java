package model;

public class Comment {
    private int id, userId, likeNum;
    private String content, firstName, lastName;

    public Comment(int id, int userId, int likeNum, String content, String firstName, String lastName) {
        this.id = id;
        this.userId = userId;
        this.likeNum = likeNum;
        this.content = content;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public int getId() {
        return id;
    }

    public int getUserId() {
        return userId;
    }

    public int getLikeNum() {
        return likeNum;
    }

    public String getContent() {
        return content;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }
}
