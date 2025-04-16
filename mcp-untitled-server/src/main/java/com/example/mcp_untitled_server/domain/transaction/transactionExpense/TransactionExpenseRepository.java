package com.example.mcp_untitled_server.domain.transaction.transactionExpense;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface TransactionExpenseRepository extends JpaRepository<TransactionExpense, Long>, TransactionExpenseRepositoryCustom {
}
