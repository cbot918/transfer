package com.sheep.transfer.user.controller;


public record UserRequest(String email,String username, String fullName, String password) {

}
