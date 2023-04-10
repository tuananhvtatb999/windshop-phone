package com.windshop.phone.repository;

import com.windshop.phone.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {
    User findByEmail(String email);
    Page<User> findByStatus(Integer status, Pageable pageable);
}
