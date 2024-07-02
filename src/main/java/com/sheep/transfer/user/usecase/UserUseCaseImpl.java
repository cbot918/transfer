package com.sheep.transfer.user.usecase;

import com.sheep.transfer.user.controller.UserRequest;
import com.sheep.transfer.user.controller.UserResponse;
import com.sheep.transfer.user.repository.UserDao;
import com.sheep.transfer.user.repository.UserEntity;
import org.springframework.stereotype.Service;

@Service
public class UserUseCaseImpl implements UserUseCase {

    private final UserDao userDao;

    public UserUseCaseImpl(UserDao userDao) {
        this.userDao = userDao;
    }


    @Override
    public UserResponse createUserUserCase(UserRequest userRequest) {

        UserEntity userEntity = new UserEntity();
        userEntity.setUsername(userRequest.username());
        userEntity.setFullName(userRequest.fullName());
        userEntity.setEmail(userRequest.email());
        userEntity.setHashedPassword(userRequest.password());
        System.out.println("User: " + userEntity);
        try {
            userDao.createUserDao(userEntity);
        } catch(Exception e) {
            e.printStackTrace();
        }


        return new UserResponse();
    }
}
