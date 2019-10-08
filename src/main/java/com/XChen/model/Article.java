package com.XChen.model;

public class Article {
  private Integer id;
  private String title;
  private String summary;
  private  String content;
  private String category;
  private Integer visit;

  public Integer getVisit() {
    return visit;
  }

  public void setVisit(Integer visit) {
    this.visit = visit;
  }

  public String getCategory() {
    return category;
  }

  public void setCategory(String category) {
    this.category = category;
  }

  public long getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getSummary() {
    return summary;
  }

  public void setSummary(String summary) {
    this.summary = summary;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }
}
