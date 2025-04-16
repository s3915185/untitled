package com.example.mcp_untitled_server.domain.transaction.transactionExpenseRecurrent;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface TransactionExpenseRecurrentRepository extends JpaRepository<TransactionExpenseRecurrent, Long>, TransactionExpenseRecurrentRepositoryCustom {
}
