package com.sheep.transfer.user.controller;

import com.sheep.transfer.user.usecase.UserUseCase;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
public class UserController {

    private final UserUseCase userUseCase;

    public UserController(UserUseCase userUseCase) {
        this.userUseCase = userUseCase;
    }

    @PostMapping("/v1/create-user")
    public String createUserController(@RequestBody UserRequest userRequest){

        System.out.println(userRequest.toString());

        userUseCase.createUserUserCase(userRequest);

        return "create user";
    }


}
