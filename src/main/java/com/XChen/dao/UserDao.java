package com.XChen.dao;

import com.XChen.model.User;
import java.util.List;

public interface UserDao {
  public void userRegister(User user);

  public List<User> getAllUser();
}
