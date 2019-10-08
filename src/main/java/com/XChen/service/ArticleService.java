package com.XChen.service;

import com.XChen.dao.ArticleDao;
import com.XChen.model.Article;
import com.XChen.model.Category;
import com.XChen.model.Comment;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service
public class ArticleService {

  @Resource
  private ArticleDao articleDao;

  public List<Article> getFirst10Article()
  {
    return articleDao.getFirst10Article();
  }

  public Article getArticleById(int id)
  {
    return articleDao.getArticleById(id);
  }

  public List<Article> getArticlesByCategoryName(String category)
  {
    return articleDao.getArticlesByCategoryName(category);
  }

  public void writeBlog(Article article)
  {
    article.setSummary(article.getContent().substring(0, 100)+"...........");
    articleDao.writeBlog(article);
  }

  public List<Category> getCategories()
  {
    return articleDao.getCategories();
  }

  public List<Comment> findCommentsByArticleId(Integer id)
  {
    return articleDao.findCommentsByArticleId(id);
  }

  public void saveComment(Comment comment)
  {
    articleDao.saveComment(comment);
  }

  public void deleteComment(Integer id)
  {
    articleDao.deleteComment(id);
  }

  public Integer findArticleidByCommentid(Integer id)
  {
    return articleDao.findArticleidByCommentid(id);
  }

  public void deleteArticleById(Integer id)
  {
    articleDao.deleteArticleById(id);
  }

  public void updateVisitByArticleId(Integer id)
  {
    articleDao.updateVisitByArticleId(id);
  }

  public void addCategory(Category category)
  {
    articleDao.addCategory(category);
  }
}
