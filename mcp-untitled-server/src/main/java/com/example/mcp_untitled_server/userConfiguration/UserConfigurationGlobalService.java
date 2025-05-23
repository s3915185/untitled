package com.example.mcp_untitled_server.userConfiguration;

import java.util.List;

public interface UserConfigurationGlobalService {
    UserConfigurationDTO addNewConfiguration(UserConfigurationDTO newConfiguration);

    UserConfigurationDTO getConfigurationByUserInfoId(Long userInfoId);

    boolean deleteCurrentConfigurationByUserInfoId(Long userInfoId);

    UserConfigurationDTO modifyWithNewConfiguration(UserConfigurationDTO newModifiedConfiguration);
}
