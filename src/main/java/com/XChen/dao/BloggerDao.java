package com.XChen.dao;

import com.XChen.model.Blogger;
import org.apache.ibatis.annotations.Param;

public interface BloggerDao {
  public Blogger getBlogger(@Param("account") int account,@Param("password") String password);
}
