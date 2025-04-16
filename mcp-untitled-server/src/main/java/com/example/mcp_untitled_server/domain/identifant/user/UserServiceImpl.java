package com.example.mcp_untitled_server.domain.identifant.user;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
class UserServiceImpl implements UserService {
    private final UserRepository userRepository;
}
