package com.example.mcp_untitled_server.domain.identifant.userConfiguration;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
class UserConfigurationServiceImpl implements UserConfigurationService {
    private final UserConfigurationRepository userConfigurationRepository;
}
