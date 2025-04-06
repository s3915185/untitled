package com.example.mcp_untitled_server.userConfiguration;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
interface UserConfigurationRepository extends JpaRepository<UserConfiguration, Long>, UserConfigurationRepositoryCustom {
    boolean existsByUserInfoId(Long userInfoId);

    void deleteByUserInfoId(Long userInfoId);

    Optional<UserConfiguration> findByUserInfoId(Long userInfoId);
}
