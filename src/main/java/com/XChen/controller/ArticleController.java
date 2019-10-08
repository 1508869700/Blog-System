package com.XChen.controller;

import com.XChen.model.Article;
import com.XChen.model.Blogger;
import com.XChen.model.Category;
import com.XChen.model.Comment;
import com.XChen.model.User;
import com.XChen.service.ArticleService;
import com.XChen.service.BloggerService;
import com.XChen.service.UserService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import javax.annotation.Resource;
import javax.jws.WebParam.Mode;
import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.tautua.markdownpapers.Markdown;
import org.tautua.markdownpapers.parser.ParseException;

@Controller
public class ArticleController {

  @Resource
  private ArticleService articleService;
  @Resource
  private BloggerService bloggerService;
  @Resource
  private UserService userService;


  @RequestMapping("/")
  public String first(Model model) {
    return "views/first";
  }

  @RequestMapping("/views")
  public String index(Model model,HttpSession session) {
    List<Article> articles = articleService.getFirst10Article();
    model.addAttribute("articles", articles);
    List<Category> categories = articleService.getCategories();
    session.setAttribute("categories",categories);
    return "views/index";
  }


  @RequestMapping("/detail/{id}/{category}")
  public String detail(@PathVariable("id") int id, Model model, HttpSession session) {
    articleService.updateVisitByArticleId(id);
    Article article = articleService.getArticleById(id);
    Markdown markdown = new Markdown();
    try {
      StringWriter out = new StringWriter();
      markdown.transform(new StringReader(article.getContent()), out);
      out.flush();
      article.setContent(out.toString());
    } catch (ParseException e) {
      e.printStackTrace();
    }
    model.addAttribute("article", article);
    List<Comment> commentList = articleService.findCommentsByArticleId(id);
    model.addAttribute("commentList",commentList);

    String username = (String) session.getAttribute("username");
    if(username!=null)
    {
      return "views/afterdetail";
    }
    else
    {
      return "views/befordetail";
    }
  }

  @RequestMapping("/column/{category}")
  public String column(@PathVariable("category") String category,Model model)
  {
    model.addAttribute("category",category);
    model.addAttribute("articles", articleService.getArticlesByCategoryName(category));
    return "views/columnPage";
  }



  @RequestMapping("/toArticle")
  public String toArticle(@RequestParam int id,Model model)
  {
    Article article = articleService.getArticleById(id);
    model.addAttribute("article", article);
    List<Comment> commentList = articleService.findCommentsByArticleId(id);
    model.addAttribute("commentList",commentList);
    return "views/afterdetail";
  }




  @RequestMapping(value="/article/saveComment",method=RequestMethod.POST)
  public String saveComment(Comment comment){
    Integer forarticleid = comment.getForarticleid();
    articleService.saveComment(comment);
    String str = "redirect:/toArticle?id="+forarticleid;
    return str;

  }


  @RequestMapping("/userLogin")
  public void userLogin(Model model,HttpSession session,HttpServletResponse response,HttpServletRequest request)throws UnsupportedEncodingException, IOException, ServletException
  {
    response.setContentType("text/html;charset=utf-8");
    request.setCharacterEncoding("UTF-8");
    String username=request.getParameter("username");
    String password=request.getParameter("password");

    List<User> users = userService.getAllUser();
    for (User u:users
    ) {
      if(u.getUsername().equals(username) && u.getPassword().equals(password))
      {
        session.setAttribute("username",username);
        response.getWriter().print("1");
      }
    }
    response.getWriter().print("0");
  }

  @RequestMapping("/userRegister/{id}")
  public String userRegister(Model model,@PathVariable("id") int id, HttpSession session,User user) throws UnsupportedEncodingException
  {
    userService.userRegister(user);
    session.setAttribute("username",user.getUsername());
    String str = "forward:"+"/toArticle?id="+id;
    return str;
  }

  @RequestMapping("/usernameRegister")
  public void usernameRegister(HttpServletRequest request,HttpServletResponse response) throws IOException
  {
    String username = request.getParameter("username");
    List<User> users = userService.getAllUser();
    for (User u:users
    ) {
      if(u.getUsername().equals(username))
      {
        response.getWriter().print("0");
      }
    }

  }


  @RequestMapping("/comment/delete/{commentid}")
  public String deleteComment(@PathVariable("commentid") int commentid)
  {
    Integer articleid = articleService.findArticleidByCommentid(commentid);
    articleService.deleteComment(commentid);
    String str = "redirect:/toArticleManage?id=" + articleid;
    return str;
  }

}
