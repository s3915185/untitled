package com.example.mcp_untitled_server.domain.transactionPlan.transactionInvestToSave;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface TransactionInvestToSaveRepository extends JpaRepository<TransactionInvestToSave, Long>, TransactionInvestToSaveRepositoryCustom {
}
