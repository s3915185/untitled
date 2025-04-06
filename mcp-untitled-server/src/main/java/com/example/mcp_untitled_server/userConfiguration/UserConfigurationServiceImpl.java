package com.example.mcp_untitled_server.userConfiguration;

import org.springframework.stereotype.Service;

@Service
class UserConfigurationServiceImpl implements UserConfigurationService {
    @Override
    public UserConfigurationDTO addNewConfiguration(UserConfigurationDTO newConfiguration) {
        return null;
    }

    @Override
    public boolean deleteCurrentConfigurationByUserInfoId(Long userInfoId) {
        return false;
    }

    @Override
    public UserConfigurationDTO modifyWithNewConfiguration(UserConfigurationDTO newModifiedConfiguration) {
        return null;
    }
}
