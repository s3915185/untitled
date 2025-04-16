package com.example.mcp_untitled_server.domain.transactionPlan.monthlyFinancialSummary;

import com.example.mcp_untitled_server.base.AbstractAuditableEntity;
import jakarta.persistence.AttributeOverride;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.time.YearMonth;


@Data
@Entity
@Table(name = "MONTHLY_FINANCIAL_SUMMARY")
@AttributeOverride(name = "id", column = @Column(name = "MONTHLY_FINANCIAL_SUMMARY_ID"))
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
class MonthlyFinancialSummary extends AbstractAuditableEntity {

    @NotNull
    @Column(name = "USER_ID")
    private Long userId;

    @NotNull
    @Column(name = "MONTH_AND_YEAR")
    YearMonth monthAndYear;

    @NotNull
    @Column(name = "TRANSACTION_EXPENSE_LIMIT")
    private BigDecimal transactionExpenseLimit;

    @NotNull
    @Column(name = "TRANSACTION_DEBT_TO_PAY")
    private BigDecimal transactionDebtToPay;

    @NotNull
    @Column(name = "TRANSACTION_INVEST_TO_SAVE")
    private BigDecimal transactionInvestToSave;
}
