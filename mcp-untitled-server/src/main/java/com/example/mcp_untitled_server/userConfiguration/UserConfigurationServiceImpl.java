package com.example.mcp_untitled_server.userConfiguration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
class UserConfigurationServiceImpl implements UserConfigurationService {
    private final UserConfigurationRepository userConfigurationRepository;

    @Autowired
    public UserConfigurationServiceImpl(UserConfigurationRepository userConfigurationRepository) {
        this.userConfigurationRepository = userConfigurationRepository;
    }

    @Override
    public UserConfigurationDTO addNewConfiguration(UserConfigurationDTO newConfiguration) {
        if (userConfigurationRepository.existsByUserInfoId(newConfiguration.getUserInfoId())) {
            return null;
        }
        return UserConfigurationMapper.INSTANCE.toDto(
                userConfigurationRepository.save(
                        UserConfigurationMapper.INSTANCE.toEntity(newConfiguration)
                )
        );
    }

    @Override
    public UserConfigurationDTO getConfigurationByUserInfoId(Long userInfoId) {
        UserConfiguration storedUserConfiguration = userConfigurationRepository.findByUserInfoId(userInfoId)
                .orElseThrow();
        return UserConfigurationMapper.INSTANCE.toDto(storedUserConfiguration);
    }

    @Override
    public boolean deleteCurrentConfigurationByUserInfoId(Long userInfoId) {
        if (userConfigurationRepository.existsByUserInfoId(userInfoId)) {
            userConfigurationRepository.deleteByUserInfoId(userInfoId);
            return true;
        }
        return false;
    }

    @Override
    public UserConfigurationDTO modifyWithNewConfiguration(UserConfigurationDTO newModifiedConfiguration) {
        UserConfiguration storedUserConfiguration = userConfigurationRepository.findByUserInfoId(newModifiedConfiguration.getUserInfoId())
                .orElseThrow();
        UserConfigurationMapper.INSTANCE.updateEntityFromDto(storedUserConfiguration, newModifiedConfiguration);
        return UserConfigurationMapper.INSTANCE.toDto(userConfigurationRepository.save(storedUserConfiguration));
    }
}
