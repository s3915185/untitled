package com.example.mcp_untitled_server.tool;

import com.example.mcp_untitled_server.userConfiguration.UserConfigurationDTO;
import com.example.mcp_untitled_server.userConfiguration.UserConfigurationGlobalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserConfigurationGlobalTool {
    private final UserConfigurationGlobalService userConfigurationGlobalService;

    @Autowired
    public UserConfigurationGlobalTool(UserConfigurationGlobalService userConfigurationGlobalService) {
        this.userConfigurationGlobalService = userConfigurationGlobalService;
    }

    public UserConfigurationDTO addNewConfiguration(UserConfigurationDTO newConfiguration) {
        return userConfigurationGlobalService.addNewConfiguration(newConfiguration);
    }

    public boolean deleteCurrentConfigurationByUserInfoId(Long userInfoId) {
        return userConfigurationGlobalService.deleteCurrentConfigurationByUserInfoId(userInfoId);
    }

    public UserConfigurationDTO modifyWithNewConfiguration(UserConfigurationDTO newModifiedConfiguration) {
        return userConfigurationGlobalService.modifyWithNewConfiguration(newModifiedConfiguration);
    }
}
