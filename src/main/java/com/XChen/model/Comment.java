package com.XChen.model;

public class Comment {
  private Integer  id;
  private String username;
  private String content;
  private String date;
  private Integer forarticleid;

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getDate() {
    return date;
  }

  public void setDate(String date) {
    this.date = date;
  }

  public Integer getForarticleid() {
    return forarticleid;
  }

  public void setForarticleid(Integer forarticleid) {
    this.forarticleid = forarticleid;
  }
}
