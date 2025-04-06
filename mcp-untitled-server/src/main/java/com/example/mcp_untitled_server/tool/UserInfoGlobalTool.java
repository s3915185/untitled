package com.example.mcp_untitled_server.tool;

import com.example.mcp_untitled_server.userInfo.UserInfoDTO;
import com.example.mcp_untitled_server.userInfo.UserInfoGlobalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserInfoGlobalTool {

    private final UserInfoGlobalService userInfoGlobalService;

    @Autowired
    public UserInfoGlobalTool(UserInfoGlobalService userInfoGlobalService) {
        this.userInfoGlobalService = userInfoGlobalService;
    }

    public UserInfoDTO addNewAccount(UserInfoDTO newUser) {
        return userInfoGlobalService.addNewAccount(newUser);
    }

    public UserInfoDTO modifyAccount(UserInfoDTO modifiedAccount) {
        return userInfoGlobalService.modifyAccount(modifiedAccount);
    }
}
