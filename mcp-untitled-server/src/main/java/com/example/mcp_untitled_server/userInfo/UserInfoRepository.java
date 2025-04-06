package com.example.mcp_untitled_server.userInfo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface UserInfoRepository extends JpaRepository<UserInfo, Long>, UserInfoRepositoryCustom {
}
