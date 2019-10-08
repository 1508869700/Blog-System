package com.XChen.dao;

import com.XChen.model.Article;
import com.XChen.model.Category;
import com.XChen.model.Comment;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


public interface ArticleDao {
  public List<Article> getFirst10Article();

  public Article getArticleById(@Param("id") int id);

  public List<Article> getArticlesByCategoryName(String category);

  public void writeBlog(Article article);

  public List<Category> getCategories();

  public List<Comment> findCommentsByArticleId(Integer id);

  public void saveComment(Comment comment);

  public void deleteComment(Integer id);

  public Integer findArticleidByCommentid(Integer id);

  public void deleteArticleById(Integer id);

  public void updateVisitByArticleId(Integer id);

  public void addCategory(Category category);
}
