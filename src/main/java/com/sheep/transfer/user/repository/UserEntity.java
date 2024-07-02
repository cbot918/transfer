package com.sheep.transfer.user.repository;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class UserEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="username",nullable=false)
    private String username;

    @Column(name="full_name", nullable=false)
    private String fullName;

    @Column(name="email", nullable=false)
    private String email;

    @Column(name="hashed_password", nullable=false)
    private String hashedPassword;
}
