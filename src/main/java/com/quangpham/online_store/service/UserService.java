package com.quangpham.online_store.service;

import com.quangpham.online_store.domain.User;
import com.quangpham.online_store.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public String handleHello()
    {
        return "Anyonghaseyo from service";
    }

    public User handleSaveUser(User user)
    {
        User save = this.userRepository.save(user);
        return save;
    }

    public List<User> getAllUserByEmail(String email)
    {
        return this.userRepository.findByEmail(email);
    }

    public List<User> handleFindAll()
    {
        List<User> all = this.userRepository.findAll();
        return all;
    }

   public User  handleFindById(long id)
    {
        return this.userRepository.findById(id);
    }

    public void deteleUserbyId(long id)
    {
        this.userRepository.deleteById(id);
    }
}
