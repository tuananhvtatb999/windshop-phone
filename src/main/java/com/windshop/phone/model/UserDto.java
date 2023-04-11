package com.windshop.phone.model;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
public class UserDto {

    private String firstName;
    private String lastName;
    private String address;
    private String phoneNumber;
    private String email;
    private MultipartFile image;
}