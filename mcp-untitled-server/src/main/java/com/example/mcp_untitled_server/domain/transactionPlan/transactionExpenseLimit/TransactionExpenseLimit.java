package com.example.mcp_untitled_server.domain.transactionPlan.transactionExpenseLimit;

import com.example.mcp_untitled_server.base.AbstractAuditableEntity;
import jakarta.persistence.AttributeOverride;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;


@Data
@Entity
@Table(name = "TRANSACTION_EXPENSE_LIMIT")
@AttributeOverride(name = "id", column = @Column(name = "TRANSACTION_EXPENSE_LIMIT_ID"))
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
class TransactionExpenseLimit extends AbstractAuditableEntity {

    @NotNull
    @Column(name = "MONTHLY_FINANCIAL_SUMMARY_ID")
    private Long monthlyFinancialSummaryId;

    @NotNull
    @Column(name = "TRANSACTION_CATEGORY_ID")
    private Long transactionCategoryId;

    @NotNull
    @Column(name = "AMOUNT")
    private BigDecimal amount;
}