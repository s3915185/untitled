package com.example.mcp_untitled_server.userConfiguration;

import org.mapstruct.Mapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user-configuration")
class UserConfigurationController {
    private final UserConfigurationService userConfigurationService;

    @Autowired
    UserConfigurationController(UserConfigurationService userConfigurationService) {
        this.userConfigurationService = userConfigurationService;
    }

    @PostMapping
    public UserConfigurationDTO addNewConfiguration(@RequestBody UserConfigurationDTO newConfiguration) {
        return userConfigurationService.addNewConfiguration(newConfiguration);
    }

    @GetMapping
    public UserConfigurationDTO getConfigurationByUserInfoId(@RequestParam("userInfoId") Long userInfoId) {
        return userConfigurationService.getConfigurationByUserInfoId(userInfoId);
    }

    @DeleteMapping
    public boolean deleteCurrentConfigurationByUserInfoId(@RequestParam("userInfoId") Long userInfoId) {
        return userConfigurationService.deleteCurrentConfigurationByUserInfoId(userInfoId);
    }

    @PutMapping
    public UserConfigurationDTO modifyWithNewConfiguration(UserConfigurationDTO newModifiedConfiguration) {
        return userConfigurationService.modifyWithNewConfiguration(newModifiedConfiguration);
    }
}
