package com.example.mcp_untitled_server.domain.identifant.userConfiguration;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface UserConfigurationRepository extends JpaRepository<UserConfiguration, Long>, UserConfigurationRepositoryCustom {
}
