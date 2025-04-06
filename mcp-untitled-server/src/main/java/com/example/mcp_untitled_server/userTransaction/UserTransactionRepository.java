package com.example.mcp_untitled_server.userTransaction;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface UserTransactionRepository extends JpaRepository<UserTransaction, Long>, UserTransactionRepositoryCustom {
}
