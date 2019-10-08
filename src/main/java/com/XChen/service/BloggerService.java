package com.XChen.service;

import com.XChen.dao.BloggerDao;
import com.XChen.model.Blogger;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

@Service
public class BloggerService {
  @Resource
  private BloggerDao bloggerDao;

  public boolean login(int account,String password)
  {
    Blogger blogger = bloggerDao.getBlogger(account, password);
    if(blogger == null)
      return false;
    else
      return true;
  }
}
