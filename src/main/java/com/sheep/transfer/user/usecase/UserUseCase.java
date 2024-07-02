package com.sheep.transfer.user.usecase;

import com.sheep.transfer.user.controller.UserRequest;
import com.sheep.transfer.user.controller.UserResponse;

public interface UserUseCase {
    UserResponse createUserUserCase(UserRequest userRequest);
}
