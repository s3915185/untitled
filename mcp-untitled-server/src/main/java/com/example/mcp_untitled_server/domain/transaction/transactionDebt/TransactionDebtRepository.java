package com.example.mcp_untitled_server.domain.transaction.transactionDebt;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface TransactionDebtRepository extends JpaRepository<TransactionDebt, Long>, TransactionDebtRepositoryCustom {
}
