package com.windshop.phone.service;

import com.windshop.phone.entity.User;

public interface IUserService {
    void save(User user);

    User findByEmail(String email);
}
