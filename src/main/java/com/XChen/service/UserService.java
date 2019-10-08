package com.XChen.service;

import com.XChen.dao.UserDao;
import com.XChen.model.User;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service
public class UserService {

  @Resource
  private UserDao userDao;

  public void userRegister(User user)
  {
    userDao.userRegister(user);
  }

  public List<User> getAllUser()
  {
    return userDao.getAllUser();
  }
}
