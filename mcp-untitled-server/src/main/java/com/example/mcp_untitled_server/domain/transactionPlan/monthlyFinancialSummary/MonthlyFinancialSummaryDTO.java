package com.example.mcp_untitled_server.domain.transactionPlan.monthlyFinancialSummary;

import lombok.*;
import java.math.BigDecimal;
import java.time.YearMonth;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class MonthlyFinancialSummaryDTO {
    private Long id;
    private Long userId;
    YearMonth monthAndYear;
    private BigDecimal transactionExpenseLimit;
    private BigDecimal transactionDebtToPay;
    private BigDecimal transactionInvestToSave;
}
