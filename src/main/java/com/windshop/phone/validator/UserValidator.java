package com.windshop.phone.validator;

import com.windshop.phone.entity.User;
import com.windshop.phone.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.regex.Pattern;

@Service
public class UserValidator implements Validator {
    @Autowired
    private IUserService IUserService;

    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;
        String regexPatternMail = "^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@"
                + "[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$";
        String regexPatternPass = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$";

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "NotEmpty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "NotEmpty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if (IUserService.findByEmail(user.getEmail()) != null) {
            errors.rejectValue("email", "Duplicate.userForm.email");
        }
        if(!Pattern.compile(regexPatternMail).matcher(user.getEmail()).matches()){
            errors.rejectValue("email", "Invalid.userForm.email");
        }
        if(!Pattern.compile(regexPatternPass).matcher(user.getPassword()).matches()){
            errors.rejectValue("password", "Invalid.userForm.password");
        }
        if (!user.getRePass().equals(user.getPassword())) {
            errors.rejectValue("rePass", "Diff.userForm.rePass");
        }

    }
}
