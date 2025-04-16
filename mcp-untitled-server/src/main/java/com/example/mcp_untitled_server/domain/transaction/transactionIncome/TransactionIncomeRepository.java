package com.example.mcp_untitled_server.domain.transaction.transactionIncome;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface TransactionIncomeRepository extends JpaRepository<TransactionIncome, Long>, TransactionIncomeRepositoryCustom {
}
