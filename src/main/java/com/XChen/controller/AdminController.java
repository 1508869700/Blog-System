package com.XChen.controller;

import com.XChen.model.Article;
import com.XChen.model.Blogger;
import com.XChen.model.Category;
import com.XChen.model.Comment;
import com.XChen.service.ArticleService;
import com.XChen.service.BloggerService;
import com.XChen.service.UserService;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {
  @Resource
  private ArticleService articleService;
  @Resource
  private BloggerService bloggerService;
  @Resource
  private UserService userService;

  private Category category;

  @RequestMapping("/blogger/login")
  public String login() {
    return "admin/login";
  }

  @RequestMapping(value = "/blogger/dologin", method = RequestMethod.POST)
  public String doLogin(HttpServletRequest request, Blogger blogger, Model model) {
    if (bloggerService.login(blogger.getAccount(), blogger.getPassword())) {
      return "redirect:/blogger";
    } else {
//      ？？？model和request有什么关系？
      model.addAttribute("error", "用户名或密码错误");
      return "admin/login";
    }
  }

  @RequestMapping("/blogger")
  public String admin(Model model) {
    model.addAttribute("articles", articleService.getFirst10Article());
    return "admin/index";
  }

  @RequestMapping("/blogger/write")
  public String write(Model model) {
    List<Category> categories = articleService.getCategories();
//    categories.remove(0);
    model.addAttribute("categories", categories);
    return "admin/write";
  }

  @RequestMapping(value = "/blogger/write",method = RequestMethod.POST)
  public String write(Article article)
  {
    articleService.writeBlog(article);
    return "redirect:/blogger";
  }

  @RequestMapping("/blogger/update/{id}")
  public String update(@PathVariable("id") int id,Model model)
  {
    Article article = articleService.getArticleById(id);
    model.addAttribute("article",article);
    return "admin/write";
  }

  @RequestMapping("/blogger/delete/{id}")
  public String delete(@PathVariable("id") int id)
  {
    articleService.deleteArticleById(id);
    return "redirect:/blogger";
  }

  @RequestMapping("/blogger/addCategory")
  public String addCategory(Category category)
  {
    articleService.addCategory(category);
    return "redirect:/blogger";
  }

  @RequestMapping("/toArticleManage")
  public String toArticleManage(@RequestParam int id,Model model)
  {
    Article article = articleService.getArticleById(id);
    model.addAttribute("article", article);
    List<Comment> commentList = articleService.findCommentsByArticleId(id);
    model.addAttribute("commentList",commentList);
    return "admin/detail";
  }
}
