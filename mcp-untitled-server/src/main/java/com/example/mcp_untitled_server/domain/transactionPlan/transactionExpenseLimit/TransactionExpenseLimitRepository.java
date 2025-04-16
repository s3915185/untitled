package com.example.mcp_untitled_server.domain.transactionPlan.transactionExpenseLimit;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface TransactionExpenseLimitRepository extends JpaRepository<TransactionExpenseLimit, Long>, TransactionExpenseLimitRepositoryCustom {
}
