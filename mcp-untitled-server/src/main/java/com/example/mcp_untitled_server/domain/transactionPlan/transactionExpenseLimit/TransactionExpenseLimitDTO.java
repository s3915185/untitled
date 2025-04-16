package com.example.mcp_untitled_server.domain.transactionPlan.transactionExpenseLimit;

import jakarta.persistence.Column;
import lombok.*;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class TransactionExpenseLimitDTO {
    private Long id;
    private Long monthlyFinancialSummaryId;
    private Long transactionCategoryId;
    private BigDecimal amount;
}
