package com.example.mcp_untitled_server.domain.identifant.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface UserRepository extends JpaRepository<User, Long>, UserRepositoryCustom {
}
