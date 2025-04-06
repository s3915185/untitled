package com.example.mcp_untitled_server.userInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user-info")
class UserInfoController {
    private final UserInfoService userInfoService;

    @Autowired
    public UserInfoController(UserInfoService userInfoService) {
        this.userInfoService = userInfoService;
    }

    @PostMapping
    public UserInfoDTO addNewAccount(@RequestBody UserInfoDTO newUser) {
        return userInfoService.addNewAccount(newUser);
    }

    @PutMapping
    public UserInfoDTO modifyAccount(@RequestBody UserInfoDTO modifiedAccount) {
        return userInfoService.modifyAccount(modifiedAccount);
    }
}
