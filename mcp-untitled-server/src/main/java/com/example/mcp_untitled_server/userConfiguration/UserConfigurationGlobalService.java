package com.example.mcp_untitled_server.userConfiguration;

public interface UserConfigurationGlobalService {
    UserConfigurationDTO addNewConfiguration(UserConfigurationDTO newConfiguration);

    boolean deleteCurrentConfigurationByUserInfoId(Long userInfoId);

    UserConfigurationDTO modifyWithNewConfiguration(UserConfigurationDTO newModifiedConfiguration);
}
