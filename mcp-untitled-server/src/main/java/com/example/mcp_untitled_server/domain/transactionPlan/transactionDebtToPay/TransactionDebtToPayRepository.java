package com.example.mcp_untitled_server.domain.transactionPlan.transactionDebtToPay;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface TransactionDebtToPayRepository extends JpaRepository<TransactionDebtToPay, Long>, TransactionDebtToPayRepositoryCustom {
}
