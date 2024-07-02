package com.sheep.transfer.user.repository;

import org.springframework.stereotype.Service;

@Service
public class UserDaoImpl implements UserDao {
    private final UserRepository userRepository;

    public UserDaoImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserEntity createUserDao(UserEntity userEntity) {
        try {
            userRepository.save(userEntity);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return userEntity;
    }
}
