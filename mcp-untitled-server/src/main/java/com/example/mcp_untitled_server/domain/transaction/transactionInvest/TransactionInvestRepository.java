package com.example.mcp_untitled_server.domain.transaction.transactionInvest;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface TransactionInvestRepository extends JpaRepository<TransactionInvest, Long>, TransactionInvestRepositoryCustom {
}
