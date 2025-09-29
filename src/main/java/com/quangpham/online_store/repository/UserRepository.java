package com.quangpham.online_store.repository;

import com.quangpham.online_store.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {
    User save(User user);
    User findById(long id);
    List<User> findAll();
    List<User> findByEmail(String email);
}
