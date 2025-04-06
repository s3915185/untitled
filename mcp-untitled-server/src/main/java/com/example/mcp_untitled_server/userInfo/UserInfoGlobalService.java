package com.example.mcp_untitled_server.userInfo;

public interface UserInfoGlobalService {
    UserInfoDTO addNewAccount(UserInfoDTO newUser);

    UserInfoDTO modifyAccount(UserInfoDTO modifiedAccount);
}
