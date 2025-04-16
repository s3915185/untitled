package com.example.mcp_untitled_server.domain.transactionPlan.monthlyFinancialSummary;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
class MonthlyFinancialSummaryServiceImpl implements MonthlyFinancialSummaryService {
    private final MonthlyFinancialSummaryRepository monthlyFinancialSummaryRepository;
}
