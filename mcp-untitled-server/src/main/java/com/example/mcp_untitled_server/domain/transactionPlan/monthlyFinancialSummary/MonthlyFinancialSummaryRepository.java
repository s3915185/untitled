package com.example.mcp_untitled_server.domain.transactionPlan.monthlyFinancialSummary;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface MonthlyFinancialSummaryRepository extends JpaRepository<MonthlyFinancialSummary, Long>, MonthlyFinancialSummaryRepositoryCustom {
}
