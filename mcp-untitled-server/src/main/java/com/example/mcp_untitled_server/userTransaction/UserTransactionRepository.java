package com.example.mcp_untitled_server.userTransaction;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
interface UserTransactionRepository extends JpaRepository<UserTransaction, Long>, UserTransactionRepositoryCustom {
    List<UserTransaction> findAllByUserInfoId(Long userInfoId);
}
